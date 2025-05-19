import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/extension/date_time_extension.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/extension/size_screen_extension.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/extension/string_extension.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/helpers/messages.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/colors_app.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/text_styles.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/widgets/app_button.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/widgets/calendar_picker.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/widgets/reserve_modal.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/widgets/reserve_tile.dart';
import 'package:mundi_flutter_platform_client_app/app/models/entrepreneur.dart';
import 'package:mundi_flutter_platform_client_app/app/models/modality.dart';
import 'package:mundi_flutter_platform_client_app/app/models/reservation.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/entrepreneur/modules/reserve/widgets/text_area.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'cubit/reserve_cubit.dart';
import 'cubit/reserve_state.dart';
import 'widgets/available_times_input.dart';

class ReservePageArguments {
  final Modality modality;
  final int entrepreneurId;
  final Entrepreneur entrepreneur;

  ReservePageArguments({required this.entrepreneurId, required this.modality, required this.entrepreneur});
}

class ReservePage extends StatefulWidget {
  final ReservePageArguments reservePageArguments;
  const ReservePage({super.key, required this.reservePageArguments});

  @override
  State<ReservePage> createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> with Messages<ReservePage> {
  late final _dateController = DateRangePickerController();
  List<String> availablesTimes = [];
  String selectedTime = '';

  @override
  void initState() {
    super.initState();
    _dateController.selectedDate = DateTime.now();
    _loadAvailableTimes(_dateController.selectedDate!);
  }

  void _loadAvailableTimes(DateTime selectedDate) {
    final formattedDate = selectedDate.toIso8601String().split('T').first; // Formata a data para "YYYY-MM-DD"
    ReadContext(context).read<ReserveCubit>().checkHour(entrepreneurId: widget.reservePageArguments.entrepreneurId, date: formattedDate);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReserveCubit, ReserveState>(
      listener: (context, state) {
        state.status.matchAny(
            any: () {},
            loaded: () {
              availablesTimes = state.checkHour!;
            },
            success: () async{
              final [hour, minute] = selectedTime.getHourAndMinuteFromAppTimeFormat;
              await ReserveModal.show(
                context,
                Reservation(
                    userId: 0,
                    entrepreneurId: widget.reservePageArguments.entrepreneurId,
                    modality: widget.reservePageArguments.modality,
                    startAt: _dateController.selectedDate!.fillHourAndMinute(
                      hour,
                      minute,
                    ),
                    entrepreneurPhone: "",
                    scheduleId: 0),
              );
              Modular.to.popUntil(
                ModalRoute.withName('/home/'),
              );// Atualiza a lista de horários disponíveis
              setState(() {}); // Atualiza a interface
            },
            error: () {
              showError(state.errorMessage ?? "Ops, Algo de inesperado aconteceu!");
            }
        );
      },
      builder: (context, state) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Image.asset(
            'assets/images/dark_logo.png',
            height: 32,
          ),
          automaticallyImplyLeading: false,
          centerTitle: false,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                      child: Center(
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Modular.to.pop();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: context.colors.secondary,
                                size: 20,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Fazer uma reserva",
                              style: context.textStyles.titleBold.copyWith(
                                color: context.colors.primary,
                                fontSize: 20,
                                height: .7,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        DateTime.now().year.toString(),
                        style: context.textStyles.titleBold.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CalendarPicker(
                      controller: _dateController,
                      minDate: DateTime.now(),
                      onSelectionChanged: (args) {
                        _loadAvailableTimes(args.value);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AvailableTimesInput(
                      availablesTimes: availablesTimes,
                      onSelectTime: (time) {
                        setState(() {
                          selectedTime = time;
                        });
                      },
                      selectedTime: selectedTime,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ReserveTile(
                      modality: widget.reservePageArguments.modality,
                      selectedTime: selectedTime,
                      selectedDate: _dateController.selectedDate!,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.add,
                          size: 25,
                          color: context.colors.secondary,
                        ),
                        Container(
                          width: .8.sw,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: context.colors.secondary,
                              width: .5,
                            ),
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          child: Text(
                            "Adicione mais serviços",
                            style: context.textStyles.titleBold.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextArea(),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 1.sw,
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.reservePageArguments.modality.getPrice(),
                          style: context.textStyles.titleBold.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "${widget.reservePageArguments.modality.getDuration()} MIN",
                          style: context.textStyles.titleBold.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                    AppButton(
                      width: .43.sw,
                      text: 'Reservar',
                      onPressed: () async {
                        if (selectedTime.isNotEmpty) {
                          final [hour, minute] = selectedTime.getHourAndMinuteFromAppTimeFormat;
                          ReadContext(context)
                              .read<ReserveCubit>()
                              .createReserve(
                              entrepreneurId: widget.reservePageArguments.entrepreneurId,
                              modalityId: widget.reservePageArguments.modality.id,
                              scheduledDate: _dateController.selectedDate!.fillHourAndMinute(hour, minute).toIso8601String());
                        } else {
                          showError('Escolha um horário para atendimento!');
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
