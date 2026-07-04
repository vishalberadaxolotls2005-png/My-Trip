import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trip/screens/homeScreen/category/hotels/serach_details_screen.dart';

import '../room_bottom_sheet.dart';

class ByNightTab extends StatefulWidget {
  const ByNightTab({super.key});

  static const Color purple = Color(0xff7750D5);
  static const Color purpleLight = Color(0xffB457EB);
  static const Color purpleDark = Color(0xffA751D8);
  static const Color greyText = Color(0xff707070);
  static const Color blackText = Color(0xFF1B1B1B);
  static const Color borderGrey = Color(0xffE0E0E0);
  static const Color screenBg = Color(0xffF2F2F2);

  @override
  State<ByNightTab> createState() => _ByNightTabState();
}

class _ByNightTabState extends State<ByNightTab> {

  final TextEditingController _locationController =
  TextEditingController(text: 'Chhatrapati Sambhaji...');
  final TextEditingController _checkInController = TextEditingController(text: '18 Jun');
  final TextEditingController _checkOutController = TextEditingController(text: '19 Jun');
  final TextEditingController _guestsController =
  TextEditingController(text: '1 Room, 2 Adults & 0 Children');


  static const List<_Offer> _offers = [
    _Offer(
      badgeLabel: 'HOTELS',
      tagLine: 'PRICE DROP ALERT:',
      title: 'Book fabHotels @ Up to 40% OFF*',
      brandLabel: 'fabHOTELS',
      imgPath: 'assets/images/my_trip_img.png',
    ),
    _Offer(
      badgeLabel: 'FOR CYGNETT',
      tagLine: 'MEMBER DEAL:',
      title: 'Grab Up to 25% OFF on Cygnett Hotels',
      brandLabel: 'CYGNETT',
      imgPath: 'assets/images/my_trip_img.png',
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
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xffF6F6F6),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffC7C7C7)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Center(child: Icon(Icons.search, color: ByNightTab.blackText, size: 20)),
                        ),
                         SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: _locationController,
                                keyboardType: TextInputType.text,
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: ByNightTab.blackText,
                                ),
                                decoration: const InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(top: 12),
                                  border: InputBorder.none,
                                  hintText: 'Search location',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  'India',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: ByNightTab.greyText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.only(top: 13),
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                color: Color(0xffEBE7F3),
                                border: Border.all(color: Color(0xff815DD8)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                   SvgPicture.asset("assets/images/near_me.svg",color:Color(0xff815DD8) ,),
                                  const SizedBox(width: 4),
                                  Text('Near Me',
                                      style: GoogleFonts.poppins(
                                          fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xff815DD8))),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // ---------- Date row (plain editable TextFields, keyboard input) ----------
                  Container(
                    width: double.infinity,
                    height: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: Color(0xffF6F6F6),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:Color(0xffC7C7C7)),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/images/calender.svg"),
                        const SizedBox(width: 12),

                        // Check In
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _checkInController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "26, Thu",
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 10),

                        // Night Badge
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Color(0xffEBE7F3),
                            border: Border.all(color: Color(0xff815DD8)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "1 NIGHT",
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: ByNightTab.purple,
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        // Check Out
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _checkOutController,
                                  textAlign: TextAlign.right,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "27, Fri",
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                  const SizedBox(height: 12),

                  // ---------- Guests row (plain editable TextField, keyboard input) ----------
                  InkWell(
                    onTap: (){
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => const RoomGuestBottomSheet(),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xffF6F6F6),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xffC7C7C7)),
                      ),
                      child: Row(
                        children: [
                        SvgPicture.asset("assets/images/person.svg"),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text("1 Room, 2 Adults & 0 Children", style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: ByNightTab.blackText,
                            ),)
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // ---------- Search button ----------
                  InkWell(
                    onTap: () {
Navigator.push(context, MaterialPageRoute(builder: (context)=>SerachDetailsScreen()));

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
                          "Search",
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
            const SizedBox(height: 24),

            // ---------- Offers section ----------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
              color: ByNightTab.screenBg,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Offers',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w700, color: ByNightTab.blackText)),
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
                    style: GoogleFonts.poppins(fontSize: 9, fontWeight: FontWeight.w700, color: ByNightTab.blackText)),
              ),
            ),
            Positioned(

              right: 8,
              bottom: 30,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                child: Text(offer.brandLabel,
                    style: GoogleFonts.poppins(fontSize: 7, fontWeight: FontWeight.w700, color: ByNightTab.purple)),
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



