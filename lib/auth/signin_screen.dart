import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test_flutter/constanst/color_constanst.dart';

import '../services/web_services.dart';
import '../utils/widgets/elevated_button.dart';
import '../utils/widgets/widgets.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int _selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onSignInTap() {
    setState(() {
      _selectedIndex = 0;
    });
    _pageController.animateToPage(0, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  void _onSignUpTap() {
    setState(() {
      _selectedIndex = 1;
    });
    _pageController.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.blue.shade50],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 120.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _onSignInTap,
                  child: Text(
                    'Sign in',
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: _selectedIndex == 0 ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                GestureDetector(
                  onTap: _onSignUpTap,
                  child: Text(
                    'Sign up',
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: _selectedIndex == 1 ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 2.h,
                  width: 60.w,
                  color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
                ),
                Container(
                  height: 2.h,
                  width: 220.w,
                  color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  SignInScreen(
                    pageController: _pageController,
                  ),
                  SignUpScreen(
                    pageController: _pageController,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignInScreen extends StatefulWidget {
  final PageController pageController;

  SignInScreen({required this.pageController});
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  bool isLoading = false;
  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      autoValidateMode = AutovalidateMode.disabled;
      await WebService.logInRequest(_passwordController.text, context, _emailController.text);
      setState(() {
        isLoading = false;
      });
    } else {
      autoValidateMode = AutovalidateMode.always;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 24),
            TextFormField(
              controller: _emailController,
              autovalidateMode: autoValidateMode,
              style: GoogleFonts.poppins(color: Colors.black),
              decoration: textInputDecoration.copyWith(
                hintText: "Enter your email",
                labelText: "Email",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              autovalidateMode: autoValidateMode,
              style: GoogleFonts.poppins(color: Colors.black),
              decoration: textInputDecoration.copyWith(
                hintText: "Enter your password",
                labelText: "Password",
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
            ),
            SizedBox(height: 40.h),
            Center(
              child: ReusableElevatedButton(
                onPressed: () {
                  login();
                },
                width: 328,
                height: 39,
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: Colors.white,
                      ))
                    : Center(
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 18.sp),
                        ),
                      ),
              ),
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.poppins(color: Colors.grey, fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: <Widget>[
                Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Or signin with',
                    style: GoogleFonts.poppins(color: Color(0xff212226)),
                  ),
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
                  onPressed: () {},
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
                  onPressed: () {},
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.apple, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Don\'t have a Account?',
                  style: GoogleFonts.poppins(color: ColorConstants.textFieldBorderColor, fontSize: 14.sp),
                ),
                TextButton(
                  onPressed: () {
                    widget.pageController.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                    setState(() {});
                  },
                  child: Text(
                    'Sign up',
                    style: GoogleFonts.poppins(color: ColorConstants.primaryThemeColor, fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  final PageController pageController;

  SignUpScreen({required this.pageController});
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _countryCodeController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String _countryCode = '+1';

  bool isLoading = false;
  Future<void> signUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      autoValidateMode = AutovalidateMode.disabled;
      await WebService.signUpRequest(context, _emailController.text, _passwordController.text, _confirmPasswordController.text, _firstNameController.text, _lastNameController.text,
          _countryCode, _mobileNumberController.text);
      setState(() {
        isLoading = false;
      });
    } else {
      autoValidateMode = AutovalidateMode.always;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40.h),
            TextFormField(
              controller: _firstNameController,
              style: GoogleFonts.poppins(color: Colors.black),
              decoration: textInputDecoration.copyWith(
                hintText: "Enter your first name",
                labelText: "First Name",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),
            TextFormField(
              controller: _lastNameController,
              style: GoogleFonts.poppins(color: Colors.black),
              decoration: textInputDecoration.copyWith(
                hintText: "Enter your last name",
                labelText: "Last Name",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Container(
                  width: 100.w,
                  child: CountryCodePicker(
                    onChanged: (countryCode) {
                      setState(() {
                        _countryCode = countryCode.toString();
                      });
                    },
                    initialSelection: 'US',
                    showCountryOnly: true,
                    showOnlyCountryWhenClosed: true,
                    favorite: ['+1', 'US'],
                    alignLeft: true,
                    padding: EdgeInsets.zero,
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: _mobileNumberController,
                    style: GoogleFonts.poppins(color: Colors.black),
                    decoration: textInputDecoration.copyWith(
                      hintText: "Enter your mobile number",
                      labelText: "Mobile Number",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            TextFormField(
              controller: _emailController,
              style: GoogleFonts.poppins(color: Colors.black),
              decoration: textInputDecoration.copyWith(
                hintText: "Enter your email",
                labelText: "Email",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),
            TextFormField(
              controller: _passwordController,
              style: GoogleFonts.poppins(color: Colors.black),
              decoration: textInputDecoration.copyWith(
                hintText: "Enter your password",
                labelText: "Password",
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),
            TextFormField(
              controller: _confirmPasswordController,
              style: GoogleFonts.poppins(color: Colors.black),
              decoration: textInputDecoration.copyWith(
                hintText: "Enter your password",
                labelText: "Confirm Password",
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
            ),
            SizedBox(height: 24.h),
            Center(
              child: ReusableElevatedButton(
                onPressed: () {
                  signUp();
                },
                width: 328,
                height: 39,
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Colors.white,
                      ))
                    : Center(
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 18.sp),
                        ),
                      ),
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Already have an Account?',
                  style: GoogleFonts.poppins(color: Colors.grey, fontSize: 14.sp),
                ),
                TextButton(
                  onPressed: () {
                    widget.pageController.animateToPage(0, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                    setState(() {});
                  },
                  child: Text(
                    'Sign in',
                    style: GoogleFonts.poppins(color: ColorConstants.primaryThemeColor, fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
