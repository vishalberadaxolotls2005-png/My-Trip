import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MatureInvestmentBottomSheet extends StatelessWidget {
  const MatureInvestmentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 13),
            child: _buildHeader(context),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Divider(color: Color(0xff707070), height: 1),
          ),
          const SizedBox(height: 7),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 14),
            child:  Text(
              'Are you sure you want to mature this investment? The '
                  'investment will be closed and the eligible amount will be '
                  'credited to your wallet.',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Color(0xFF9B9BAB),
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: _buildDetailRow('Invested Amount', '₹50,000'),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: _buildDetailRow('Total Returns Received', '₹500'),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: _buildDetailRow('Remaining Eligible Amount', '₹50,000'),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: _buildDetailRow('Total to Credit', '₹50,000'),
          ),
          const SizedBox(height: 18),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Divider(color: Color(0xff707070), height: 1),
          ),
          const SizedBox(height: 18),
          //Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: _buildActionButtons(context),
          ),

          SizedBox(height: 20,),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.close, color: Color(0xFF1A1A2E), size: 22),
        ),
         Expanded(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(right: 22),
              child: Text(
                'Mature Investment?',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A2E),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Color(0xFF1A1A2E),
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style:GoogleFonts.poppins(
            fontSize: 14,
            color: Color(0xFF1A1A2E),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(color: Color(0xff7F51D8)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child:  Text(
                'Cancel',
                style: GoogleFonts.poppins(
                  color: Color(0xff7F51D8),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: InkWell(
            onTap: () {

            },
            child: Container(
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
                  "Add to Wallet",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}