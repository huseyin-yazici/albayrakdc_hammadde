import 'package:albayrakdc_hammadde/core/extentions/context_extentions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constans/app/color_constans.dart';
import '../text/custom_text.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.hintText,
    this.title,
    this.isPassword = false,
    this.onSaved,
    this.keyboardType = TextInputType.text,
  });

  final String? hintText;
  final String? title;
  final TextEditingController? controller;
  final Function(String?)? onSaved;
  final bool? isPassword;
  final TextInputType? keyboardType;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: context.dynamicHeight(0.02)), // %2 yükseklik
        CustomText(
          widget.title ?? "",
          textStyle: context.textTheme.titleMedium,
        ),
        SizedBox(height: context.dynamicHeight(0.01)), // %1 yükseklik
        Container(
          width: context.dynamicWidth(0.9), // %90 genişlik
          height: context.dynamicHeight(0.08), // %8 yükseklik
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            onSaved: widget.onSaved,
            cursorColor: ColorConstants.red,
            obscureText: widget.isPassword ?? false,
            style: GoogleFonts.montserrat(),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              // İç dolgu
              hintText: widget.hintText,
              errorStyle: GoogleFonts.montserrat(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: ColorConstants.red),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: ColorConstants.red),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: ColorConstants.red),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
