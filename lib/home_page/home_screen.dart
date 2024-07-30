import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test_flutter/constanst/color_constanst.dart';
import 'package:machine_test_flutter/constanst/string_extension.dart';
import 'package:machine_test_flutter/services/model/user_list_model.dart';
import 'package:machine_test_flutter/services/web_services.dart';

import '../services/db.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  bool logoutIsLoading = false;
  bool isListClicked = true;
  UserListModel? userListModel;
  getUserListRequest() async {
    setState(() {
      isLoading = true;
    });
    userListModel = await WebService.getUserDetailsRequest(context);

    setState(() {
      isLoading = false;
    });
  }

  String userName = "";
  String userEmail = "";
  String userImage = "";

  getUserName() async {
    await Db.getUserName().then((value) {
      userName = value!;
    });
    await Db.getUserEmail().then((value) {
      userEmail = value!;
    });
    await Db.getUserImage().then((value) {
      userImage = value!;
    });
  }

  @override
  void initState() {
    getUserListRequest();
    getUserName();
    // TODO: implement initState
    super.initState();
  }

  Future<void> logOut() async {
    setState(() {
      logoutIsLoading = true;
    });
    await WebService.logOutRequest(context);

    setState(() {
      logoutIsLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 8.w, top: 8.h, bottom: 8.h),
          child: CircleAvatar(
            backgroundImage: userImage.isNotEmpty ? NetworkImage(userImage) : const NetworkImage('https://via.placeholder.com/150'),
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName.capitalizeFirstOfEach,
              style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
            Text(
              userEmail.capitalizeFirstOfEach,
              style: GoogleFonts.poppins(fontSize: 12.sp),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                exitAppDialog(context, () {
                  logOut();
                });
              },
              icon: Icon(Icons.logout)),
          SizedBox(width: 20.w),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: ColorConstants.primaryThemeColor,
            ))
          : userListModel == null || userListModel!.userList.isEmpty
              ? SizedBox()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "User List",
                              style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w500),
                            ),
                            Container(
                              height: 24.h,
                              width: 68.w,
                              decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(4.r)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        isListClicked = !isListClicked;
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.list_alt,
                                        color: isListClicked ? ColorConstants.primaryThemeColor : Colors.grey,
                                      )),
                                  SizedBox(width: 4.w),
                                  GestureDetector(
                                      onTap: () {
                                        isListClicked = !isListClicked;
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.grid_view,
                                        color: !isListClicked ? ColorConstants.primaryThemeColor : Colors.grey,
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      isListClicked
                          ? Expanded(
                              child: ListView.builder(
                                itemCount: userListModel!.userList.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    color: Colors.white,
                                    margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'First Name: ${userListModel!.userList[index].firstName}',
                                            style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.black),
                                          ),
                                          Text('Last Name: ${userListModel!.userList[index].lastName}', style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.black)),
                                          Text(
                                            'Email:${userListModel!.userList[index].email}',
                                            style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.black),
                                            maxLines: 1,
                                          ),
                                          Text(
                                            'Phone: ${userListModel!.userList[index].phoneNo}',
                                            style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.black),
                                            maxLines: 1,
                                          ),
                                          SizedBox(height: 10.h),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              height: 20.h,
                                              width: 120.w,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), border: Border.all(color: ColorConstants.primaryThemeColor)),
                                              child: Center(
                                                  child: Text(
                                                "View Profile",
                                                style: GoogleFonts.poppins(fontSize: 10.sp, color: ColorConstants.primaryThemeColor),
                                              )),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Expanded(
                              child: GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemCount: userListModel!.userList.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'First Name: ${userListModel!.userList[index].firstName}',
                                            style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.black),
                                          ),
                                          Text('Last Name: ${userListModel!.userList[index].lastName}', style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.black)),
                                          Text(
                                            'Email:${userListModel!.userList[index].email}',
                                            style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.black),
                                            maxLines: 1,
                                          ),
                                          Text(
                                            'Phone: ${userListModel!.userList[index].phoneNo}',
                                            style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.black),
                                            maxLines: 1,
                                          ),
                                          SizedBox(height: 10.h),
                                          Container(
                                            height: 20.h,
                                            width: 120.w,
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), border: Border.all(color: ColorConstants.primaryThemeColor)),
                                            child: Center(
                                                child: Text(
                                              "View Profile",
                                              style: GoogleFonts.poppins(fontSize: 10.sp, color: ColorConstants.primaryThemeColor),
                                            )),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                ),
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
}
