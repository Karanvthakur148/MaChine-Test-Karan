import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constanst/color_constanst.dart';

class AppAppbar {
  static AppBar titleWithBackButton({required String title, required BuildContext context}) {
    return AppBar(
        elevation: 0,
        backgroundColor: ColorConstants.primaryThemeColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          title,
          style: GoogleFonts.dmSans(fontWeight: FontWeight.w600),
        ));
  }

  static AppBar titleWithOutBackButton({required String title, required BuildContext context}) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorConstants.primaryThemeColor,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: 16.sp),
      ),
      // actions: [
      //   IconButton(onPressed: , icon: Icon(
      // CupertinoIcons.cart_fill,
      // color: Colors.white,))
      // ],
    );
  }

  static AppBar titleAndNotificationWithOutBackButton(
      {required String title, required BuildContext context, required GestureTapCallback onPressed, required List notificationListLength}) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorConstants.primaryThemeColor,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: 16.sp),
      ),
      actions: [
        Stack(
          children: <Widget>[
            IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.notifications_active,
                  color: Colors.white,
                )),
            notificationListLength.isNotEmpty
                ? Positioned(
                    right: 4.w,
                    top: 3.h,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 14.w,
                        minHeight: 12.h,
                      ),
                      child: Center(
                        child: Text(
                          notificationListLength.length.toString(),
                          style: GoogleFonts.dmSans(color: Colors.white, fontSize: 9.sp, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                : Container()
          ],
        ),

        // IconButton(
        //     onPressed: onPressed,
        //     icon: const Icon(
        //       Icons.notifications_active,
        //     )),
        SizedBox(width: 10.w)
      ],
    );
  }

  static AppBar titleWithOutBackButtonTitleWithStartAxis({required String title, required BuildContext context}) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: false,
      iconTheme: IconThemeData(color: Colors.white),
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: GoogleFonts.openSans(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 20.sp),
      ),
      // actions: [
      //   IconButton(onPressed: , icon: Icon(
      // CupertinoIcons.cart_fill,
      // color: Colors.white,))
      // ],
    );
  }

  static AppBar withOutTitleAndShareButtonBackButton() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      elevation: 0,
    );
  }

  static AppBar titleWithoutBackButton({required String title}) {
    return AppBar(
      centerTitle: true,
      elevation: 1,
      title: Text(
        title,
      ),
    );
  }
}
