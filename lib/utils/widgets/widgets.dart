import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constanst/color_constanst.dart';

InputDecoration textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  labelStyle: GoogleFonts.poppins(color: Colors.black),

  isDense: true,
  hintStyle: GoogleFonts.dmSans(fontSize: 16.sp, fontWeight: FontWeight.w400, color: Color(0xffC2C2C2)),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.r),
    borderSide: BorderSide(
      color: ColorConstants.textFieldBorderColor,
      width: 1.w,
    ),
  ),
  // border: InputBorder.none,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.r),
    borderSide: BorderSide(color: ColorConstants.textFieldBorderColor, width: 1.w),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.r),
    borderSide: BorderSide(color: ColorConstants.textFieldBorderColor, width: 1.w),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.r)),
    borderSide: BorderSide(
      width: 1.w,
      color: ColorConstants.textFieldBorderColor,
    ),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.r)),
    borderSide: BorderSide(
      width: 1.w,
    ),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.r)),
    borderSide: BorderSide(
      width: 1.w,
      color: ColorConstants.textFieldBorderColor,
    ),
  ),
);
InputDecoration textInputDecorationWithOutBorder = const InputDecoration(
  fillColor: Colors.white,
  filled: true,
  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
    borderSide: BorderSide(
      color: Colors.white,
      width: 0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
    borderSide: BorderSide(color: Colors.white, width: 0),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
    borderSide: BorderSide(color: Colors.white, width: 0),
  ),
);
InputDecoration textInputDecorationWithOutBorder1 = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
    borderSide: BorderSide(
      color: Colors.white,
      width: 0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
    borderSide: BorderSide(color: Colors.white, width: 0),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
    borderSide: BorderSide(color: Colors.white, width: 0),
  ),
);

InputDecoration textInputDecorationWithOutBorderAndWithOutCircular = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.only(topRight: Radius.circular(0), topLeft: Radius.circular(0)),
    borderSide: BorderSide(
      color: Colors.white,
      width: 0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.only(topRight: Radius.circular(0), topLeft: Radius.circular(0)),
    borderSide: BorderSide(color: Colors.white, width: 0),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(0)),
    borderSide: BorderSide(color: Colors.white, width: 0),
  ),
);

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
}

void showSnackbar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 14),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
        textColor: Colors.white,
      ),
    ),
  );
}

void showBottomModelSheet(context, hasError) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 550,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Phone Number Verification',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                child: RichText(
                  text: TextSpan(
                      text: "Enter the code sent to ",
                      children: [
                        TextSpan(text: "${""}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                      style: TextStyle(color: Colors.black54, fontSize: 15)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              // Form(
              //   //key: formKey,
              //   child: Padding(
              //       padding:
              //           EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              //       child: PinCodeTextField(
              //         appContext: context,
              //         pastedTextStyle: TextStyle(
              //           color: Colors.green.shade600,
              //           fontWeight: FontWeight.bold,
              //         ),
              //         length: 6,
              //         blinkWhenObscuring: true,
              //         animationType: AnimationType.fade,
              //         validator: (v) {
              //           if (v!.length < 3) {
              //             return "I'm from validator";
              //           } else {
              //             return null;
              //           }
              //         },
              //         pinTheme: PinTheme(
              //           shape: PinCodeFieldShape.box,
              //           borderRadius: BorderRadius.circular(5),
              //           fieldHeight: 50,
              //           fieldWidth: 40,
              //           activeFillColor: Colors.white,
              //         ),
              //         cursorColor: Colors.black,
              //         animationDuration: const Duration(milliseconds: 300),
              //         enableActiveFill: true,
              //         //errorAnimationController: errorController,
              //         //controller: textEditingController,
              //         keyboardType: TextInputType.number,
              //         boxShadows: const [
              //           BoxShadow(
              //             offset: Offset(0, 1),
              //             color: Colors.black12,
              //             blurRadius: 10,
              //           )
              //         ],
              //         onCompleted: (v) {
              //           debugPrint("Completed");
              //         },
              //         // onTap: () {
              //         //   print("Pressed");
              //         // },
              //         onChanged: (value) {
              //           debugPrint(value);
              //           // setState(() {
              //           //   currentText = value;
              //           // });
              //         },
              //         beforeTextPaste: (text) {
              //           debugPrint("Allowing to paste $text");
              //           //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //           //but you can show anything you want here, like your pop up saying wrong paste format or etc
              //           return true;
              //         },
              //       )),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  hasError ? "*Please fill up all the cells properly" : "",
                  style: TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the code? ",
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "RESEND",
                      style: TextStyle(color: ColorConstants.primaryThemeColor, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                child: ButtonTheme(
                  height: 30,
                  child: TextButton(
                    onPressed: () {
                      // formKey.currentState!.validate();
                      // // conditions for validating
                      // if (currentText.length != 6 || currentText != "123456") {
                      //   errorController!.add(ErrorAnimationType
                      //       .shake); // Triggering error shake animation
                      //   setState(() => hasError = true);
                      // } else {
                      //   setState(
                      //         () {
                      //       hasError = false;
                      //       snackBar("OTP Verified!!");
                      //     },
                      //   );
                      // }
                    },
                    child: Center(
                        child: Text(
                      "VERIFY".toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                decoration: BoxDecoration(color: Colors.green.shade300, borderRadius: BorderRadius.circular(5), boxShadow: [
                  BoxShadow(color: Colors.green.shade200, offset: const Offset(1, -2), blurRadius: 5),
                  BoxShadow(color: Colors.green.shade200, offset: const Offset(-1, 2), blurRadius: 5)
                ]),
              ),
              // SizedBox(
              //   height: 16,
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              //   child: SizedBox(
              //     width: double.infinity,
              //     child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //           backgroundColor: AppColors.primaryColor,
              //           elevation: 0,
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(30))),
              //       child: const Text(
              //         "Register",
              //         style: TextStyle(color: Colors.white, fontSize: 16),
              //       ),
              //       onPressed: () {
              //         Get.back();
              //         // login();
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      );
    },
  );
}

Object exitAppDialog(BuildContext context, GestureTapCallback onPressed) {
  return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: Colors.white,
                title: Text(
                  'Close This App?',
                  style: GoogleFonts.dmSans(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.black),
                ),
                content: Text(
                  'Are You Sure You Want To Logout?',
                  style: GoogleFonts.dmSans(fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.black),
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(79.w, 25.h),
                              maximumSize: Size(79.w, 25.h),
                              side: const BorderSide(
                                width: 1,
                                color: Colors.black,
                              ),
                              backgroundColor: ColorConstants.secondryThemeColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r))),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'No',
                            style: GoogleFonts.dmSans(fontSize: 12.sp, fontWeight: FontWeight.w700, color: Colors.black),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(79.w, 25.h),
                              maximumSize: Size(79.w, 25.h),
                              backgroundColor: ColorConstants.primaryThemeColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r))),
                          onPressed: onPressed,
                          child: Text(
                            'Yes',
                            style: GoogleFonts.dmSans(fontSize: 12.sp, fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )) ??
      true;
}

Widget noDataFoundWidget(String image, String buttonText, GestureTapCallback onPressed) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(image, width: 283.w, height: 280.h),
      SizedBox(height: 40.h),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(202.w, 46.h),
            backgroundColor: ColorConstants.primaryThemeColor,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: GoogleFonts.openSans(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      )
    ],
  );
}

Widget noDataFoundWidget1() {
  return Image.asset("assets/nodatafoundtemp.png", width: 319.w, height: 249.h);
}

Padding noAvailabilityWidget(String text1, String text2, GestureTapCallback onPressed) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: ListView(children: [
      Image.asset(
        "assets/noavaiblity.png",
        height: 235.h,
        width: 235.w,
      ),
      SizedBox(height: 20.h),
      Text(
        text1,
        style: GoogleFonts.dmSans(fontSize: 20.sp, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 24.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Text(
          text2,
          style: GoogleFonts.dmSans(fontSize: 14.sp, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(height: 40.h),
      Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(209.w, 40.h),
              maximumSize: Size(209.w, 40.h),
              side: const BorderSide(
                width: 1.5,
                color: Colors.white,
              ),
              backgroundColor: ColorConstants.primaryThemeColor,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r))),
          onPressed: onPressed,
          child: Text(
            "+Add Availability",
            style: GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: 16.sp),
          ),
        ),
      ),
      SizedBox(height: 40.h),
    ]),
  );
}
