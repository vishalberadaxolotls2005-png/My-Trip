import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trip/screens/homeScreen/category/hotels/review_booking_screen.dart';

class SelectRoomScreen extends StatelessWidget {

  static const Color purple = Color(0xff7750D5);
  static const Color purpleLight = Color(0xffB457EB);
  static const Color purpleDark = Color(0xffA751D8);
  static const Color greyText = Color(0xff707070);
  static const Color blackText = Color(0xFF1B1B1B);
  static const Color borderGrey = Color(0xffE0E0E0);
  static const Color screenBg = Color(0xffF2F2F2);

  const SelectRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.maybePop(context),
                    child: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: borderGrey),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Select Room',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14, fontWeight: FontWeight.w600, color: blackText),
                                ),

                                Text(
                                  '19 Jun - 19 Jun, 1 Room, 2 Guests',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12, fontWeight: FontWeight.w400, color: greyText),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.edit_outlined, color: purple, size: 24),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ---------- Filter chips ----------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14,),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    _FilterChip(label: 'Breakfast Included'),
SizedBox(width: 5,),
                    _FilterChip(label: 'Breakfast & Lunch/Dinner'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // ── Scrollable content ─────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(
                      height: 470,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                colors: [
                                  Colors.white,
                                  Colors.white,
                                  Colors.white,
                                  Colors.white,
                                  Colors.white,
                                  Colors.white,
                                  Colors.white,
                                  Colors.white,
                                  Colors.white,
                                  Color(0xffE1D8F6),
                                  Color(0xffCCBEEF)
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: const Text(
                              'Enjoy Free Breakfast throughout your stay\nfor just ₹1000 More!',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                height: 1.3,
                              ),
                            ),
                          ),
                          // Room card
                          Positioned(
                            top: 55,
                            left: 0,
                            right: 0,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: const Color(0xffC7C7C7)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.03),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Deluxe Room - 1 King Bed City View',
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF2E2E2E),
                                    ),
                                  ),

                                  Text(
                                    '2 Adults',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF8C8C8C),
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  // Image + meta info
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Container(
                                          width: 92,
                                          height: 92,
                                          color: const Color(0xFFE9E4F7),
                                          child: Image.asset("assets/images/image 19.png",fit: BoxFit.cover,),
                                          // Replace with: Image.network('<room-photo-url>', fit: BoxFit.cover),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children:  [
                                                Container(

                                                    width: 15,height: 15,
                                                    child: SvgPicture.asset("assets/images/inches.svg",fit: BoxFit.cover,)),

                                                SizedBox(width: 6),
                                                Expanded(
                                                  child: Text(
                                                    '332 sq.ft (31 sq.mt)',
                                                    style:  GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                      color: Color(0xff2E2F30),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              children:  [
                                                Container(

                                                    width: 15,height: 15,
                                                    child: SvgPicture.asset("assets/images/sunset.svg",fit: BoxFit.cover,)),
                                                SizedBox(width: 6),
                                                Expanded(
                                                  child: Text(
                                                    'Sunset View',
                                                    style:  GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                      color: Color(0xff2E2F30),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              children:  [
                                                Container(

                                                    width: 15,height: 15,
                                                    child: SvgPicture.asset("assets/images/bedroom.svg",fit: BoxFit.cover,)),
                                                SizedBox(width: 6),
                                                Expanded(
                                                  child: Text(
                                                    'Bedroom1 - 1 Double Bed',
                                                    style:  GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                      color: Color(0xff2E2F30),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 14),
                                  const Divider(height: 1, color: Color(0xffC7C7C7)),
                                  const SizedBox(height: 12),

                                  Text(
                                    'Room with Breakfast',
                                    style:  GoogleFonts.poppins(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF1A1A1A),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children:  [
                                      SvgPicture.asset("assets/images/breakfast.svg",),

                                      SizedBox(width: 6),
                                      Text(
                                        'Breakfast included',
                                        style:  GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff2E2F30),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    '• WEEKEND DEAL BREAKFAST INCLUDED',
                                    style:  GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff2E2F30),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '• Non - Refundable',
                                    style:  GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff2E2F30),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children:  [
                                      Text(
                                        'View More',
                                        style:  GoogleFonts.poppins(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff7750D5),
                                        ),
                                      ),
                                      Icon(Icons.keyboard_arrow_down, size: 16, color: Color(0xFF8A2FE0)),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  const Divider(height: 1, color: Color(0xffC7C7C7)),

                                  SizedBox(height: 8),

                                  // Price + Select
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:  [
                                            Text(
                                              '₹4,699',
                                              style:  GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF1A1A1A),
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              '+235 taxes & fees',
                                              style:  GoogleFonts.poppins(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF8C8C8C),
                                              ),
                                            ),
                                            Text(
                                              'Per Night',
                                              style:  GoogleFonts.poppins(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF8C8C8C),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      OutlinedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(color: Color(0xff7750D5), width: 1.4),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                                        ),
                                        child:  Text(
                                          'Select',
                                          style:  GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff9054DF),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),



                    const SizedBox(height: 20),

                     Text(
                      'Choose from other options',
                      style:  GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Partially visible next card
                    ClipRect(
                      child: Align(
                        alignment: Alignment.topCenter,
                        heightFactor: 0.35,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFFE3E3E3)),
                          ),
                          child:  Text(
                            'Deluxe Room - 1 King Bed City View',
                            style:  GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF2E2E2E),
                            ),
                          ),
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
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10, offset: const Offset(0, -3))],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('₹4,699', style: GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.bold, color: blackText)),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('+235 taxes & fees',
                          style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: greyText)),
                      Text('Per Night',
                          style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: greyText)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewBookingScreen()));

                },
                child: Container(
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
                      "Continue",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String? imgPath;
  final String label;
  const _FilterChip({this.imgPath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: SelectRoomScreen.borderGrey),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imgPath != null) ...[
            SvgPicture.asset(imgPath!,height: 14, color: SelectRoomScreen.blackText),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: GoogleFonts.poppins(
                fontSize: 14, fontWeight: FontWeight.w500, color: SelectRoomScreen.blackText),
          ),
        ],
      ),
    );
  }
}