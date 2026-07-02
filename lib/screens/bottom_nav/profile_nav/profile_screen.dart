import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trip/screens/bottom_nav/profile_nav/bank_details/bank-details.dart';
import 'package:my_trip/screens/bottom_nav/profile_nav/help_support/help_support.dart';
import 'package:my_trip/screens/bottom_nav/profile_nav/my_booking/my_booking.dart';
import 'package:my_trip/screens/bottom_nav/profile_nav/notification_setting/notification_setting.dart';
import 'package:my_trip/screens/bottom_nav/profile_nav/personal_details/personal_details.dart';
import 'package:my_trip/screens/bottom_nav/profile_nav/trems_conditions/trem_conditions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final List<String> menuItems = const [
    "Personal Details",
    "My Bookings",
    "Bank Details",
    "Notification Settings",
    "Help & Support",
    "Terms & Conditions",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),

      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 4,
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child:  Icon(Icons.arrow_back_ios_new,
              color: Colors.black, size: 17),
        ),
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            /// Profile
            SizedBox(height: 20,),

            Stack(
              clipBehavior: Clip.none,
              children: [

                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.15),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                ),

                Positioned(
                 bottom: -8,
                  right:23,
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff8E4EF7),
                    ),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
              ],
            ),
             SizedBox(height: 8),

            Text(
              "Sarah Smith",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: const Color(0xff2E2E2E),
              ),
            ),
             SizedBox(height: 10),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                child: Column(
                  children: [

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.08),
                            blurRadius: 14,
                            offset: const Offset(0, 5),
                          )
                        ],
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 8.0,horizontal: 8),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: menuItems.length,
                          separatorBuilder: (_, __) => Divider(
                            color: Colors.grey.shade300,
                            height: 1,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                if(menuItems[index] == "Personal Details"){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalDetailsScreen()));
                                }

                                if(menuItems[index] == "My Bookings"){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyBookingsScreen()));
                                }

                                if(menuItems[index] == "Bank Details"){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BankDetailsScreen()));
                                }

                                if(menuItems[index] == "Notification Settings"){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationSettingsScreen()));
                                }

                                if(menuItems[index] == "Help & Support"){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpSupportScreen()));
                                }

                                if(menuItems[index] == "Terms & Conditions"){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsConditionsScreen()));
                                }

                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 13,
                                  vertical: 13,
                                ),
                                child: Text(
                                  menuItems[index],
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff2C2C2C),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    const Spacer(),
                    // logout button
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient:  LinearGradient(
                          colors: [
                            Color(0xff7750D5),
                            Color(0xffB457EB),
                            Color(0xffA751D8)
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Log Out",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),
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