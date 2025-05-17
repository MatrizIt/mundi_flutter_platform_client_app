import 'package:flutter/material.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/extension/size_screen_extension.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/colors_app.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/text_styles.dart';

class ServiceTextField extends StatefulWidget {
  final double? width;
  final double? height;
  final String hintText;
  final TextEditingController controller;
  const ServiceTextField(
      {super.key,
      this.height,
      this.width,
      required this.hintText,
      required this.controller});

  @override
  State<ServiceTextField> createState() => _ServiceTextFieldState();
}

class _ServiceTextFieldState extends State<ServiceTextField> {
  @override
  Widget build(BuildContext context) {
    const border = InputBorder.none;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: context.colors.decorationPrimary,
          width: .5,
        ),
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      width: .8.sw,
      height: 35,
      alignment: Alignment.center,
      child: TextField(
        controller: widget.controller,
        style: context.textStyles.textMedium.copyWith(
          fontSize: 10,
        ),
        textAlignVertical: TextAlignVertical.top,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          border: border,
          errorBorder: border,
          enabledBorder: border,
          disabledBorder: border,
          focusedBorder: border,
        ),
      ),
    );
  }
}
