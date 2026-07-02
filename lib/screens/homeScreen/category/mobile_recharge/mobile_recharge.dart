import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trip/screens/homeScreen/category/mobile_recharge/recharges_plans.dart';



class MobileRechargeScreen extends StatelessWidget {
  MobileRechargeScreen({super.key});

  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final recentOperators = ['jio', 'airtel', 'jio', 'airtel', 'jio'];
    final contacts = [
      {'operator': 'airtel', 'name': 'Rohit', 'number': '1312367566'},
      {'operator': 'jio', 'name': 'Rohit', 'number': '1312367566'},
      {'operator': 'airtel', 'name': 'Rohit', 'number': '1312367566'},
      {'operator': 'jio', 'name': 'Rohit', 'number': '1312367566'},
      {'operator': 'airtel', 'name': 'Rohit', 'number': '1312367566'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black12,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 17,
          ),
        ),
        title:  Text(
          "Mobile Recharge",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Container(
              width: double.infinity,

              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              decoration: BoxDecoration(
                  color: const Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Color(0xffC7C7C7)
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mobile Number",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Color(0xFF707070),
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    style:  GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    decoration:  InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      hintText: '+91 2351478963',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff1B1A1A),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          children: [
            // Your Recent Recharges
             Text(
              'Your Recent Recharges',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              height: 78,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: recentOperators.length,
                separatorBuilder: (_, __) => const SizedBox(width: 18),
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      OperatorLogo(operatorName: recentOperators[i], size: 48),
                      const SizedBox(height: 6),
                       Text(
                        '1312367566',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: Color(0xFF6B6B70),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 15),

            // Your Contacts
             Text(
              'Your Contacts',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 8),

            for (final c in contacts) ...[
              ContactCard(
                operatorName: c['operator']!,
                name: c['name']!,
                number: c['number']!,
              ),
              const SizedBox(height: 14),
            ],



            // Continue button
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RechargePlansScreen()));
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

class ContactCard extends StatelessWidget {
  final String operatorName;
  final String name;
  final String number;

  const ContactCard({
    super.key,
    required this.operatorName,
    required this.name,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),

      ),
      child: Row(
        children: [
          OperatorLogo(operatorName: operatorName, size: 40),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:  GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),

              Text(
                number,
                style:  GoogleFonts.poppins(fontSize: 12, color: Color(0xFF8A8A8E)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OperatorLogo extends StatelessWidget {
  final String operatorName; // 'jio' or 'airtel'
  final double size;

  const OperatorLogo({
    super.key,
    required this.operatorName,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final isJio = operatorName == 'jio';
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isJio ? const Color(0xFF0A1F6E) : Colors.white,
        border: isJio ? null : Border.all(color: const Color(0xFFEFEFF1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: isJio
          ? Text(
              'Jio',
              style: TextStyle(
                color: Colors.white,
                fontSize: size * 0.32,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
              ),
            )
          : Text(
              'airtel',
              style: TextStyle(
                color: const Color(0xFFE40000),
                fontSize: size * 0.22,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
    );
  }
}
