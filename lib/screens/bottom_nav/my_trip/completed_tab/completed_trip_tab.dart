import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../trip_model.dart'; // adjust path to wherever you saved trip_model.dart

class CompletedTripsTab extends StatelessWidget {
  final void Function(Trip trip) onViewDetails;
  const CompletedTripsTab({super.key, required this.onViewDetails});

  // Mock data - replace with real completed trips from your API / database.
  static const List<Trip> _trips = [
    Trip(
      status: TripStatus.completed,
      statusColor: Color(0xFF12B76A),
      route: 'Delhi - Goa',
      flight: 'DEL - GOX',
      hotel: 'Taj Exotica Resort',
      buttonLabel: 'View Details',
      imgPath: "assets/images/completed_trip.svg",
      imgPathTittle: "assets/images/completed_title.svg",
      tripDateRange: 'Date 06 Jun 26',
      progressStartDate: '01 Jun',
      progressEndDate: '06 Jun',
      progressPercent: 1.0,
      hotelName: '7 Apple Hotel, Aurangabad',
      hotelAddress: 'Chhatrapati Sambhaji Maharaj, New Delhi',
      hotelRating: '2.5K',
      checkInDate: '01 Jun',
      checkInDay: '26, Thu',
      checkInTime: '2PM',
      checkOutDate: '06 Jun',
      checkOutDay: '26, Thu',
      checkOutTime: '2PM',
      nights: '5 NIGHTS',
      guestsRooms: '2 Adults - 1 Room',
      airline: 'IndiGo',
      flightNumber: 'AI 1843 | Airbus A320 N',
      originCode: 'IXU',
      destinationCode: 'DEL',
      departureTime: '21:20',
      departureDate: '19 Jun, Fri',
      departureCity: 'Chhatrapati Sambhajinagar',
      arrivalTime: '23:25',
      arrivalDate: '19 Jun, Fri',
      arrivalCity: 'New Delhi',
      arrivalTerminal: 'DEL, Terminal T2',
      flightDuration: '2h 5m',
      stopsLabel: 'Non stop',
      passengerName: 'Sarah Smith',
      seatNo: '16A',
    ),
    Trip(
      status: TripStatus.completed,
      statusColor: Color(0xFF12B76A),
      route: 'Delhi - Goa',
      flight: 'DEL - GOX',
      hotel: 'Taj Exotica Resort',
      buttonLabel: 'View Details',
      imgPath: "assets/images/completed_trip.svg",
      imgPathTittle: "assets/images/completed_title.svg",
      tripDateRange: 'Date 06 Jun 26',
      progressStartDate: '01 Jun',
      progressEndDate: '06 Jun',
      progressPercent: 1.0,
      hotelName: '7 Apple Hotel, Aurangabad',
      hotelAddress: 'Chhatrapati Sambhaji Maharaj, New Delhi',
      hotelRating: '2.5K',
      checkInDate: '01 Jun',
      checkInDay: '26, Thu',
      checkInTime: '2PM',
      checkOutDate: '06 Jun',
      checkOutDay: '26, Thu',
      checkOutTime: '2PM',
      nights: '5 NIGHTS',
      guestsRooms: '2 Adults - 1 Room',
      airline: 'IndiGo',
      flightNumber: 'AI 1843 | Airbus A320 N',
      originCode: 'IXU',
      destinationCode: 'DEL',
      departureTime: '21:20',
      departureDate: '19 Jun, Fri',
      departureCity: 'Chhatrapati Sambhajinagar',
      arrivalTime: '23:25',
      arrivalDate: '19 Jun, Fri',
      arrivalCity: 'New Delhi',
      arrivalTerminal: 'DEL, Terminal T2',
      flightDuration: '2h 5m',
      stopsLabel: 'Non stop',
      passengerName: 'Sarah Smith',
      seatNo: '16A',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 7, bottom: 20),
      itemCount: _trips.length,
      itemBuilder: (context, index) => _CompletedTripCard(
        trip: _trips[index],
        onViewDetails: onViewDetails,
      ),
    );
  }
}

/// Custom card widget used only inside the "Completed" tab.
class _CompletedTripCard extends StatelessWidget {
  final Trip trip;
  final void Function(Trip trip) onViewDetails;
  const _CompletedTripCard({required this.trip, required this.onViewDetails});

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
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 17,
                      height: 17,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Center(
                        child: SvgPicture.asset(
                          trip.imgPathTittle,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      trip.statusLabel,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: trip.statusColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  trip.tripDateRange,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff707070),
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
                  child: Center(child: SvgPicture.asset(trip.imgPath)),
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
                          color: const Color(0xFF1B1B1B),
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
          // button
          InkWell(
            onTap: () => onViewDetails(trip),
            child: Container(
              margin: const EdgeInsets.only(bottom: 10, right: 14, left: 14),
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
          TextSpan(text: '•  ', style: GoogleFonts.poppins(color: color)),
          TextSpan(text: '$label ', style: GoogleFonts.poppins(color: color)),
          TextSpan(
            text: value,
            style: GoogleFonts.poppins(color: const Color(0xFF1B1B1B), fontWeight: FontWeight.w600),
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