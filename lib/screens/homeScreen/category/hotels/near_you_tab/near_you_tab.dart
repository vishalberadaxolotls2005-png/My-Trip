import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Fully self-contained "Near You" tab.
/// Dummy/placeholder data - replace with your real geolocation-based search state.
class NearYouTab extends StatelessWidget {
  const NearYouTab({super.key});

  static const Color purple = Color(0xff7750D5);
  static const Color purpleLight = Color(0xffB457EB);
  static const Color purpleDark = Color(0xffA751D8);
  static const Color greyText = Color(0xff707070);
  static const Color blackText = Color(0xFF1B1B1B);
  static const Color borderGrey = Color(0xffE0E0E0);
  static const Color screenBg = Color(0xffF2F2F2);

  // Mock data - replace with real offers from your API / database.
  static const List<_Offer> _offers = [
    _Offer(
      badgeLabel: 'NEARBY',
      tagLine: 'JUST FOR YOU:',
      title: 'Top Rated Stays Near You @ 20% OFF',
      brandLabel: 'OYO',
      imgPath: 'assets/images/offer_nearby_1.png',
    ),
    _Offer(
      badgeLabel: 'TRENDING',
      tagLine: 'BOOK NOW:',
      title: 'Last Minute Deals Within 2 KM',
      brandLabel: 'TREEBO',
      imgPath: 'assets/images/offer_nearby_2.png',
    ),
  ];

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
                  // ---------- Location row ----------
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: borderGrey),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.search, color: blackText, size: 20),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your Current Location',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600, color: blackText),
                              ),
                              const SizedBox(height: 2),
                              Text('India', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: greyText)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              border: Border.all(color: purple),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.near_me, size: 13, color: purple),
                                const SizedBox(width: 4),
                                Text('Near Me',
                                    style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: purple)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // ---------- Date row ----------
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: borderGrey),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today_outlined, size: 18, color: blackText),
                        const SizedBox(width: 10),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w700, color: blackText),
                              children: [
                                const TextSpan(text: '18 Jun '),
                                TextSpan(
                                  text: "'26, Thu",
                                  style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: greyText),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: purple),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text('1 NIGHT',
                              style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w600, color: purple)),
                        ),
                        Expanded(
                          child: RichText(
                            textAlign: TextAlign.right,
                            text: TextSpan(
                              style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w700, color: blackText),
                              children: [
                                const TextSpan(text: '19 Jun '),
                                TextSpan(
                                  text: "'26, Fri",
                                  style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: greyText),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // ---------- Guests row ----------
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: borderGrey),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.person_outline, size: 18, color: blackText),
                        const SizedBox(width: 10),
                        Text('1 Room, 2 Adults & 0 Children',
                            style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: blackText)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),

                  // ---------- Search button ----------
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
                        child: Text('Search',
                            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
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
              color: screenBg,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Offers', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700, color: blackText)),
                  const SizedBox(height: 12),
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
                    style: GoogleFonts.poppins(fontSize: 9, fontWeight: FontWeight.w700, color: NearYouTab.blackText)),
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                child: Text(offer.brandLabel,
                    style: GoogleFonts.poppins(fontSize: 9, fontWeight: FontWeight.w700, color: NearYouTab.purple)),
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
                  Text(offer.tagLine, style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.white)),
                  const SizedBox(height: 2),
                  Text(
                    offer.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.white),
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