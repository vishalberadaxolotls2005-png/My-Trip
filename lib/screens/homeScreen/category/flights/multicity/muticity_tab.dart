import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'muticity_flight_details_screen.dart';

class AppColors {
  static const purple1 = Color(0xFF7B2FF7);
  static const purple2 = Color(0xFFB721FF);
  static const purpleAccent = Color(0xFF8B3FF0);
  static const fieldBg = Color(0xFFF2F2F2);
  static const textDark = Color(0xFF1A1A1A);
  static const textMid = Color(0xFF6B6B6B);
  static const textLight = Color(0xFF9A9A9A);
  static const green = Color(0xFF1E9E6B);
  static const border = Color(0xFFE2E2E2);
}

// One multicity leg: FROM -> TO on a DATE
class _CityLeg {
  String fromCode;
  String fromSub;
  String toCode;
  String toSub;
  String dateCode;
  String dateSub;

  _CityLeg({
    required this.fromCode,
    required this.fromSub,
    required this.toCode,
    required this.toSub,
    required this.dateCode,
    required this.dateSub,
  });
}

class MuticityTab extends StatefulWidget {
  static const Color purple = Color(0xff7750D5);
  static const Color purpleLight = Color(0xffB457EB);
  static const Color purpleDark = Color(0xffA751D8);
  static const Color greyText = Color(0xff707070);
  static const Color blackText = Color(0xFF1B1B1B);
  static const Color borderGrey = Color(0xffE0E0E0);
  static const Color screenBg = Color(0xffF2F2F2);
  static const Color borderColor = Color(0xffCFCFCF);
  static const Color headingColor = Color(0xff6E6E6E);
  static const Color titleColor = Color(0xff202020);
  static const Color subtitleColor = Color(0xff7E7E7E);

  const MuticityTab({super.key});

  static const List<_Offer> _offers = [
    _Offer(
      badgeLabel: 'FLIGHTS',
      tagLine: 'CHECK THIS:',
      title: 'Visa-free Airport Transit Through Germany',
      brandLabel: 'Lufthansa',
      imgPath: 'assets/images/img.png',
    ),
    _Offer(
      badgeLabel: 'FLIGHTS',
      tagLine: 'CHECK THIS:',
      title: 'Visa-free Airport Transit Through Germany',
      brandLabel: 'Lufthansa',
      imgPath: 'assets/images/img.png',
    ),
  ];

  @override
  State<MuticityTab> createState() => _MuticityTabState();
}

class _MuticityTabState extends State<MuticityTab> {
  // Max number of legs allowed in multicity (typical airline limit is 5-6)
  static const int _maxLegs = 5;

  final List<_CityLeg> _legs = [
    _CityLeg(
      fromCode: 'IXU',
      fromSub: 'Chhatrapati S...',
      toCode: 'DEL',
      toSub: 'New Delhi',
      dateCode: '19 Jun',
      dateSub: 'Friday',
    ),
  ];

  void _addCity() {
    if (_legs.length >= _maxLegs) return;
    final last = _legs.last;
    setState(() {
      _legs.add(
        _CityLeg(
          // New leg's FROM defaults to the previous leg's TO, like a real
          // multicity itinerary (DEL -> PNQ following IXU -> DEL).
          fromCode: last.toCode,
          fromSub: last.toSub,
          toCode: '',
          toSub: 'Select city',
          dateCode: '',
          dateSub: 'Select date',
        ),
      );
    });
  }

  void _removeCity(int index) {
    setState(() {
      _legs.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // One FROM / TO / DATE row per leg
                for (int i = 0; i < _legs.length; i++) ...[
                  _LegRow(
                    leg: _legs[i],
                    // First leg can't be removed, only legs added via
                    // "+ ADD CITY" show a remove (x) button.
                    onRemove: i == 0 ? null : () => _removeCity(i),
                  ),
                  const SizedBox(height: 15),
                ],

                // + ADD CITY dashed button
                if (_legs.length < _maxLegs) ...[
                  _AddCityButton(onTap: _addCity),
                  const SizedBox(height: 15),
                ],

                // TRAVELLER & CLASS
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffF6F6F6),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xffBABABA),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "TRAVELLER & CLASS",
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff707070),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "1,",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff1B1A1A),
                            ),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            "Economy/Premium Economy",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff707070),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // SPECIAL FARES
                Text(
                  "SPECIAL FARES",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff707070),
                  ),
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xffBABABA),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Student",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff2E2F30),
                              ),
                            ),
                            Text(
                              "Extra discounts/baggage",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff1C766D),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xffBABABA),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Senior Citizen",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff2E2F30),
                              ),
                            ),
                            Text(
                              "Up to ₹600 off",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff1C766D),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // SEARCH FLIGHTS button
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MuticityFlightDetailsScreen()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff7750D5),
                          Color(0xffB457EB),
                          Color(0xffA751D8),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Search Flights",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // OFFERS section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
            color: MuticityTab.screenBg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Offers',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: MuticityTab.blackText)),
                const SizedBox(height: 8),
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: MuticityTab._offers.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) =>
                        _OfferCard(offer: MuticityTab._offers[index]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- FROM / TO / DATE row (one multicity leg) ----------------

class _LegRow extends StatelessWidget {
  final _CityLeg leg;
  final VoidCallback? onRemove;

  const _LegRow({required this.leg, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: _LocationField(
                label: 'FROM',
                code: leg.fromCode,
                subtitle: leg.fromSub,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 4,
              child: _LocationField(
                label: 'To',
                code: leg.toCode,
                subtitle: leg.toSub,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 3,
              child: _LocationField(
                label: 'Date',
                code: leg.dateCode,
                subtitle: leg.dateSub,
              ),
            ),
          ],
        ),
        // Small remove (x) button, only shown on legs added via + ADD CITY
        if (onRemove != null)
          Positioned(
            top: -6,
            right: -6,
            child: InkWell(
              onTap: onRemove,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xffBABABA)),
                ),
                child: const Icon(Icons.close, size: 12, color: Color(0xff707070)),
              ),
            ),
          ),
      ],
    );
  }
}

// ---------------- FROM / TO / DATE field ----------------

class _LocationField extends StatelessWidget {
  final String label;
  final String code;
  final String subtitle;
  const _LocationField({
    required this.label,
    required this.code,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: const Color(0xff707070),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xffF6F6F6),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xffC7C7C7),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                code.isEmpty ? '--' : code,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff1B1A1A),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: const Color(0xff707070),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ---------------- + ADD CITY ----------------

class _AddCityButton extends StatelessWidget {
  final VoidCallback onTap;
  const _AddCityButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: DottedBorderBox(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14),
          alignment: Alignment.center,
          child: Text(
            '+ ADD CITY',
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.purpleAccent,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}

// Simple dashed-border container (no external package needed)
class DottedBorderBox extends StatelessWidget {
  final Widget child;
  const DottedBorderBox({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedBorderPainter(
        color: AppColors.purpleAccent.withOpacity(0.6),
        radius: 8,
      ),
      child: child,
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double radius;
  _DashedBorderPainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );
    final path = Path()..addRRect(rrect);

    const dashWidth = 5.0;
    const dashSpace = 4.0;
    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final next = distance + dashWidth;
        canvas.drawPath(
          metric.extractPath(distance, next.clamp(0, metric.length)),
          paint,
        );
        distance = next + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ---------------- Offers section ----------------

class _Offer {
  final String badgeLabel;
  final String tagLine;
  final String title;
  final String brandLabel;
  final String imgPath;

  const _Offer({
    required this.badgeLabel,
    required this.tagLine,
    required this.title,
    required this.brandLabel,
    required this.imgPath,
  });
}

class _OfferCard extends StatelessWidget {
  final _Offer offer;
  const _OfferCard({required this.offer});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 230,
        height: 150,
        color: const Color(0xffDDDDDD),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                offer.imgPath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stack) =>
                    Container(color: const Color(0xffCFCFCF)),
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.75)
                    ],
                    stops: const [0.4, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Text(offer.badgeLabel,
                    style: GoogleFonts.poppins(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: MuticityTab.blackText)),
              ),
            ),
            Positioned(
              right: 8,
              bottom: 45,
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Text(offer.brandLabel,
                    style: GoogleFonts.poppins(
                        fontSize: 7,
                        fontWeight: FontWeight.w700,
                        color: MuticityTab.purple)),
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(offer.tagLine,
                        style: GoogleFonts.poppins(
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    offer.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
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