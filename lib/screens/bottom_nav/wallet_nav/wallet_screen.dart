import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trip/screens/bottom_nav/wallet_nav/wallet_add_bottom_sheet.dart';
import 'package:my_trip/screens/bottom_nav/wallet_nav/wallet_transfer_bottom_sheet.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          "Wallet",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),

      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15,),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBalanceCard(context),
                    const SizedBox(height: 15),
                     Text(
                      'Transition History',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildTransactionTile(
                      subLabel: 'Wallet',
                      title: 'Mobile Recharge',
                      date: '19 Jun, Fri',
                      amount: '-₹349',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  // ---------- Total balance card ----------
  Widget _buildBalanceCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xff7750D5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children:  [
              Text(
                'Total Balance',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Color(0xFF9B9BAB),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 6),
              Icon(
                Icons.remove_red_eye_outlined,
                size: 16,
                color: Color(0xFF9B9BAB),
              ),
            ],
          ),
          const SizedBox(height: 2),
           Text(
            '₹6,983.00',
            style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A2E),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child:  InkWell(
                  onTap: (){
                    showModalBottomSheet(
                      context:context ,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) =>  WalletAddBottomSheet(),
                    );


                  },
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
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
                        "+ Add",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: OutlinedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context:context ,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) =>  WalletTransferBottomSheet(),
                      );

                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xff7750D5)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child:  Text(
                      'Transfer',
                      style: GoogleFonts.poppins(
                        color: Color(0xff7750D5),
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------- Transaction tile ----------
  Widget _buildTransactionTile({
    required String subLabel,
    required String title,
    required String date,
    required String amount,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration:  BoxDecoration(
              color: Color(0xffF6F6F6),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xffBABABA),
                width: 1,
              )
            ),
            alignment: Alignment.center,
            child:  Text(
              '₹',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subLabel,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Color(0xFF9B9BAB),
                    fontWeight: FontWeight.w400,
                  ),
                ),

                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A2E),
                  ),
                ),

                Text(
                  date,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Color(0xFF9B9BAB),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A2E),
            ),
          ),
        ],
      ),
    );
  }
}