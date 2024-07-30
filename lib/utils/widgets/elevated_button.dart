import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constanst/color_constanst.dart';

class ReusableElevatedButton extends StatelessWidget {
  final Widget child;
  final GestureTapCallback onPressed;
  final int width;
  final int height;

  const ReusableElevatedButton({super.key, required this.onPressed, required this.child, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(width.w, height.h),
            maximumSize: Size(width.w, height.h),
            backgroundColor: ColorConstants.primaryThemeColor,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r))),
        onPressed: onPressed,
        child: child);
  }
}

class BlackReusableElevatedButton extends StatelessWidget {
  final Widget child;
  final GestureTapCallback onPressed;
  final int width;
  final int height;

  const BlackReusableElevatedButton({super.key, required this.onPressed, required this.child, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(width.w, height.h),
            maximumSize: Size(width.w, height.h),
            side: const BorderSide(
              width: 1.5,
              color: Colors.white,
            ),
            backgroundColor: ColorConstants.primaryThemeColor,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r))),
        onPressed: onPressed,
        child: child);
  }
}
