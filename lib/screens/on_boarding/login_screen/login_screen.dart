import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trip/screens/on_boarding/signUp_screen/signUp_screen.dart';

import '../../bottom_nav/bottom_nav.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/on_boarding_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height * 0.42,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.60),
                      Colors.black.withOpacity(0.30),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    'Welcome Back',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Login to continue planning your\njourney.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 13.5,
                      fontStyle: FontStyle.italic,
                      color: Colors.white.withOpacity(0.92),
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style:GoogleFonts.poppins(
                      fontSize: 21,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            // login card
            Positioned(
              left: 0,
              right: 0,
              bottom: 40,
              child: SizedBox(
                height: 550,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 17,
                          horizontal: 17,
                        ),
                        child: Image.asset(
                          "assets/images/login.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        top: 55,
                        left: 25,
                        right: 25,
                        bottom: 30,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            // Phone Number
                            Text(
                              'Phone Number',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff2E2F30),
                              ),
                            ),
                            SizedBox(height: 8),
                            TextField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1A1035),
                              ),
                              decoration: InputDecoration(
                                hintText: '+91  Enter phone number',
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff717680),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 15,
                                ),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xffD5D7DA),
                                    width: 1.2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xffD5D7DA),
                                    width: 1.2,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 22),

                            // Or Divider
                            Center(
                              child: Text(
                                'Or',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                             SizedBox(height: 22),

                            // Sign Up with Google Button
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: double.infinity,
                                height: 52,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Color(0xFFDEDEDE),
                                    width: 1.2,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/google.png",
                                      height: 23,
                                      width: 23,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Login with Google',
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF1A1035),
                                        letterSpacing: 0.1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 22),

                            // Continue Button
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                              },
                              child: Container(
                                width: double.infinity,
                                height: 54,
                                decoration: BoxDecoration(
                                  gradient:  LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xff7750D5),
                                      Color(0xff9D55E3),
                                      Color(0xffB458EC),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child:  Text(
                                  'Continue',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ),

                             SizedBox(height: 20),

                            // Already have an account
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Text(
                                  "Don't have an account?" ,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF666666),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                                  },
                                  child:  Text(
                                    'Sign Up',
                                    style: GoogleFonts.poppins(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff9D55E3),
                                      decoration: TextDecoration.underline,
                                      decorationColor: Color(0xFF7C3AED),
                                      decorationThickness: 1.3,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                             SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
