import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AllTripsTab extends StatelessWidget {
  final VoidCallback onViewDetails;
  const AllTripsTab({super.key, required this.onViewDetails});

  // Mock data - replace with real trips from your API / database.
  static const List<_Trip> _trips = [
    _Trip(
      status: 'Ongoing',
      statusColor: Color(0xFFEAB33E),
      icon: Icons.radio_button_checked,
      date: '01 Jun - 06 Jun',
      route: 'Delhi - Goa',
      flight: 'DEL - GOX',
      hotel: 'Taj Exotica Resort',
      buttonLabel: 'Ongoing',
     imgPath: "assets/images/ongoing_trip.svg",
        imgPathTittle: "assets/images/ongoing_title.svg",


    ),
    _Trip(
      status: 'Completed',
      statusColor: Color(0xFF12B76A),
      icon: Icons.check_circle,
      date: 'Date 06 Jun 26',
      route: 'Delhi - Goa',
      flight: 'DEL - GOX',
      hotel: 'Taj Exotica Resort',
      buttonLabel: 'View Details',
imgPath: "assets/images/completed_trip.svg",
        imgPathTittle: "assets/images/completed_title.svg",

    ),
    _Trip(
      status: 'Cancelled',
      statusColor: Color(0xFFF1494F),
      icon: Icons.cancel,
      date: 'Date 06 Jun 26',
      route: 'Delhi - Goa',
      flight: 'DEL - GOX',
      hotel: 'Taj Exotica Resort',
      buttonLabel: 'View Details',
      imgPath: "assets/images/cancelled_trip.svg",
        imgPathTittle: "assets/images/cancelled_title.svg",

    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 7, bottom: 20),
      itemCount: _trips.length,
      itemBuilder: (context, index) => _AllTripCard(
        trip: _trips[index],
        onViewDetails: onViewDetails, // Add this line
      ),
    );
  }
}

class _Trip {
  final String status;
  final Color statusColor;
  final IconData icon;
  final String date;
  final String route;
  final String flight;
  final String hotel;
  final String buttonLabel;
  final String imgPath;
  final String imgPathTittle;



  const _Trip({
    required this.status,
    required this.statusColor,
    required this.icon,
    required this.date,
    required this.route,
    required this.flight,
    required this.hotel,
    required this.buttonLabel,
    required this.imgPath,
    required this.imgPathTittle,

  });
}

/// Custom card widget used only inside the "All" tab.
class _AllTripCard extends StatelessWidget {
  final _Trip trip;
  final VoidCallback onViewDetails;
  const _AllTripCard({required this.trip, required this.onViewDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
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
                          trip.imgPathTittle,

                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      trip.status,
                      style:  GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: trip.statusColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  trip.date,
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
                child: Center(child: SvgPicture.asset(trip.imgPath,))
            ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        trip.route,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1B1B1B),
                        ),
                      ),

                      _DetailRow(color: trip.statusColor, label: 'Flight', value: trip.flight),

                      _DetailRow(color: trip.statusColor, label: 'Hotel', value: trip.hotel),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //button
          InkWell(
           onTap: (){
             onViewDetails();
           },
            child: Container(
              margin: EdgeInsets.only(bottom: 10,right: 14,left: 14),
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
              child:  Center(
                child: Text(
                  trip.buttonLabel,
                  style: GoogleFonts.poppins(
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
              child: Container(width: dashWidth, height: 1, color: const Color(0xff7750D5)),
            );
          }),
        );
      },
    );
  }
}



