import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trip/screens/homeScreen/category/flights/one_way_tab/review_booking.dart';


class FlightSeats extends StatelessWidget {
  const FlightSeats({super.key});

  static const Color indigoPrimary = Color(0xFF3B3897);
  static const Color indigoSecondary = Color(0xFF524CB0);
  static const Color greenCheck = Color(0xFF2ECC71);
  static const Color redIcon = Color(0xFFE74C3C);
  static const Color purpleAccent = Color(0xFF7B3FE4);
  static const Color labelGrey = Color(0xFF8B8B8B);
  static const Color darkText = Color(0xFF1E1E1E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 17),
        centerTitle: true,
        title: Text(
          'Flight Details',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Center(child: Image.asset("assets/images/flight_seats.png",height: 550,width: 350,)),
            const SizedBox(height: 15),
            InkWell(
              onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewBookingFlightScreen()));
              },
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  gradient:  LinearGradient(
                    colors: [
                      Color(0xff7750D5),
                      Color(0xffB457EB),
                      Color(0xffA751D8)
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    "Continue",
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
      ),
    );
  }

}

