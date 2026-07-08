import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trip/screens/homeScreen/category/flights/one_way_tab/flight_details_fare_option_bottom_sheet.dart';


class MuticityFlightDetailsScreen extends StatefulWidget {
  const MuticityFlightDetailsScreen({super.key});

  @override
  State<MuticityFlightDetailsScreen> createState() => _MuticityFlightDetailsScreenState();
}

class _MuticityFlightDetailsScreenState extends State<MuticityFlightDetailsScreen> {
  final List<_FlightData> _flights = const [
    _FlightData(
      airline: 'IndiGo',
      headerColor: Color(0xFF2C3A9B),
      depTime: '21:20',
      depCode: 'IXU',
      arrTime: '23:25',
      arrCode: 'DEL',
      duration: '2h 5m',
      stops: 'Non stop',
      price: '₹6,983',
      offerTag: '2% OFF',
      bannerColor: Color(0xFF7750D5),
    ),
    _FlightData(
      airline: 'AIR INDIA',
      headerColor: Color(0xFFD9154E),
      headerGradientEnd: Color(0xFF981342),
      depTime: '21:20',
      depCode: 'IXU',
      arrTime: '23:25',
      arrCode: 'DEL',
      duration: '2h 5m',
      stops: 'Non stop',
      price: '₹6,983',
      bannerColor: Color(0xFFD9154E),
    ),
    _FlightData(
      airline: 'Emirates',
      headerColor: Color(0xFFD81A21),
      depTime: '21:20',
      depCode: 'IXU',
      arrTime: '23:25',
      arrCode: 'DEL',
      duration: '2h 5m',
      stops: 'Non stop',
      price: '₹6,983',
      bannerColor: Color(0xFFD81A21),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
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
                              color: Color(0xffF6F6F6),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0xffC7C7C7)),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Chhatrapati Sambhajinagar to new Delhi',
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xff1B1A1A)),
                                      ),

                                      Text(
                                        '19 Jun | 1 Adult | Economy',
                                        style: GoogleFonts.poppins(
                                            fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff707070)),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.edit_outlined, color: Color(0xff7750D5), size: 24),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: RouteLegSelectorRow(),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
              child: _buildFilterRow(),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                itemCount: _flights.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: InkWell(

                        onTap: (){
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => const FlightFareBottomSheet(),
                          );
                        },
                        child: _FlightCard(data: _flights[index])),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }





  // ---- Sorted by / Non Stop / Filter row ----
  Widget _buildFilterRow() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          decoration: BoxDecoration(
            color: Color(0xffEDE4F2),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xff7750D5)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset("assets/images/sorted_chepest.svg",height: 14,),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Sorted by",
                    style: GoogleFonts.poppins(
                        fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xff636363)),
                  ),
                  Text(
                    "Cheapest",
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          decoration: BoxDecoration(
            color: Color(0xffEDE4F2),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xff7750D5)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [

              Text(
                "Non Stop",
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
              ),
            ],
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xffC7C7C7)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [

              SvgPicture.asset("assets/images/filter.svg",height: 14, color: Colors.black),
              const SizedBox(width: 6),

              Text(
                "Filter",
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
              ),
            ],
          ),
        )
      ],
    );
  }


}



class _FlightData {
  final String airline;
  final Color headerColor;
  final Color? headerGradientEnd;
  final String depTime;
  final String depCode;
  final String arrTime;
  final String arrCode;
  final String duration;
  final String stops;
  final String price;
  final String? offerTag;
  final Color bannerColor;

  const _FlightData({
    required this.airline,
    required this.headerColor,
    this.headerGradientEnd,
    required this.depTime,
    required this.depCode,
    required this.arrTime,
    required this.arrCode,
    required this.duration,
    required this.stops,
    required this.price,
    this.offerTag,
    required this.bannerColor,
  });
}

// ============ FLIGHT CARD WIDGET ============

class _FlightCard extends StatelessWidget {
  final _FlightData data;

  const _FlightCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAirlineHeader(),
          _buildFlightInfo(),
          _buildBottomBanner(),
        ],
      ),
    );
  }

  Widget _buildAirlineHeader() {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            data.headerColor,
            data.headerGradientEnd ?? data.headerColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            data.airline,
            style:GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
            ),
          ),
          const Spacer(),
          if (data.offerTag != null)
            Text(
              data.offerTag!,
              style:GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFlightInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Departure
          _timeColumn(data.depTime, data.depCode),
          const SizedBox(width: 12),
          // Duration / stops in middle
          Expanded(
            child: Column(
              children: [
                Text(
                  data.duration,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF9B9B9B),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Container(height: 1, color: const Color(0xFFD1D6E0)),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  data.stops,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1B1A1A),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Arrival
          _timeColumn(data.arrTime, data.arrCode),
          const SizedBox(width: 16),
          // Price
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                data.price,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1B1A1A),
                ),
              ),
              Text(
                'Price',
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF9B9B9B),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _timeColumn(String time, String code) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style:GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1B1A1A),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          code,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF707070),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBanner() {
    return Container(
      width: double.infinity,
      color: data.bannerColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '10% OFF using SBIDC code',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            'BOOK NOW',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}





class RouteLegSelectorRow extends StatefulWidget {
  const RouteLegSelectorRow({super.key});

  @override
  State<RouteLegSelectorRow> createState() => _RouteLegSelectorRowState();
}

class _RouteLegSelectorRowState extends State<RouteLegSelectorRow> {
  static const Color purple = Color(0xff7750D5);
  static const Color tabSelectedBg = Color(0xFFF9F0FD);
  static const Color blackText = Color(0xFF1B1B1B);

  int _selectedIndex = 0; // IXU -> DEL selected by default

  final List<_RouteLeg> _legs = const [
    _RouteLeg(from: 'IXU', to: 'DEL'),
    _RouteLeg(from: 'DEL', to: 'PNQ'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffC7C7C7)),
      ),
      child: Row(
        children: List.generate(_legs.length, (index) {
          final leg = _legs[index];
          final isSelected = index == _selectedIndex;

          return Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => setState(() => _selectedIndex = index),
              child: AnimatedContainer(
                duration: Duration.zero,
                decoration: BoxDecoration(
                  color: isSelected ? tabSelectedBg : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSelected ? purple : Colors.transparent,
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        leg.from,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? purple : blackText,
                        ),
                      ),
                      const SizedBox(width: 13),
                      Icon(
                        Icons.arrow_forward,
                        size: 14,
                        color: isSelected ? purple : const Color(0xff8D8C8C),
                      ),
                      const SizedBox(width: 13),
                      Text(
                        leg.to,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? purple : blackText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _RouteLeg {
  final String from;
  final String to;

  const _RouteLeg({
    required this.from,
    required this.to,
  });
}