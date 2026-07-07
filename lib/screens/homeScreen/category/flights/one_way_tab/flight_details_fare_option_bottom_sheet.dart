

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trip/screens/homeScreen/category/flights/one_way_tab/flight_detail_screen.dart';

class _Colors {
  static const purpleDark = Color(0xFF5B3FD1); // gradient start
  static const purpleLight = Color(0xFF8A4FE0); // gradient end
  static const purpleAccent = Color(0xFF6C4EE3); // links, selected border
  static const green = Color(0xFF2FA84F); // check icon
  static const amber = Color(0xFFE0A400); // warning / info icon
  static const textPrimary = Color(0xFF1A1A1A);
  static const textSecondary = Color(0xFF6B6B6B);
  static const border = Color(0xffC7C7C7);
  static const chipBg = Color(0xFFF3EEFD);
}

/// ---- Data models ---------------------------------------------------------
class FareTab {
  final String label;
  final String priceFrom;
  const FareTab({required this.label, required this.priceFrom});
}

class FareCardData {
  final String title;
  final String price;
  final String cabinBag;
  final String checkIn;
  final String cancellationFee;
  final String dateChangeFee;
  const FareCardData({
    required this.title,
    required this.price,
    required this.cabinBag,
    required this.checkIn,
    required this.cancellationFee,
    required this.dateChangeFee,
  });
}

/// ---- Bottom sheet widget --------------------------------------------------
class FlightFareBottomSheet extends StatefulWidget {
  const FlightFareBottomSheet({super.key});

  @override
  State<FlightFareBottomSheet> createState() => _FlightFareBottomSheetState();
}

class _FlightFareBottomSheetState extends State<FlightFareBottomSheet> {
  int _selectedTab = 0; // 0 = Economy, 1 = Premium Economy
  bool _priceDropProtection = false;

  final List<FareTab> _tabs = const [
    FareTab(label: 'Economy', priceFrom: 'From ₹6,983'),
    FareTab(label: 'Premium Economy', priceFrom: 'From ₹16,983'),
  ];

  final Map<int, FareCardData> _fareCards = const {
    0: FareCardData(
      title: 'Saver',
      price: '₹ 10,128',
      cabinBag: '7 Kgs / Adult',
      checkIn: '15 Kgs / Adult',
      cancellationFee: '₹6,983',
      dateChangeFee: '₹6,983',
    ),
    1: FareCardData(
      title: 'Flexi Plus',
      price: '₹ 12,128',
      cabinBag: '7 Kgs / Adult',
      checkIn: '15 Kgs / Adult',
      cancellationFee: '₹6,983',
      dateChangeFee: '₹6,983',
    ),
  };

  @override
  Widget build(BuildContext context) {
    final fare = _fareCards[_selectedTab]!;

    return DraggableScrollableSheet(
      initialChildSize: 0.80,
      minChildSize: 0.5,
      maxChildSize: 0.87,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF2F2F2),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              _buildHeader(context),
              SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Container(
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white, // Color moves here
                        borderRadius: BorderRadius.circular(14), // Set your radius value here
                      ),


                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildAirlineBar(),
                          const SizedBox(height: 10),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: _buildFlightTimeRow(),
                          ),
                          const SizedBox(height: 10),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: _buildViewFlightDetailsLink(),
                          ),
                          const SizedBox(height: 7),

                          _DashedDivider(),
                          const SizedBox(height: 12),
                          _buildSectionTitle('Select Fare options'),
                          const SizedBox(height: 10),
                          _buildFareTabs(),
                          const SizedBox(height: 14),
                          _buildFareCard(fare),
                          const SizedBox(height: 14),
                          _buildFareCard(fare),
                          const SizedBox(height: 14),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Fixed Book Now bar pinned to the bottom of the sheet
              SizedBox(height: 15),

            ],
          ),
        );
      },
    );
  }

  // ---- Header: "Flight details & Fare options" with close (X) ----
  Widget _buildHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black87),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          Expanded(
            child: Text(
              'Flight details & Fare options',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: _Colors.textPrimary,
              ),
            ),
          ),
          const SizedBox(width: 40), // balances the close icon
        ],
      ),
    );
  }

  // ---- Purple gradient bar: airline, flight no, aircraft, route code ----
  Widget _buildAirlineBar() {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft:Radius.circular(10), topRight: Radius.circular(10)),
        gradient: const LinearGradient(
          colors: [_Colors.purpleDark, _Colors.purpleLight],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.flight, color: Colors.white, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'IndiGo   AI 1843 | Airbus A320 N',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            'IXU  →  DEL',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ---- Departure - duration - arrival row ----
  Widget _buildFlightTimeRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('21:20',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: _Colors.textPrimary)),

              Text('19 Jun, Fri',
                  style: GoogleFonts.poppins(
                      fontSize: 12, color: _Colors.textSecondary)),

              Text('Chhatrapati\nSambhajinagar',
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: _Colors.textPrimary)),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text('2h 5m',
                  style: GoogleFonts.poppins(
                      fontSize: 12, color: _Colors.textSecondary)),

              Row(
                children: [
                  Expanded(
                      child: Divider(color: _Colors.border, thickness: 1)),
                  const Icon(Icons.circle, size: 5, color: _Colors.border),
                  Expanded(
                      child: Divider(color: _Colors.border, thickness: 1)),
                ],
              ),

              Text('Non stop',
                  style: GoogleFonts.poppins(
                      fontSize: 12, color: _Colors.textSecondary)),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('23:25',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: _Colors.textPrimary)),

              Text('19 Jun, Fri',
                  style: GoogleFonts.poppins(
                      fontSize: 12, color: _Colors.textSecondary)),

              Text('New Delhi\nDEL, Terminal 2',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: _Colors.textPrimary)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildViewFlightDetailsLink() {
    return GestureDetector(
      onTap: () {},
      child: Text(
        'View Flight Details',
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: _Colors.purpleAccent,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: _Colors.textPrimary,
        ),
      ),
    );
  }

  // ---- Economy / Premium Economy selectable chips ----
  Widget _buildFareTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(_tabs.length, (index) {
          final tab = _tabs[index];
          final selected = _selectedTab == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedTab = index),
              child: Container(
                margin: EdgeInsets.only(right: index == 0 ? 10 : 0),
                padding:
                const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                decoration: BoxDecoration(
                  color: selected ? _Colors.chipBg : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: selected ? _Colors.purpleAccent : _Colors.border,
                    width: selected ? 1.4 : 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tab.label,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: selected
                            ? _Colors.purpleAccent
                            : Color(0xff707070),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      tab.priceFrom,
maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: Color(0xff707070),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // ---- Fare details card (Saver / Flexi Plus) ----
  Widget _buildFareCard(FareCardData fare) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _Colors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fare.title,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: _Colors.textPrimary,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      fare.price,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: _Colors.textPrimary,
                      ),
                    ),
                    Text(
                      '/adult',
                      style: GoogleFonts.poppins(
                        fontSize: 11.5,
                        color: _Colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),

            _fareRow(Icons.check_circle, _Colors.green, 'Cabin bag',
                fare.cabinBag),
            const SizedBox(height: 10),
            _fareRow(
                Icons.check_circle, _Colors.green, 'Check - in', fare.checkIn),
            const SizedBox(height: 10),
            _fareRow(Icons.error, _Colors.amber, 'Cancellation',
                'Cancellation fee starting\n${fare.cancellationFee}'),
            const SizedBox(height: 10),
            _fareRow(Icons.error, _Colors.amber, 'Date Change',
                'Date Change fee starting\n${fare.dateChangeFee}'),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {},
              child: Text(
                'More View',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: _Colors.purpleAccent,
                ),
              ),
            ),
            const SizedBox(height: 7),
            _DashedDivider(),
            const SizedBox(height: 10),
            _buildPriceDropCheckbox(fare),
            const SizedBox(height: 15),
            InkWell(
              onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>FlightDetailsScreen()));

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
                    "Book Now",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 2),

          ],
        ),
      ),
    );
  }

  Widget _fareRow(IconData icon, Color iconColor, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: iconColor),
        const SizedBox(width: 8),
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: _Colors.textSecondary,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            softWrap: false,
            textAlign: TextAlign.start,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: _Colors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  // ---- Price drop protection checkbox ----
  Widget _buildPriceDropCheckbox(FareCardData fare) {
    return Row(
      children: [
        SizedBox(
          width: 16,
          height: 16,
          child: Checkbox(
            side: BorderSide(
              color: Color(0xffD5D7DA),
              width: 1.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            value: _priceDropProtection,
            activeColor: _Colors.purpleAccent,
            onChanged: (v) =>
                setState(() => _priceDropProtection = v ?? false),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: _Colors.textPrimary,
                  fontWeight: FontWeight.w600
              ),
              children: [
                const TextSpan(text: 'Add Price Drop Protection at '),
                TextSpan(
                  text: fare.cancellationFee,
                  style:GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ---- Book Now button (gradient, pinned) ----
  Widget _buildBookNowButton() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [_Colors.purpleDark, _Colors.purpleLight],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(28),
          onTap: () {
            // TODO: hook up booking flow
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Center(
              child: Text(
                'Book Now',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
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
                  color: const Color(0xFFE0E0E8),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}