import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 17),
        ),
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            BookingCard(
              image: "assets/images/flights.svg",
              isFlight: true,
              from: "IXU",
              to: "DEL",
              date: "19 Jun, Fri",
              price: "₹10,128",
            ),


          ],
        ),
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final String image;
  final bool isFlight;

  // Flight
  final String? from;
  final String? to;

  // Hotel
  final String? hotelName;
  final String? roomInfo;

  // Common
  final String date;
  final String price;

  const BookingCard({
    super.key,
    required this.image,
    required this.isFlight,
    required this.date,
    required this.price,
    this.from,
    this.to,
    this.hotelName,
    this.roomInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8
        ),

      ),
      child: Row(
        children: [
          SvgPicture.asset(
            image,
            height: 42,
            width: 42,
          ),

          const SizedBox(width: 14),

          Expanded(
            child: isFlight
                ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      from!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                   Divider(color: Colors.black),


                    Text(
                      to!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                Text(
                  "Flight Booking Confirmed",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  hotelName!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  roomInfo!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          Column(
            children: [
              Text(
                "10:00",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Color(0xff707070)
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "New",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color(0xff7750D5)
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}