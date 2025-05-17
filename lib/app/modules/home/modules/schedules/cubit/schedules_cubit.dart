import 'package:bloc/bloc.dart';
import 'package:mundi_flutter_platform_client_app/app/models/feedback.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/schedules/cubit/schedules_state.dart';

import '../../../../../models/schedule.dart';
import '../../../../../repository/schedule/i_schedule_repository.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  final IScheduleRepository scheduleRepository;

  ScheduleCubit({required this.scheduleRepository})
      : super(const ScheduleState.initial());

  void setToInit() {
    emit(state.copyWith(status: ScheduleStatus.init));
  }

  Future<void> applyFilter(String filterText) async {
    print('apply');
    try {
      emit(state.copyWith(status: ScheduleStatus.loading));

      final newList = state.schedules!.where((Schedule element) {
        return element.modality.title
            .toLowerCase()
            .contains(filterText.toString().toLowerCase());
      }).toList();

      newList.sort((a, b) => DateTime.parse(a.scheduledDate).compareTo(DateTime.parse(b.scheduledDate)));

      print(newList);

      emit(state.copyWith(scheduleFiltered: newList, schedules: newList, status: ScheduleStatus.success));
    } catch (e) {
      state.copyWith(scheduleFiltered: state.schedules);
    }
  }

  Future<List<Schedule>?> loadSchedule() async {
    emit(
      state.copyWith(
        status: ScheduleStatus.loading,
        scheduleFiltered: null,
        schedules: null,
      ),
    );

    try {
      var schedules = await scheduleRepository.schedules();

      emit(state.copyWith(
          scheduleFiltered: schedules,
          schedules: schedules,
          status: ScheduleStatus.success));
      return schedules;
    } on Error {
      emit(state.copyWith(status: ScheduleStatus.error, scheduleFiltered: null,
        schedules: null,));
    }
    return null;
  }

  Future<void> cancelSchedule({
    required int scheduleId,
  }) async {
    try {
      emit(state.copyWith(status: ScheduleStatus.loading));

      await scheduleRepository.cancelSchedule(scheduleId);

      emit(state.copyWith(status: ScheduleStatus.success));
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendFeedback(Feedback feedback) async {
    await scheduleRepository.sendFeedback(feedback);
  }
}
