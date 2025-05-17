import 'package:flutter/material.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/extension/size_screen_extension.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/colors_app.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/text_styles.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalendarPicker extends StatelessWidget {
  final DateRangePickerController controller;
  final void Function(DateRangePickerSelectionChangedArgs args)
      onSelectionChanged;
  final DateTime? minDate;
  final DateTime? maxDate;
  const CalendarPicker({
    super.key,
    required this.controller,
    required this.onSelectionChanged,
    this.minDate,
    this.maxDate,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: .9.sw,
      child: SfDateRangePicker(
        controller: controller,
        view: DateRangePickerView.month,
        onSelectionChanged: onSelectionChanged,
        selectionMode: DateRangePickerSelectionMode.single,
        minDate: minDate,
        maxDate: maxDate,
        initialDisplayDate: DateTime.now(),
        initialSelectedDate: DateTime.now(),
        navigationMode: DateRangePickerNavigationMode.snap,
        selectionColor: context.colors.decorationPrimary,
        selectionShape: DateRangePickerSelectionShape.circle,
        showNavigationArrow: true,
        monthViewSettings: DateRangePickerMonthViewSettings(
          dayFormat: 'E',
          viewHeaderStyle: DateRangePickerViewHeaderStyle(
            textStyle: TextStyle(
              color: context.colors.decorationPrimary,
            ),
          ),
        ),
        allowViewNavigation: true,
        monthFormat: 'MMMM',
        headerStyle: DateRangePickerHeaderStyle(
          textAlign: TextAlign.center,
          textStyle: context.textStyles.titleBold.copyWith(
            color: context.colors.decorationPrimary,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
