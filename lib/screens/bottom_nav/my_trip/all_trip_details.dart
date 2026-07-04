import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'trip_model.dart';


class TripDetailsScreen extends StatelessWidget {
  final Trip trip;
  final VoidCallback onBack;
  const TripDetailsScreen({super.key, required this.trip, required this.onBack});

  static const Color purple = Color(0xff7750D5);
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
          children: [
            InkWell(
              onTap: onBack,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 15),
                  const SizedBox(width: 8),
                  Text('Back', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
                                    child: Center(child: SvgPicture.asset(trip.imgPathTittle, fit: BoxFit.contain)),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(trip.statusLabel,
                                      style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: trip.statusColor)),
                                ],
                              ),
                              Text(trip.tripDateRange,
                                  style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: greyText)),
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
                              SizedBox(width: 40, height: 70, child: Center(child: SvgPicture.asset(trip.imgPath))),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(trip.route,
                                        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: blackText)),
                                    _DetailRow(color: trip.statusColor, label: 'Flight', value: trip.flight),
                                    _DetailRow(color: trip.statusColor, label: 'Hotel', value: trip.hotel),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // ----- status-specific block -----
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child:
                              _ProgressCard(trip: trip),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Text('Travel Details',
                        style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: const Color(0xff787878))),
                  ),
                  const SizedBox(height: 10),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 14), child: _SectionHeader(title: 'Hotel Details')),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 14), child: _HotelDetailsCard(trip: trip)),
                  const SizedBox(height: 16),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 14), child: _SectionHeader(title: 'Flight Details')),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 14), child: _FlightDetailsCard(trip: trip)),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  final Trip trip;
  const _ProgressCard({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffC7C7C7)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(trip.progressStartDate, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: TripDetailsScreen.blackText)),
              Text(trip.statusLabel, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: trip.statusColor)),
              Text(trip.progressEndDate, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: TripDetailsScreen.blackText)),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Row(
              children: [
                Expanded(
                  flex: (trip.progressPercent * 100).round().clamp(0, 100),
                  child: Container(height: 5, color: const Color(0xff9954E1)),
                ),
                Expanded(
                  flex: (100 - (trip.progressPercent * 100).round()).clamp(0, 100),
                  child: Container(height: 5, color: const Color(0xffE0E0E0)),
                ),
              ],
            ),
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
          children: List.generate(dashCount, (_) => Padding(
            padding: const EdgeInsets.only(right: dashSpace),
            child: Container(width: dashWidth, height: 1, color: TripDetailsScreen.purple),
          )),
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xff7750D5), Color(0xffB457EB), Color(0xffA751D8)]),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      child: Center(
        child: Text(title, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
      ),
    );
  }
}

class _HotelDetailsCard extends StatelessWidget {
  final Trip trip;
  const _HotelDetailsCard({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        border: Border.all(color: const Color(0xffC7C7C7)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 3))],
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
                  width: 65, height: 65, color: const Color(0xffE8E8E8),
                  child: Image.asset("assets/images/my_trip_img.png", fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6),
                    Text(trip.hotelName, style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: const Color(0xff1B1A1A))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(trip.hotelAddress, style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: const Color(0xff707070)))),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Color(0xffF9DC00), size: 14),
                            const SizedBox(width: 2),
                            Text(trip.hotelRating, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: TripDetailsScreen.blackText)),
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
          const Divider(color: Color(0xffC7C7C7)),
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
                          TextSpan(text: '${trip.checkInDate} '),
                          TextSpan(text: trip.checkInDay, style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText)),
                        ],
                      ),
                    ),
                    Text(trip.checkInTime, style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText)),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(border: Border.all(color: TripDetailsScreen.purple), borderRadius: BorderRadius.circular(20)),
                child: Text(trip.nights, style: GoogleFonts.poppins(fontSize: 9, fontWeight: FontWeight.w600, color: TripDetailsScreen.purple)),
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
                          TextSpan(text: '${trip.checkOutDate} '),
                          TextSpan(text: trip.checkOutDay, style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText)),
                        ],
                      ),
                    ),
                    Text(trip.checkOutTime, style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          const Divider(color: Color(0xffC7C7C7)),
          Text('Guests & Rooms', style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText)),
          Text(trip.guestsRooms, style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: TripDetailsScreen.blackText)),
        ],
      ),
    );
  }
}

class _FlightDetailsCard extends StatelessWidget {
  final Trip trip;
  const _FlightDetailsCard({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 3))],
        border: Border.all(color: const Color(0xffC7C7C7)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 50, height: 45, child: SvgPicture.asset("assets/images/flights.svg", fit: BoxFit.cover)),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(trip.airline, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: TripDetailsScreen.blackText)),
                    Text(trip.flightNumber, style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText)),
                    Row(
                      children: [
                        Text(trip.originCode, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: const Color(0xff1B1A1A))),
                        Text("--->", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: const Color(0xff1B1A1A))),
                        Text(trip.destinationCode, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: const Color(0xff1B1A1A))),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Divider(color: Color(0xffC7C7C7)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(trip.departureTime, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700, color: TripDetailsScreen.blackText)),
                    Text(trip.departureDate, style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w500, color: TripDetailsScreen.greyText)),
                    Text(trip.departureCity, style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(trip.flightDuration, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: TripDetailsScreen.blackText)),
                    const Divider(color: Color(0xff7750D5)),
                    Text(trip.stopsLabel, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(trip.arrivalTime, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700, color: TripDetailsScreen.blackText)),
                    Text(trip.arrivalDate, style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w500, color: TripDetailsScreen.greyText)),
                    Text(trip.arrivalCity, textAlign: TextAlign.right, style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText)),
                    Text(trip.arrivalTerminal, textAlign: TextAlign.right, style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Divider(color: Color(0xffC7C7C7)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Passenger Name', style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText)),
                  Text(trip.passengerName, style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: TripDetailsScreen.blackText)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('SEAT NO', style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: TripDetailsScreen.greyText)),
                  Text(trip.seatNo, style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: TripDetailsScreen.blackText)),
                ],
              ),
            ],
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
          TextSpan(text: value, style: GoogleFonts.poppins(color: const Color(0xFF1B1B1B), fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}