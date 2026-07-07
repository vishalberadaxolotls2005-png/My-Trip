import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trip/screens/homeScreen/category/flights/one_way_tab/flight_result_screen.dart';
import 'package:my_trip/screens/homeScreen/category/flights/one_way_tab/travelingFrom_Bottom_sheet.dart';
import 'package:my_trip/screens/homeScreen/category/hotels/serach_details_screen.dart';



class OneWayTab extends StatefulWidget {

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


  @override
  State<OneWayTab> createState() => _OneWayTabState();
}

class _OneWayTabState extends State<OneWayTab> {

  final TextEditingController _locationController =
  TextEditingController(text: 'Chhatrapati Sambhaji...');
  final TextEditingController _checkInController = TextEditingController(text: '18 Jun');
  final TextEditingController _checkOutController = TextEditingController(text: '19 Jun');
  final TextEditingController _guestsController =
  TextEditingController(text: '1 Room, 2 Adults & 0 Children');


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
  void dispose() {
    _locationController.dispose();
    _checkInController.dispose();
    _checkOutController.dispose();
    _guestsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,

      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ---------- Location row (plain editable TextField) ----------
                Stack(
                alignment: Alignment.center,
                children: [

                  /// FROM & TO
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => const TravellingFromBottomSheet(),
                            );
                          },
                          child: _locationCard(
                            heading: "FROM",
                            title: "Chhatrapati Sambh..",
                            subtitle: "IXU – Chhatrapati Sambh...",
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: InkWell(
                          onTap: (){
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => const TravellingFromBottomSheet(),
                            );
                          },
                          child: _locationCard(
                            heading: "TO",
                            title: "New Delhi",
                            subtitle: "DEL – Indira Gandhi Intern...",
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// Swap Button
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                  color: Color(0xffBABABA),
                          width: 1,
                        ),
                      ),
                      child: Center(child: SvgPicture.asset("assets/images/swap.svg"))
                  ),
                ],
              ),
                  const SizedBox(height: 12),

                  // ---------- Date row (plain editable TextFields, keyboard input) ----------
                  Row(
                    children: [
                      Expanded(
                        child:Container(

                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffF6F6F6),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0xffBABABA),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                "DEPARTURE DATE",
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color:Color(0xff707070) ,
                                ),
                              ),



                              Row(
                                children: [
                                  Text(
                                    "18 Jun",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff1B1A1A),
                                    ),
                                  ),
SizedBox(width: 3),
                                  Text(
                                    "Thu, 2026",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff707070),
                                    ),
                                  ),
                                ],
                              ),




                            ],
                          ),
                        )
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: Container(

                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffF6F6F6),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0xffBABABA),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                "+ ADD RETURN DATE",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color:Color(0XFF7750D5) ,
                                ),
                              ),

                              Text(
                                "Save more on round trips!",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFF1C766D),
                                ),
                              ),






                            ],
                          ),
                        )
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // ---------- Guests row (plain editable TextField, keyboard input) ----------
                  Container(

                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffF6F6F6),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xffBABABA),
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
                            color:Color(0xff707070) ,
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
                                color: Color(0xff1B1A1A),
                              ),
                            ),
                            SizedBox(width: 3),
                            Text(
                              "Economy/Premium Economy",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff707070),
                              ),
                            ),
                          ],
                        ),




                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  Text(
                    "SPECIAL FARES",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color:Color(0xff707070) ,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                          child:Container(

                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Color(0xffBABABA),
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
                                    color:Color(0xff2E2F30) ,
                                  ),
                                ),

                                Text(
                                  "Extra discounts/baggage",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff1C766D),
                                  ),
                                ),






                              ],
                            ),
                          )
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
                                color: Color(0xffBABABA),
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
                                    color:Color(0xff2E2F30) ,
                                  ),
                                ),

                                Text(
                                  "Up to ₹600 off",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff1C766D),
                                  ),
                                ),






                              ],
                            ),
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // ---------- Search button ----------
                  InkWell(
                    onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => FlightResultsScreen()));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff7750D5),
                            Color(0xffB457EB),
                            Color(0xffA751D8)
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
                ],
              ),
            ),
            const SizedBox(height: 18),

            // ---------- Offers section ----------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
              color: OneWayTab.screenBg,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Offers',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w700, color: OneWayTab.blackText)),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _offers.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) => _OfferCard(offer: _offers[index]),
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

  Widget _locationCard({
    required String heading,
    required String title,
    required String subtitle,
  }) {
    return Container(

      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
color: Color(0xffBABABA),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            heading,
            style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color:Color(0xff707070) ,
            ),
          ),



          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xff1B1A1A),
            ),
          ),



          Text(
            subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff707070),
            ),
          ),
        ],
      ),
    );
  }
}

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
                errorBuilder: (context, error, stack) => Container(color: const Color(0xffCFCFCF)),
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black.withOpacity(0.0), Colors.black.withOpacity(0.75)],
                    stops: const [0.4, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                child: Text(offer.badgeLabel,
                    style: GoogleFonts.poppins(fontSize: 9, fontWeight: FontWeight.w700, color: OneWayTab.blackText)),
              ),
            ),
            Positioned(

              right: 8,
              bottom: 45,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                child: Text(offer.brandLabel,
                    style: GoogleFonts.poppins(fontSize: 7, fontWeight: FontWeight.w700, color: OneWayTab.purple)),
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
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                    child: Text(offer.tagLine,
                        style: GoogleFonts.poppins(fontSize: 8, fontWeight: FontWeight.w600, color: Colors.black)),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    offer.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white),
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




