

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trip/screens/homeScreen/category/flights/one_way_tab/procced_to_payment_bottom_sheet.dart';

class AppColors {
  static const purple1 = Color(0xFF7B2FF7);
  static const purple2 = Color(0xFFB721FF);
  static const bgPage = Color(0xFFEDEDED);
  static const cardBg = Color(0xFFF5F5F5);
  static const cardBg2 = Color(0xFFEFEFEF);
  static const textDark = Color(0xFF1A1A1A);
  static const textMid = Color(0xFF4A4A4A);
  static const textLight = Color(0xFF9A9A9A);
  static const green = Color(0xFF1DB954);
  static const border = Color(0xFFE2E2E2);
}

class ReviewBookingFlightScreen extends StatelessWidget {
  const ReviewBookingFlightScreen({super.key});
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
        surfaceTintColor: Colors.white,
        title: Text(
          'Review Booking',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionTitle('Flight Details', topMargin: 0),
              const _FlightCard(),
              _SectionTitle('Passenger Details'),
              _buildTravellerDetailsSection(),
              _SectionTitle('Fare Breakdown'),
              const _FareCard(),
              SizedBox(height: 10,),
            ],
          ),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Total Payable', style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: Color(0xff707070))),

                  Text('₹8,099', style: GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.bold, color: Color(0xff1B1A1A))),
                  const SizedBox(width: 8),

                ],
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: (){
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) =>  ProccedToPaymentBottomSheet(),
                  );

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
                      "Procced to Payment",
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
  Widget _buildTravellerDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        _card(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: _dropdownField('Mr.'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 4,
                    child: _inputField('Arjun'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 4,
                    child: _inputField('Reddy'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _inputField('arjunreddy@email.com'),
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
                    child: _inputField('3652147890'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

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
              color: Color(0xff2E2F30),
            ),
          ),
          const Icon(Icons.keyboard_arrow_down, size: 18, color: labelGrey),
        ],
      ),
    );
  }


  Widget _inputField(String hint) {
    return SizedBox(
      height: 48,
      child: TextField(
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600, // Matching your dropdown weight
          color: Color(0xff2E2F30),
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xff2E2F30),
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
}



// ---------------- Section Title ----------------

class _SectionTitle extends StatelessWidget {
  final String text;
  final double topMargin;
  const _SectionTitle(this.text, {this.topMargin = 14});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topMargin, bottom: 10),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textDark,
        ),
      ),
    );
  }
}

// ---------------- Flight Card ----------------

class _FlightCard extends StatelessWidget {
  const _FlightCard();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Top gradient bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.purple1, AppColors.purple2],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.flight, size: 14, color: Colors.white),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'IndiGo   AI 1843 | Airbus A320 N',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    'IXU  →  DEL',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // Flight info row
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 16, 14, 18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Departure
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('21:20', style: _timeStyle()),

                        Text('19 Jun, Fri', style: _dateStyle()),
                        Text('Chhatrapati\nSambhajinagar', style: _cityStyle()),
                      ],
                    ),
                  ),
                  // Middle duration
                  SizedBox(
                    width: 80,
                    child: Column(
                      children: [
                        Text('2h 5m', style: _durationStyle()),
SizedBox(height: 3,),
                        Container(height: 1, color: AppColors.border),
                        SizedBox(height: 3,),

                        Text('Non stop', style: _durationStyle()),
                      ],
                    ),
                  ),
                  // Arrival
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('23:25', style: _timeStyle()),

                        Text('19 Jun, Fri', style: _dateStyle()),
                        Text(
                          'New Delhi\nDEL, Terminal T2',
                          textAlign: TextAlign.right,
                          style: _cityStyle(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _timeStyle() => GoogleFonts.poppins(
    fontSize: 19,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  TextStyle _dateStyle() => GoogleFonts.poppins(
    fontSize: 12,
    color: AppColors.textMid,
  );

  TextStyle _cityStyle() => GoogleFonts.poppins(
    fontSize: 12,
    color: AppColors.textMid,
    height: 1.3,
  );

  TextStyle _durationStyle() => GoogleFonts.poppins(
    fontSize: 11,
    color: Color(0xff707070),
  );
}



// ---------------- Fare Card ----------------

class _FareCard extends StatelessWidget {
  const _FareCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _FareRow('Base Fare', '₹5,800'),
          _FareRow('Taxes & Fees', '₹1,800'),
          _FareRow('Seat Selection', '₹499'),
          _FareRow('Discount (MMTDEAL)', '-₹499', valueColor: AppColors.green),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: _DashedDivider(),
          ),
          _FareRow(
            'Total Amount',
            '₹8,099',
            isTotal: true,
          ),
        ],
      ),
    );
  }
}

class _FareRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;
  final Color? valueColor;
  const _FareRow(this.label, this.value,
      {this.isTotal = false, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: isTotal ? 15 : 13,
              fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
              color: isTotal ? AppColors.textDark : Color(0xff484848),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: isTotal ? 15 : 13,
              fontWeight: isTotal ? FontWeight.w600 : FontWeight.w500,
              color: valueColor ??
                  (isTotal ? AppColors.textDark : Color(0xff1B1A1A)),
            ),
          ),
        ],
      ),
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

// ---------------- Footer ----------------

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFEEEEEE))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Payable',
            style: GoogleFonts.poppins(
              fontSize: 11,
              color: AppColors.textLight,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '₹8,099',
            style: GoogleFonts.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.purple1, AppColors.purple2],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {},
                  child: Center(
                    child: Text(
                      'Proceed to Payment',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}