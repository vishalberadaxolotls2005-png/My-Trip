import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Fully self-contained "Hotel Details" screen.
/// Image carousel, price/Select Room, date & guest chips, check-in/out,
/// Amenities, Property Rules & Information, Explore Similar Stays, and the
/// sticky bottom price bar all live in this one file, in this exact order.
class HotelDetailsScreen extends StatefulWidget {
  const HotelDetailsScreen({super.key});

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  static const Color purple = Color(0xff7750D5);
  static const Color purpleLight = Color(0xffB457EB);
  static const Color purpleDark = Color(0xffA751D8);
  static const Color greyText = Color(0xff707070);
  static const Color blackText = Color(0xFF1B1B1B);
  static const Color borderGrey = Color(0xffE0E0E0);
  static const Color screenBg = Color(0xffF2F2F2);

  int _activeImage = 0;
  static const int _imageCount = 4;

  // Mock data - replace with real amenities from your API.
  static const List<_Amenity> _amenities = [
    _Amenity(icon: Icons.local_parking_outlined, label: 'Parking\nArea'),
    _Amenity(icon: Icons.restaurant_outlined, label: 'Restaurant'),
    _Amenity(icon: Icons.sports_esports_outlined, label: 'Indoor\nGames'),
    _Amenity(icon: Icons.park_outlined, label: 'Garden'),
  ];

  // Mock data - replace with real rules from your API.
  static const List<String> _rules = [
    'Unmarried couples allowed. Local ids are allowed',
    'Primary Guest should be atleast 18 years of age.',
    'Groups with only male guests are also allowed at the property',
    'Passport, Aadhaar and Driving License are accepted as ID proofs',
  ];

  // Mock data - replace with real similar stays from your API.
  static const List<_SimilarHotel> _similarHotels = [
    _SimilarHotel(
      rating: '2.5K',
      name: '7 Apple Hotel, Aurangabad',
      location: 'Location - CIDCO| 4.5 km drive to MGM Medical College & Hospital | 7.1 km drive to Chhatrapati Sambhaji..',
      price: '₹4,699',
      taxesFee: '+235 taxes & fees',
      priceUnit: 'Per Night',
      imgPath: 'assets/images/image 16.png',
    ),
    _SimilarHotel(
      rating: '2.5K',
      name: '7 Apple Hotel, New Delhi',
      location: 'Location - Aerocity | 3.2 km drive to IGI Airport | 6.4 km drive to Connaught Place..',
      price: '₹4,699',
      taxesFee: '+235 taxes & fees',
      priceUnit: 'Per Night',
      imgPath: 'assets/images/image 17.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35),
              // ---------- Image carousel with back / share / rating / dots ----------
              _buildImageCarousel(),

              // ---------- Name / location / price / Select Room ----------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14,),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '7 Apple Hotel, Aurangabad',
                          style: GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.w700, color: blackText),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.location_on_outlined, size: 16, color: greyText),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                'Location - CIDCO| 4.5 km drive to MGM Medical College & Hospital | 7.1 km drive to Chhatrapati Sambhaji..',
                                style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: greyText, height: 1.4),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),

                        // ---------- Price row + Select Room ----------
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '₹4,699',
                                        style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700, color: blackText),
                                      ),
                                      const SizedBox(width: 6),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 3),
                                        child: Text(
                                          '₹5,500',
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: greyText,
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text('+235 taxes & fees',
                                      style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: greyText)),
                                  Text('Per Night',
                                      style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: greyText)),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: const LinearGradient(colors: [purple, purpleLight, purpleDark]),
                                ),
                                child: Text('Select Room',
                                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),


                      ],
                    ),
                  ),
                ),
              ),
SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14,),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 14),
                    child: Column(
                    children: [
                      // ---------- Date / Guests chips ----------
                      Row(
                        children: [
                          Expanded(child: _OutlinedChip(icon: Icons.calendar_today_outlined, label: '19 Jun - 20 Jun')),
                          const SizedBox(width: 10),
                          Expanded(child: _OutlinedChip(icon: Icons.person_outline, label: '2 Guests/1 Room')),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                          'Check in: 3 PM / Check out: 12 PM',
                          style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: greyText),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    ),
                  ),
                ),
              ),
              // ---------- Amenities section ----------
              Container(
                width: double.infinity,
                color: screenBg,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Amenities',
                          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700, color: blackText)),
                      const SizedBox(height: 14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: _amenities
                            .map((a) => Expanded(
                          child: Column(
                            children: [
                              Icon(a.icon, size: 24, color: blackText),
                              const SizedBox(height: 6),
                              Text(
                                a.label,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w500, color: blackText),
                              ),
                            ],
                          ),
                        ))
                            .toList(),
                      ),
                      const SizedBox(height: 12),
                      Center(
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('View More',
                                  style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: purple)),
                              const Icon(Icons.keyboard_arrow_down, color: purple, size: 18),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ---------- Property Rules & Information ----------
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Property Rules & Information',
                        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700, color: blackText)),
                    const SizedBox(height: 10),
                    Text('Couple/Bachelor Rules',
                        style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: purple)),
                    const SizedBox(height: 8),
                    for (final rule in _rules)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: RichText(
                          text: TextSpan(
                            style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: greyText, height: 1.4),
                            children: [
                              const TextSpan(text: '•  '),
                              TextSpan(text: rule),
                            ],
                          ),
                        ),
                      ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('View More',
                              style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: purple)),
                          const Icon(Icons.keyboard_arrow_down, color: purple, size: 18),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),

              // ---------- Explore Similar Stays ----------
              Container(
                width: double.infinity,
                color: screenBg,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Explore Similar Stays',
                          style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w700, color: blackText)),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 330,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: _similarHotels.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, index) => _SimilarHotelCard(hotel: _similarHotels[index]),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 90), // leaves room so content isn't hidden behind sticky bar
            ],
          ),
        ),
      ),

      // ---------- Sticky bottom price bar ----------
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
                  Text('₹4,699', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700, color: blackText)),
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
                onTap: () {},
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(colors: [purple, purpleLight, purpleDark]),
                  ),
                  child: Center(
                    child: Text('Select Room',
                        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageCarousel() {
    return SizedBox(
      height: 260,
      width: double.infinity,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: _imageCount,
            onPageChanged: (index) => setState(() => _activeImage = index),
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
              ),
              child: Image.asset(
                'assets/images/image 16.png',
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stack) => Container(color: const Color(0xffCFCFCF)),
              ),
            ),
          ),
          Positioned(
            top: 14,
            left: 14,
            child: InkWell(
              onTap: () => Navigator.maybePop(context),
              child: Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.4), shape: BoxShape.circle),
                child: const Icon(Icons.arrow_back_ios_new, size: 16, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: 14,
            right: 14,
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.4), shape: BoxShape.circle),
                child: const Icon(Icons.share_outlined, size: 16, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            bottom: 14,
            right: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Color(0xffF9DC00), size: 13),
                  const SizedBox(width: 4),
                  Text('2.5K', style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w600, color: blackText)),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 14,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_imageCount, (index) {
                final isActive = index == _activeImage;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: isActive ? 8 : 6,
                  height: isActive ? 8 : 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive ? Color(0xff8D53DD) : Color(0xffD1D6E0),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _OutlinedChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _OutlinedChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _HotelDetailsScreenState.purple),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: _HotelDetailsScreenState.purple),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w600, color: _HotelDetailsScreenState.blackText),
            ),
          ),
        ],
      ),
    );
  }
}

class _Amenity {
  final IconData icon;
  final String label;
  const _Amenity({required this.icon, required this.label});
}

class _SimilarHotel {
  final String rating;
  final String name;
  final String location;
  final String price;
  final String taxesFee;
  final String priceUnit;
  final String imgPath;

  const _SimilarHotel({
    required this.rating,
    required this.name,
    required this.location,
    required this.price,
    required this.taxesFee,
    required this.priceUnit,
    required this.imgPath,
  });
}

class _SimilarHotelCard extends StatefulWidget {
  final _SimilarHotel hotel;
  const _SimilarHotelCard({required this.hotel});

  @override
  State<_SimilarHotelCard> createState() => _SimilarHotelCardState();
}

class _SimilarHotelCardState extends State<_SimilarHotelCard> {
  int _activePage = 0;
  static const int _imageCount = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8, offset: const Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
            child: Stack(
              children: [
                SizedBox(
                  height: 130,
                  width: double.infinity,
                  child: PageView.builder(
                    itemCount: _imageCount,
                    onPageChanged: (index) => setState(() => _activePage = index),
                    itemBuilder: (context, index) => Image.asset(
                      widget.hotel.imgPath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stack) => Container(color: const Color(0xffCFCFCF)),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Color(0xffF9DC00), size: 12),
                        const SizedBox(width: 3),
                        Text(widget.hotel.rating,
                            style: GoogleFonts.poppins(
                                fontSize: 11, fontWeight: FontWeight.w600, color: _HotelDetailsScreenState.blackText)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(_imageCount, (index) {
                final isActive = index == _activePage;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: isActive ? 6 : 5,
                  height: isActive ? 6 : 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive ? _HotelDetailsScreenState.purple : const Color(0xffD9D9D9),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.hotel.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w700, color: _HotelDetailsScreenState.blackText),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.hotel.location,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      fontSize: 10, fontWeight: FontWeight.w400, color: _HotelDetailsScreenState.greyText, height: 1.3),
                ),
                const SizedBox(height: 8),
                Text(widget.hotel.price,
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w700, color: _HotelDetailsScreenState.blackText)),
                Text(widget.hotel.taxesFee,
                    style: GoogleFonts.poppins(
                        fontSize: 10, fontWeight: FontWeight.w400, color: _HotelDetailsScreenState.greyText)),
                Text(widget.hotel.priceUnit,
                    style: GoogleFonts.poppins(
                        fontSize: 10, fontWeight: FontWeight.w400, color: _HotelDetailsScreenState.greyText)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [
                      _HotelDetailsScreenState.purple,
                      _HotelDetailsScreenState.purpleLight,
                      _HotelDetailsScreenState.purpleDark,
                    ],
                  ),
                ),
                child: Center(
                  child: Text('View Details',
                      style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}