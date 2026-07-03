import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TripDetailsScreen extends StatelessWidget {
  final VoidCallback onBack;
  const TripDetailsScreen({super.key, required this.onBack});

  // ---- Colors (kept consistent with the rest of the app) ----
  static const Color purple = Color(0xff7750D5);
  static const Color ongoingColor = Color(0xFFEAB33E);
  static const Color greyText = Color(0xff707070);
  static const Color borderGrey = Color(0xffEDEDED);
  static const Color blackText = Color(0xFF1B1B1B);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF2F2F2),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: onBack,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 15),
                  const SizedBox(width: 8),
                  Text(
                    'Back',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 17,
                                  height: 17,
                                  decoration:  BoxDecoration(
                                    shape: BoxShape.circle,

                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(

                                      "assets/images/ongoing_title.svg",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  "Ongoing",
                                  style:  GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color:Color(0xFFEAB33E),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                             "01 Jun - 06 Jun",
                              style:  GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff707070),
                              ),
                            ),
                          ],
                        ),
                      ),

                      _DashedDivider(),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 7),

                            SizedBox(
                                width: 40,
                                height: 70,
                                child: Center(child: SvgPicture.asset("assets/images/ongoing_trip.svg"))
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                   "Delhi - Goa",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF1B1B1B),
                                    ),
                                  ),

                                  _DetailRow(color: Color(0xFFEAB33E), label: 'Flight', value:"DEL-GOX"),

                                  _DetailRow(color: Color(0xFFEAB33E), label: 'Hotel', value: "Taj Exotica Resort"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color:Color(0xffC7C7C7)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('01 Jun', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: TripDetailsScreen.blackText)),
                                  Text('Ongoing', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: TripDetailsScreen.ongoingColor)),
                                  Text('06 Jun', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: TripDetailsScreen.blackText)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 35,
                                      child: Container(height: 5, color:Color(0xff9954E1)),
                                    ),
                                    Expanded(
                                      flex: 65,
                                      child: Container(height: 5, color: const Color(0xffE0E0E0)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Text(
                    'Travel Details',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff787878)
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: const _SectionHeader(title: 'Hotel Details'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: const _HotelDetailsCard(),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: const _SectionHeader(title: 'Flight Details'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: const _FlightDetailsCard(),
                ),
                const SizedBox(height: 15),

              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}



class _DetailBullet extends StatelessWidget {
  final String label;
  final String value;
  const _DetailBullet({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400),
        children: [
          TextSpan(text: '•  ', style: GoogleFonts.poppins(color: TripDetailsScreen.ongoingColor)),
          TextSpan(text: '$label ', style: GoogleFonts.poppins(color: TripDetailsScreen.ongoingColor)),
          TextSpan(text: value, style: GoogleFonts.poppins(color: TripDetailsScreen.blackText, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _DashedDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const dashWidth = 4.0;
        const dashSpace = 4.0;
        final dashCount = (constraints.maxWidth / (dashWidth + dashSpace)).floor();
        return Row(
          children: List.generate(dashCount, (_) {
            return Padding(
              padding: const EdgeInsets.only(right: dashSpace),
              child: Container(width: dashWidth, height: 1, color: TripDetailsScreen.purple),
            );
          }),
        );
      },
    );
  }
}

/// Purple gradient section header ("Hotel Details" / "Flight Details")
class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [  Color(0xff7750D5),
            Color(0xffB457EB),
            Color(0xffA751D8)],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}

class _HotelDetailsCard extends StatelessWidget {
  const _HotelDetailsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:  BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),

        ),
        border: Border.all(
          color: Color(0xffC7C7C7)
        ),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 65,
                  height: 65,
                  color: const Color(0xffE8E8E8),
                  child: Image.asset("assets/images/my_trip_img.png",fit: BoxFit.cover,),
                  // Replace with: Image.asset('assets/images/hotel.png', fit: BoxFit.cover)
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6),
                    Text(
                      '7 Apple Hotel, Aurangabad',
                      style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xff1B1A1A)),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Chhatrapati Sambhaji Maharaj , New Delhi',
                            style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: Color(0xff707070)),
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Color(0xffF9DC00), size: 14),
                            const SizedBox(width: 2),
                            Text('2.5K', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: TripDetailsScreen.blackText)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),


            ],
          ),
          const SizedBox(height: 3),
          Divider(color: Color(0xffC7C7C7),),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CHECK IN', style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w500, color: TripDetailsScreen.greyText)),

                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w700, color: TripDetailsScreen.blackText),
                        children: [
                          const TextSpan(text: '01 Jun '),
                          TextSpan(text: '26, Thu', style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText)),
                        ],
                      ),
                    ),
                    Text('2PM', style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText)),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  border: Border.all(color: TripDetailsScreen.purple),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('1 NIGHT', style: GoogleFonts.poppins(fontSize: 9, fontWeight: FontWeight.w600, color: TripDetailsScreen.purple)),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('CHECK OUT', style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w500, color: TripDetailsScreen.greyText)),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w700, color: TripDetailsScreen.blackText),
                        children: [
                          const TextSpan(text: '06 Jun '),
                          TextSpan(text: '26, Thu', style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText)),
                        ],
                      ),
                    ),
                    Text('2PM', style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Divider(color: Color(0xffC7C7C7),),
          Text('Guests & Rooms', style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText)),
          Text('2 Adults - 1 Room', style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: TripDetailsScreen.blackText)),
        ],
      ),
    );
  }
}

class _FlightDetailsCard extends StatelessWidget {
  const _FlightDetailsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 3)),
        ],
        border: Border.all(
            color: Color(0xffC7C7C7)
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 45,

                child: SvgPicture.asset("assets/images/flights.svg",fit: BoxFit.cover,),
                // Replace with: Image.asset('assets/images/indigo_logo.png')
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('IndiGo', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: TripDetailsScreen.blackText)),
                    Text('AI 1843 | Airbus A320 N', style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText)),
                    Row(
                      children: [
                        Text('IXU', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xff1B1A1A))),
                       Text("--->", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xff1B1A1A))),
                        Text('DEL', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xff1B1A1A))),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Divider(color: Color(0xffC7C7C7),),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('21:20', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700, color: TripDetailsScreen.blackText)),
                    Text('19 Jun, Fri', style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w500, color: TripDetailsScreen.greyText)),
                    Text('Chhatrapati Sambhajinagar', style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('2h 5m', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: TripDetailsScreen.blackText)),

                    Divider(color: Color(0xff7750D5),),


                    Text('Non stop', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('23:25', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700, color: TripDetailsScreen.blackText)),
                    Text('19 Jun, Fri', style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w500, color: TripDetailsScreen.greyText)),
                    Text(
                      'New Delhi',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText),
                    ),
                    Text(
                      'DEL, Terminal T2',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Divider(color: Color(0xffC7C7C7),),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Passenger Name', style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText)),

                  Text('Sarah Smith', style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: TripDetailsScreen.blackText)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('SEAT NO', style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText)),

                  Text('16A', style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: TripDetailsScreen.blackText)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DashedLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const dashWidth = 3.0;
        const dashSpace = 3.0;
        final dashCount = (constraints.maxWidth / (dashWidth + dashSpace)).floor().clamp(1, 100);
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(dashCount, (_) {
            return Padding(
              padding: const EdgeInsets.only(right: dashSpace),
              child: Container(width: dashWidth, height: 1, color: TripDetailsScreen.borderGrey),
            );
          }),
        );
      },
    );
  }
}


class _DetailRow extends StatelessWidget {
  final Color color;
  final String label;
  final String value;
  const _DetailRow({required this.color, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400),
        children: [
          TextSpan(text: '•  ', style:  GoogleFonts.poppins(color: color)),
          TextSpan(text: '$label ', style: GoogleFonts.poppins(color: color)),
          TextSpan(
            text: value,
            style: GoogleFonts.poppins(color: Color(0xFF1B1B1B), fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}