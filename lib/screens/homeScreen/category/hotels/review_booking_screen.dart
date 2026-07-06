import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trip/screens/homeScreen/category/hotels/hotel_booking_bottom_sheet.dart';

/// Fully self-contained "Review Booking" screen.
/// Hotel summary, room details, price summary, primary guest details,
/// agreement checkbox, and the sticky bottom price + Continue bar all
/// live in this one file, in this exact order.
class ReviewBookingScreen extends StatefulWidget {
  const ReviewBookingScreen({super.key});

  @override
  State<ReviewBookingScreen> createState() => _ReviewBookingScreenState();
}

class _ReviewBookingScreenState extends State<ReviewBookingScreen> {
  static const Color purple = Color(0xff7750D5);
  static const Color purpleLight = Color(0xffB457EB);
  static const Color purpleDark = Color(0xffA751D8);
  static const Color greyText = Color(0xff707070);
  static const Color blackText = Color(0xFF1B1B1B);
  static const Color borderGrey = Color(0xffC7C7C7);
  static const Color screenBg = Color(0xffF2F2F2);
  static const Color discountGreen = Color(0xFF12B76A);

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  String _title = 'Mr';
  String _countryCode = '+91';
  bool _agreed = true;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenBg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black12,
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.maybePop(context),
          child: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 17),
        ),
        title: Text(
          'Review Booking',
          style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- Hotel summary card ----------
            _card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/image 16.png',
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stack) => Container(
                            width: 80,
                            height: 80,
                            color: const Color(0xffCFCFCF),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '7 Apple Hotel,\nAurangabad',
                              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700, color: blackText),
                            ),

                            Text(
                              'Chhatrapati Sambhaji\nMaharaj , New Delhi',
                              style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: greyText),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Divider(color: borderGrey),
                  const SizedBox(height: 5),

                  // ---------- Check in / Check out ----------
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('CHECK IN',
                                style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w500, color: greyText)),

                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700, color: blackText),
                                children: [
                                  const TextSpan(text: '18 Jun '),
                                  TextSpan(
                                    text: "'26, Thu",
                                    style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: greyText),
                                  ),
                                ],
                              ),
                            ),
                            Text('2 PM',
                                style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: greyText)),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: purple),
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffF3EFFB)
                        ),
                        child: Text('1 NIGHT',
                            style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w600, color: purple)),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('CHECK OUT',
                                style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w500, color: greyText)),

                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700, color: blackText),
                                children: [
                                  const TextSpan(text: '19 Jun '),
                                  TextSpan(
                                    text: "'26, Thu",
                                    style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: greyText),
                                  ),
                                ],
                              ),
                            ),
                            Text('12 PM',
                                style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: greyText)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: borderGrey),
                  const SizedBox(height: 5),

                  // ---------- Guests & Rooms ----------
                  Text('Guests & Rooms',
                      style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: greyText)),

                  Text('2 Adults - 1 Room',
                      style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700, color: blackText)),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // ---------- Room details card ----------
            _card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Deluxe Room - 1King Bed City View',
                      style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600, color: blackText)),
                  const SizedBox(height: 10),
                  _bullet('Room Only'),
                  _bullet('No meals included'),
                  _bullet('WEEKEND DEAL'),
                  const SizedBox(height: 2),
                  const Divider(color: borderGrey),
                  const SizedBox(height: 5),
                  Text('Non - Refundable',
                      style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: blackText)),
                  const SizedBox(height: 3),
                  Text('Refund is not applicable for this booking',
                      style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: blackText)),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () {},
                    child: Text('Inclusions & Cancellation Policy',
                        style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xff7750D5))),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ---------- Price Summary card ----------
            _card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price Summary',
                      style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: blackText)),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Base Price',
                          style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: greyText)),
                      Text('₹3,200',
                          style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: greyText)),
                    ],
                  ),

                  Text('1 room, 1 Night',
                      style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: greyText)),
                  const SizedBox(height: 5),

                  const Divider(color: borderGrey),

                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Discount by Property',
                          style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xff1C766D))),
                      Text('-₹480',
                          style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xff1C766D))),
                    ],
                  ),
                  const SizedBox(height: 5),

                  const Divider(color: borderGrey),

                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Price after Discount',
                          style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600, color: blackText)),
                      Text('₹2,720',
                          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: blackText)),
                    ],
                  ),
                  const SizedBox(height: 5),

                  const Divider(color: borderGrey),

                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Taxes & Service Fees',
                          style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w400, color: greyText)),
                      Text('₹299',
                          style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: greyText)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(color: borderGrey),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Amount to be paid',
                          style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600, color: blackText)),
                      Text('₹4,699',
                          style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600, color: blackText)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ---------- Primary Guest Details card ----------
            _card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Primary Guest Details',
                      style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: blackText)),
                  const SizedBox(height: 14),

                  // Title / First name / Last name
                  Row(
                    children: [
                      SizedBox(
                        width: 82,
                        child: _dropdownField(
                          value: _title,
                          items: const [ 'Mr','Mrs', 'Ms'],
                          onChanged: (v) => setState(() => _title = v ?? _title),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _textField(controller: _firstNameController, hint: 'FIRST NAME'),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _textField(controller: _lastNameController, hint: 'LAST NAME'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Email
                  _textField(controller: _emailController, hint: 'EMAIL ID', keyboardType: TextInputType.emailAddress),
                  const SizedBox(height: 10),

                  // Country code / Mobile number
                  Row(
                    children: [
                      SizedBox(
                        width: 82,
                        child: _dropdownField(
                          value: _countryCode,
                          items: const ['+91', '+1', '+44'],
                          onChanged: (v) => setState(() => _countryCode = v ?? _countryCode),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _textField(
                          controller: _mobileController,
                          hint: 'MOBILE NUMBER',
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.add, size: 16, color: purple),
                        const SizedBox(width: 4),
                        Text('Add Another Guest',
                            style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: purple)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // ---------- Agreement checkbox card ----------
            _card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 22,
                    height: 22,
                    child: Checkbox(
                      value: _agreed,
                      activeColor: purple,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      onChanged: (v) => setState(() => _agreed = v ?? _agreed),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('By proceeding, I agree',
                            style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w400, color: Color(0xff797979))),

                        InkWell(
                          onTap: () {},
                          child: Text(
                            'User Agreement, Terms of Service and\nCancellation & Hotel Booking Policies',
                            style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: purple, height: 1.4),
                          ),
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

      // ---------- Sticky bottom price + Continue bar ----------
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
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) =>  HotelBookingBottomSheet(),
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

  // ---------- Shared helpers ----------

  Widget _card({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: greyText),
          children: [
            const TextSpan(text: '•  '),
            TextSpan(text: text),
          ],
        ),
      ),
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required String hint,
    TextInputType? keyboardType,
  }) {
    return Container(
      height: 46,

      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderGrey),
      ),
      child: Center(
        child: TextField(

          controller: controller,
          keyboardType: keyboardType,
          style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500, color: blackText),
          decoration: InputDecoration(
            isDense: true,
            border: InputBorder.none,
            hintText: hint,
            hintStyle: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xff707070)),
          ),
        ),
      ),
    );
  }

  Widget _dropdownField({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderGrey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, size: 18, color: greyText),
          style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500, color: blackText),
          items: items
              .map((e) => DropdownMenuItem(
            value: e,
            child: Text(e, style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500, color: blackText)),
          ))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}