import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trip/screens/homeScreen/category/flights/one_way_tab/review_booking.dart';

import '../../hotels/review_booking_screen.dart';


class FlightDetailsScreen extends StatelessWidget {
  const FlightDetailsScreen({super.key});

  static const Color indigoPrimary = Color(0xFF3B3897);
  static const Color indigoSecondary = Color(0xFF524CB0);
  static const Color greenCheck = Color(0xFF2ECC71);
  static const Color redIcon = Color(0xFFE74C3C);
  static const Color purpleAccent = Color(0xFF7B3FE4);
  static const Color labelGrey = Color(0xFF8B8B8B);
  static const Color darkText = Color(0xFF1E1E1E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 17),
        centerTitle: true,
        title: Text(
          'Flight Details',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFlightCard(),
            const SizedBox(height: 15),
            _buildBookingPoliciesSection(),
            const SizedBox(height: 15),
            _buildImportantInfoSection(),
            const SizedBox(height: 15),
            _buildTravellerDetailsSection(),
            const SizedBox(height: 15),
            InkWell(
              onTap: (){

Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewBookingFlightScreen()));
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
    );
  }

  // ---------------- Flight / Fare Card ----------------
  Widget _buildFlightCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Airline + Fare Details header row
          Container(
            color: indigoPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Row(
                    children: [
                      Text(
                        'IndiGo',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.flight, color: Colors.white, size: 18),
                    ],
                  ),
                ),
                Container(
                  height: 20,
                  width: 1,
                  color: Colors.white.withOpacity(0.4),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      'Fare Details',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Timing / duration / price row
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Row(
                    children: [
                      _timeColumn('21:20', 'IXU'),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              '2h 5m',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: labelGrey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Expanded(
                                    child: Divider(
                                        color: Colors.grey.shade400,
                                        thickness: 1)),
                                const Icon(Icons.circle,
                                    size: 4, color: labelGrey),
                                Expanded(
                                    child: Divider(
                                        color: Colors.grey.shade400,
                                        thickness: 1)),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Non stop',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: labelGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _timeColumn('23:25', 'DEL'),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '₹6,983',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: darkText,
                        ),
                      ),
                      Text(
                        'Price',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: labelGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Economy Saver bar
          Container(
            width: double.infinity,
            color: indigoPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              'Economy - SAVER',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _timeColumn(String time, String code) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: darkText,
          ),
        ),
        Text(
          code,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: labelGrey,
          ),
        ),
      ],
    );
  }

  // ---------------- Booking Policies ----------------
  Widget _buildBookingPoliciesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Booking Policies',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: darkText,
          ),
        ),
        const SizedBox(height: 12),
        _card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Baggage allowance',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: darkText,
                ),
              ),
              const SizedBox(height: 10),
              _DashedDivider(),
              const SizedBox(height: 10),
              _checkRow('Cabin bag', '7 Kgs (1 piece only) / Adult'),
              const SizedBox(height: 10),
              _checkRow('Check - in', '15 Kgs (1 piece only)/ Adult'),
            ],
          ),
        ),
        const SizedBox(height: 14),
        _card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cancellation refund',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: darkText,
                    ),
                  ),
                  Text(
                    'Upgrade',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: purpleAccent,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _DashedDivider(),
              const SizedBox(height: 10),
              _bulletText(
                boldPart: 'Cancellation: ',
                normalPart:
                'Get refund of about ₹ 10,128 on cancellation up to 3 hours before departure',
              ),
              const SizedBox(height: 8),
              _bulletText(
                boldPart: 'Date change: ',
                normalPart:
                'Airline fee of ₹ 3,349+ fare difference on date change up to 3 hours before departure',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _checkRow(String title, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset("assets/images/completed_title.svg",height: 16,),
        const SizedBox(width: 8),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: darkText,
                ),
              ),
              SizedBox(width: 20),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: labelGrey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bulletText({required String boldPart, required String normalPart}) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns bullet with the top line
        children: [
          Text(
            '•  ',
            style: TextStyle(
              color: darkText,
              fontSize: 14, // Adjust size to match bullet preference
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: boldPart,
                    style: GoogleFonts.poppins(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                      color: darkText,
                    ),
                  ),
                  TextSpan(
                    text: normalPart,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: labelGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }

  // ---------------- Important Information ----------------
  Widget _buildImportantInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Important Information',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: darkText,
          ),
        ),
        const SizedBox(height: 12),
        _card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Important',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: darkText,
                ),
              ),
              const SizedBox(height: 10),
              _DashedDivider(),
              const SizedBox(height: 12),
              _warningRow(
                title: 'Check travel guidelines and baggage information\nbelow:',
                bullet: 'Carry on more than 1 check-in baggage and 1 hand\nbaggage per passenger. If violated, airline may levy\nextra charges.',
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/images/alert.svg",height: 20,),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Availability of Boarding Pass:',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: darkText,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'More View',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: purpleAccent,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _warningRow({required String title, required String bullet}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       SvgPicture.asset("assets/images/alert.svg",height: 20,),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.replaceAll('\n', ''),
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: darkText,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '•',
                    style: GoogleFonts.poppins(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w400,
                      color: labelGrey,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      bullet.replaceAll('\n', ''),
                      style: GoogleFonts.poppins(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w400,
                        color: labelGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ---------------- Traveller Details ----------------
  Widget _buildTravellerDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Traveller Details',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: darkText,
          ),
        ),
        const SizedBox(height: 12),
        _card(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: _dropdownField('TITLE'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 4,
                    child: _inputField('FIRST NAME'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 4,
                    child: _inputField('LAST NAME'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _inputField('EMAIL ID'),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: _dropdownField('+91'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 7,
                    child: _inputField('MOBILE NUMBER'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _inputField(String hint) {
    return SizedBox(
      height: 48,
      child: TextField(
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600, // Matching your dropdown weight
          color: darkText,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Color(0xff707070),
          ),
          filled: true,
          fillColor: const Color(0xFFF5F5F7),
          contentPadding: const EdgeInsets.symmetric(horizontal: 14),
          // Default Border
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color:Color(0xffC7C7C7)),
          ),
          // Border when clicking/typing
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: purpleAccent, width: 1),
          ),
        ),
      ),
    );
  }

  Widget _dropdownField(String hint) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color:  Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color:Color(0xffC7C7C7),
      ),),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hint,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xff707070),
            ),
          ),
          const Icon(Icons.keyboard_arrow_down, size: 18, color: labelGrey),
        ],
      ),
    );
  }


  // ---------------- Shared helpers ----------------
  Widget _card({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }


}

extension on Flex {
  Widget paddedDashRow() {
    return Row(
      children: children
          .map((w) => Padding(padding: const EdgeInsets.only(right: 3), child: w))
          .toList(),
    );
  }
}



class _DashedDivider extends StatelessWidget {
  const _DashedDivider();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const dashWidth = 5.0;
        const dashGap = 4.0;
        final dashCount =
        (constraints.maxWidth / (dashWidth + dashGap)).floor();
        return SizedBox(
          height: 1,
          child: Row(
            children: List.generate(dashCount, (_) {
              return Padding(
                padding: const EdgeInsets.only(right: dashGap),
                child: Container(
                  width: dashWidth,
                  height: 1,
                  color: const Color(0xff8765DA),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}