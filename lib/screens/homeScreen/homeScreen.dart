import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trip/screens/bottom_nav/profile_nav/notification_setting/notification_setting.dart';
import 'package:my_trip/screens/homeScreen/category/hotels/hotel_homestay_screen.dart';
import 'package:my_trip/screens/homeScreen/category/investment/investment_screen.dart';
import 'package:my_trip/screens/homeScreen/notification_screen.dart';

import 'category/mobile_recharge/mobile_recharge.dart';
import 'discover_item/electrictiy/electricity_biller.dart';
import 'discover_item/water/water_biller.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;
  final List<String> _tabs = ['Trending', 'Flights', 'Hotels', 'Rails', 'Holidays'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(

        padding:  EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(height: 30),

            // Search Bar
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  // Search field
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                       border: Border.all(color: Color(0xff6986F2))
                      ),
                      child: Row(
                        children: [
                           SizedBox(width: 14),
                           Icon(
                            Icons.search_rounded,
                            color: Color(0xff707070),
                            size: 20,
                          ),
                           SizedBox(width: 8),
                           Text(
                            'ex. Flights',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Color(0xff707070),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                   SizedBox(width: 10),
                  // Notification icon button
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:  Color(0xff6986F2),

                        ),
                        color: Colors.white,

                      ),
                      child:  Icon(
                        Icons.notifications_none_rounded,
                        color: Color(0xff6986F2),
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 22),

            // Category Icons Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  _CategoryItem(
                   imagePath: "assets/images/flights.svg",
                    label: 'Flights',
                    onTap: (){
},
                  ),
                  _CategoryItem(
                    imagePath: "assets/images/hotels.svg",
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HotelHomestayScreen()));

                    },
                    label: 'Hotels',

                  ),
                  _CategoryItem(
                    imagePath: "assets/images/investment.svg",
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>InvestmentsScreen()));
                    },

                    label: 'Investment',

                  ),
                  _CategoryItem(
                    imagePath: "assets/images/mobile_recharge.svg",
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MobileRechargeScreen()));

                    },

                    label: 'Mobile\nRecharge',

                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Offers Row
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    'Offers',
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1035),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child:  Text(
                      'View All',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff7750D5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),

            // Tab Bar
            Container(
              height: 38,
              color: Colors.white,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding:  EdgeInsets.symmetric(horizontal: 16),
                itemCount: _tabs.length,
                separatorBuilder: (_, __) =>  SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final bool selected = _selectedTab == index;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedTab = index),
                    child: AnimatedContainer(
                      duration:  Duration(milliseconds: 200),
                      padding:  EdgeInsets.symmetric(
                          horizontal: 18, vertical: 8),
                      decoration: BoxDecoration(
                        color: selected
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: selected
                              ? const Color(0xff7750D5)
                              : Colors.transparent,
                          width: 1.5,
                        ),
                        boxShadow: selected
                            ? [
                          BoxShadow(
                            color: const Color(0xff7750D5)
                                .withOpacity(0.12),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                            : [],
                      ),
                      child: Text(
                        _tabs[index],
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: selected
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color: selected
                              ? const Color(0xff7750D5)
                              : const Color(0xff1B1A1A),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
             SizedBox(height: 14),

            // Offer Cards Horizontal Scroll
            SizedBox(
              height: 148,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 4,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final discounts = ['20% OFF', '5% OFF', '20% OFF', '15% OFF'];
                  return _OfferCard(discount: discounts[index]);
                },
              ),
            ),
            SizedBox(height: 24),

            // Discover More
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16),
              child:  Text(
                'Discover more',
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1035),
                ),
              ),
            ),
             SizedBox(height: 14),

            // Discover More Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width:double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    _DiscoverItem(
                             imagePath: "assets/images/water.svg",
                      label: 'Water',
                      onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>WaterBillerScreen()));}
                    ),
                    _DiscoverItem(
                      imagePath: "assets/images/electricity.svg",
                      label: 'Electricity',
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ElectricityBiller()));
                        }

                    ),
                    _DiscoverItem(
                      imagePath: "assets/images/internet.svg",
                      label: 'Internet',
                        onTap:(){}

                    ),
                    _DiscoverItem(
                      imagePath: "assets/images/mobile_postpaid.svg",
                      label: 'Mobile\nPostpaid',
                        onTap:(){}

                    ),
                  ],
                ),
              ),
            ),
             SizedBox(height: 10),

            //where to go
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Where2GoCard(),
            ),
          ],
        ),
      ),
    );
  }
}

// Category Item Widget
class _CategoryItem extends StatelessWidget {
   _CategoryItem({
   required  this.imagePath,
    required this.label,
    required this.onTap


  });
  final String imagePath;
  final String label;
VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 75,
        height: 90,
        decoration: BoxDecoration(
      color: Colors.white,
          borderRadius: BorderRadius.circular(12),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(imagePath,width: 30,height: 35),
            SizedBox(height: 10,),
            Text(
              label,
              textAlign: TextAlign.center,
              style:  GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A1035),
              ),
            )
          ],
        )
      ),
    );
  }
}


// Offer Card Widget
class _OfferCard extends StatelessWidget {
  const _OfferCard({required this.discount});
  final String discount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

      ),

      child: Column(
        children: [
         Container(

           width: 125,
           height: 105,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(12),

           ),
           child: Image.asset("assets/images/offer_img.png",fit: BoxFit.cover,),
         ),
          // Red discount banner at bottom
          Container(
              width: 125,
              height: 40,decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/discount.png",),fit: BoxFit.cover)
          ),
              child:Center(
                child: Text(discount,style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),),
              )),

        ],
      ),
    );
  }
}

// Discover Item Widget
class _DiscoverItem extends StatelessWidget {
  const _DiscoverItem({
   required this.imagePath,
    required this.label,
    required this.onTap

  });
  final String imagePath;
  final String label;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
      width: 72,

        child: Column(
      mainAxisSize: MainAxisSize.min,
          children: [
           SvgPicture.asset(imagePath,height: 30,width: 30),
             SizedBox(height: 7),
            Text(
              label,
              textAlign: TextAlign.center,
              style:  GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A1035),
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Placeholder page for other tabs
class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style:  GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: Color(0xFF7C3AED),
        ),
      ),
    );
  }
}



class Where2GoCard extends StatelessWidget {
  const Where2GoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color:  Color(0xFFD0C4F7), width: 1.8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 14,
            offset:  Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [

          ClipRRect(
            borderRadius:  BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 12,horizontal: 12),
              child: Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.white,
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                   Image.asset("assets/images/where_go.png",fit: BoxFit.cover,),

                    // Dark gradient overlay (bottom)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 140,
                      child: Container(
                        decoration:  BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color(0xE0000000),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Kerala text + Book now button
                    Positioned(
                      bottom: 14,
                      left: 14,
                      right: 14,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Text
                           Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Kerala',
                                  style: GoogleFonts.poppins(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 6,
                                        color: Colors.black54,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Kerala, also known as 'God's Own Country' ,It is a beautiful and prosperous state located on the coast of the Arabian Sea in the south-west of India.",
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    height: 1.5,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 4,
                                        color: Colors.black54,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                           SizedBox(width: 10),

                          // Book now button
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding:  EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 11,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.18),
                                    blurRadius: 8,
                                    offset:  Offset(0, 3),
                                  ),
                                ],
                              ),
                              child:  Text(
                                'Book now',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF1A1035),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Swipe slider
          Padding(
            padding:  EdgeInsets.fromLTRB(14, 10, 14, 14),
            child:  SwipeSlider(),
          ),
        ],
      ),
    );
  }
}


// SWIPE SLIDER
class SwipeSlider extends StatefulWidget {
  const SwipeSlider({super.key});

  @override
  State<SwipeSlider> createState() => _SwipeSliderState();
}

class _SwipeSliderState extends State<SwipeSlider> {
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 1.5,
            thumbShape: const PlaneThumbShape(),
            overlayShape: SliderComponentShape.noOverlay,
            activeTrackColor: const Color(0xFFCCBBFF),
            inactiveTrackColor: const Color(0xFFDDDDDD),
          ),
          child: Slider(
            value: _value,
            min: 0,
            max: 1,
            onChanged: (v) => setState(() => _value = v),
          ),
        ),
        const SizedBox(height: 2),
         Text(
          '- - - - - - - - - Swipe to view all - - - - - - - - -',
          style: GoogleFonts.poppins(
            fontSize: 11,
            color: Color(0xFFAAAAAA),
            letterSpacing: 0.4,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}


// PLANE THUMB SHAPE (purple pill with airplane icon)
class PlaneThumbShape extends SliderComponentShape {
  const PlaneThumbShape();

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) =>
      const Size(52, 30);

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;

    // Purple pill
    final Paint pill = Paint()
      ..color = const Color(0xFF7C3AED)
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: center, width: 52, height: 30),
        const Radius.circular(15),
      ),
      pill,
    );

    // White airplane
    final Paint white = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final double x = center.dx;
    final double y = center.dy;

    // Fuselage
    final Path body = Path()
      ..moveTo(x - 11, y + 2)
      ..lineTo(x + 11, y)
      ..lineTo(x - 11, y - 2)
      ..close();
    canvas.drawPath(body, white);

    // Top wing
    final Path topWing = Path()
      ..moveTo(x - 3, y - 1)
      ..lineTo(x + 5, y - 9)
      ..lineTo(x + 7, y - 8)
      ..lineTo(x - 3, y)
      ..close();
    canvas.drawPath(topWing, white);

    // Bottom wing
    final Path botWing = Path()
      ..moveTo(x - 3, y + 1)
      ..lineTo(x + 5, y + 9)
      ..lineTo(x + 7, y + 8)
      ..lineTo(x - 3, y)
      ..close();
    canvas.drawPath(botWing, white);

    // Tail fin
    final Path tail = Path()
      ..moveTo(x - 11, y - 1)
      ..lineTo(x - 7, y - 6)
      ..lineTo(x - 6, y - 5)
      ..lineTo(x - 10, y - 1)
      ..close();
    canvas.drawPath(tail, white);
  }
}