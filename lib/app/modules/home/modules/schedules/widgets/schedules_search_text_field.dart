import 'package:flutter/material.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/text_styles.dart';

class SchedulesSearchTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String?) onChanged;
  const SchedulesSearchTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged
  });

  @override
  State<SchedulesSearchTextField> createState() =>
      _SchedulesSearchTextFieldState();
}

class _SchedulesSearchTextFieldState extends State<SchedulesSearchTextField> {
  final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(
      color: Color.fromRGBO(64, 182, 75, 1),
      width: .5,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: widget.controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: context.textStyles.textMedium.copyWith(
            fontSize: 14,
            color: Colors.black,
          ),
          prefixIcon: Image.asset(
            'assets/images/search.png',
          ),
          prefixIconConstraints: BoxConstraints.tight(const Size(40, 15)),
          fillColor: Colors.transparent,
          filled: true,
          disabledBorder: _border,
          border: _border,
          focusedBorder: _border,
          errorBorder: _border,
          enabledBorder: _border,
          focusedErrorBorder: _border,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
