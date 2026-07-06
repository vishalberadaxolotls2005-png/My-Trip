import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trip/screens/homeScreen/category/hotels/view_hotel_details.dart';

class SerachDetailsScreen extends StatelessWidget {


  static const Color purple = Color(0xff7750D5);
  static const Color purpleLight = Color(0xffB457EB);
  static const Color purpleDark = Color(0xff7750D5);
  static const Color greyText = Color(0xff707070);
  static const Color blackText = Color(0xFF1B1B1B);
  static const Color borderGrey = Color(0xffD1D1D1);
  static const Color searchBarBg = Color(0xffF5F5F5);
  static const Color screenBg = Color(0xffF2F2F2);

  // Mock data - replace with real search results from your API.
  static const List<_Hotel> _hotels = [
    _Hotel(
      rating: '2.5K',
      name: '7 Apple Hotel, Aurangabad',
      location:
      'Location - CIDCO| 4.5 km drive to MGM Medical College & Hospital | 7.1 km drive to Chhatrapati Sambhaji..',
      price: '₹4,699',
      taxesFee: '+235 taxes & fees',
      priceUnit: 'Per Night',
      imgPath: 'assets/images/image 16.png',
      imageCount: 4,
    ),
    _Hotel(
      rating: '2.5K',
      name: 'Cygnett Resort & Spa, New Delhi',
      location:
      'Location - Aerocity | 3.2 km drive to IGI Airport | 6.4 km drive to Connaught Place..',
      price: '₹5,299',
      taxesFee: '+310 taxes & fees',
      priceUnit: 'Per Night',
      imgPath: 'assets/images/image 17.png',
      imageCount: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- Search bar ----------
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
                        color: searchBarBg,
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
                                  'New Delhi',
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
                          const Icon(Icons.search, color: purple, size: 24),
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
              child: Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _FilterChip(imgPath:"assets/images/filter.svg", label: 'All Filters'),

                  _FilterChip(imgPath: "assets/images/sort.svg", label: 'Sort'),


                  _FilterChip(label: 'Price'),

                  _FilterChip(label: 'Location'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ---------- Results ----------
            Expanded(
              child: Container(
                width: double.infinity,
                color: screenBg,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Showing Hotels In New Delhi',
                        style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w700, color: blackText),
                      ),
                      const SizedBox(height:10 ),
                      for (final hotel in _hotels) ...[
                        _HotelCard(hotel: hotel),
                        const SizedBox(height: 16),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
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
        border: Border.all(color: SerachDetailsScreen.borderGrey),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imgPath != null) ...[
            SvgPicture.asset(imgPath!,height: 14, color: SerachDetailsScreen.blackText),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: GoogleFonts.poppins(
                fontSize: 14, fontWeight: FontWeight.w500, color: SerachDetailsScreen.blackText),
          ),
        ],
      ),
    );
  }
}

class _Hotel {
  final String rating;
  final String name;
  final String location;
  final String price;
  final String taxesFee;
  final String priceUnit;
  final String imgPath;
  final int imageCount;

  const _Hotel({
    required this.rating,
    required this.name,
    required this.location,
    required this.price,
    required this.taxesFee,
    required this.priceUnit,
    required this.imgPath,
    required this.imageCount,
  });
}

class _HotelCard extends StatefulWidget {
  final _Hotel hotel;
  const _HotelCard({required this.hotel});

  @override
  State<_HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<_HotelCard> {
  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------- Image carousel with rating badge + dot indicator ----------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 14),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16),bottom: Radius.circular(16)),
              child: Stack(
                children: [
                  SizedBox(
                    height: 220,
                    width: double.infinity,
                    child: PageView.builder(
                      itemCount: widget.hotel.imageCount,
                      onPageChanged: (index) => setState(() => _activePage = index),
                      itemBuilder: (context, index) => Image.asset(
                        widget.hotel.imgPath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stack) => Container(color: const Color(0xffCFCFCF)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, color: Color(0xffF9DC00), size: 15),
                          const SizedBox(width: 4),
                          Text(
                            widget.hotel.rating,
                            style: GoogleFonts.poppins(
                                fontSize:11, fontWeight: FontWeight.w600, color: SerachDetailsScreen.blackText),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(widget.hotel.imageCount, (index) {
                final isActive = index == _activePage;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: isActive ? 8 : 6,
                  height: isActive ? 8 : 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive ? Color(0xffA657E7) : const Color(0xffD9D9D9),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 10),

          // ---------- Name + location ----------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.hotel.name,
                  style: GoogleFonts.poppins(
                      fontSize: 17, fontWeight: FontWeight.w700, color: SerachDetailsScreen.blackText),
                ),
                const SizedBox(height: 3),
                Text(
                  widget.hotel.location,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      fontSize: 11, fontWeight: FontWeight.w400, color: SerachDetailsScreen.greyText, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // ---------- Price + View Details ----------
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: SerachDetailsScreen.borderGrey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.hotel.price,
                    style: GoogleFonts.poppins(
                        fontSize: 19, fontWeight: FontWeight.bold, color: SerachDetailsScreen.blackText),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.hotel.taxesFee,
                          style: GoogleFonts.poppins(
                              fontSize: 10, fontWeight: FontWeight.w300, color: SerachDetailsScreen.greyText),
                        ),
                        Text(
                          widget.hotel.priceUnit,
                          style: GoogleFonts.poppins(
                              fontSize: 10, fontWeight: FontWeight.w300, color: SerachDetailsScreen.greyText),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HotelDetailsScreen()));
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(

                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                          colors: [
                            SerachDetailsScreen.purple,
                            SerachDetailsScreen.purpleLight,
                            SerachDetailsScreen.purpleDark,
                          ],
                        ),
                      ),
                      child: Text(
                        'View Details',
                        style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}