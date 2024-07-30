import 'package:flutter/material.dart';

import '../../constanst/color_constanst.dart';

class InputDecorations {
  static InputDecoration decorationWithPrefixWidth({required String hintText, required Widget prefixIcon}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: ColorConstants.primaryThemeColor, fontSize: 14),
      fillColor: ColorConstants.primaryThemeColor,
      filled: true,
      contentPadding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 0.0),
      prefixIconConstraints: BoxConstraints(
        maxWidth: 70,
      ),
      prefixIcon: prefixIcon,
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
    );
  }

  static InputDecoration decorationWithPrefixIcon({required String hintText, required Widget prefixIcon}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: ColorConstants.primaryThemeColor, fontSize: 14),
      fillColor: ColorConstants.primaryThemeColor,
      filled: true,
      contentPadding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 0.0),
      prefixIcon: prefixIcon,
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
    );
  }

  static InputDecoration decorationWithSuffixWidth({required String hintText, required Widget suffixIcon}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: ColorConstants.primaryThemeColor, fontSize: 14),
      fillColor: ColorConstants.primaryThemeColor,
      filled: true,
      contentPadding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
      prefixIconConstraints: BoxConstraints(
        maxWidth: 70,
      ),
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
    );
  }
}
