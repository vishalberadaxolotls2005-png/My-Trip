import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trip/screens/homeScreen/category/investment/my_invest_tab/mature_invest_bottom_sheet.dart';


class InvestmentViewDetailsContent extends StatelessWidget {
  final VoidCallback onBack;

  const InvestmentViewDetailsContent({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBackRow(),
        const SizedBox(height: 8),
        _buildDetailsCard(),
        const SizedBox(height: 17),
         Text(
          'Payout History',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A2E),
          ),
        ),
        const SizedBox(height: 10),
        _buildPayoutHistoryTable(),
        const SizedBox(height: 20),
        //Button mature invest
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => const MatureInvestmentBottomSheet(),
            );
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
                "Mature Investment",
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
    );
  }

  // ---------- Back row ----------
  Widget _buildBackRow() {
    return InkWell(
      onTap: onBack,
      child:  Row(
        children: [
          Icon(Icons.arrow_back_ios_new_rounded,
              color: Color(0xFF1A1A2E), size: 16),
          SizedBox(width: 4),
          Text(
            'Back',
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

  // ---------- Details card ----------
  Widget _buildDetailsCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Active + Investment ID row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 17,
                      height: 17,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffD1FADF),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/images/active.svg",
                          color: const Color(0xff12B76A),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                     Text(
                      'Active',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff12B76A),
                      ),
                    ),
                  ],
                ),
                 Text(
                  'Investment ID: INV-12345',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Color(0xff707070),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const _DashedDivider(),
          const SizedBox(height: 14),

          // Investment Amount / Return
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      'Investment Amount',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Color(0xFF9B9BAB),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    Text(
                      "₹50,000",
                      style:  GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                     Text(
                      'Return',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Color(0xFF9B9BAB),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    Text(
                      "₹500 M",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Duration progress bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: _buildDurationBar(),
          ),
          const SizedBox(height: 18),

          const _DashedDivider(),
          const SizedBox(height: 16),

          // Remaining Returns / Total Returns Received
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      'Remaining Returns',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Color(0xFF9B9BAB),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    Text(
                      "₹5,500",
                      style:GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                     Text(
                      'Total Returns Received',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Color(0xFF9B9BAB),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    Text(
                      "₹500 ",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: const Divider(color: Color(0xFFECECF2), height: 1),
          ),
          const SizedBox(height: 10),

          // Start Date / End Date
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      'Start Date',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Color(0xFF9B9BAB),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "15 Jul 26",
                      style:GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                     Text(
                      'End Date',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Color(0xFF9B9BAB),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "15 Jul 27",
                      style:GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),


        ],
      ),
    );
  }


  Widget _buildDurationBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8E8EF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(
                'Duration',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A2E),
                ),
              ),
              Text(
                '1/12 Months',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A2E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 8,
              child: Stack(
                children: [
                  Container(color: const Color(0xFFE4E4EA)),
                  FractionallySizedBox(
                    widthFactor: 1 / 12,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF6A3DE8), Color(0xFFA24DFF)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------- Payout history table ----------
  Widget _buildPayoutHistoryTable() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children:  [
                Expanded(
                  flex: 3,
                  child: Text(
                    'Date',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Amount',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Status',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const _DashedDivider(),

          // Data row(s)
          _buildPayoutRow(date: '15 Jul 26', amount: '₹500', status: 'Credited'),
          SizedBox(height: 50),

        ],
      ),
    );
  }

  Widget _buildPayoutRow({
    required String date,
    required String amount,
    required String status,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              date,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A2E),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              amount,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A2E),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              status,
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1E8E63),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------- Mature Investment button ----------
  Widget _buildMatureInvestmentButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: const LinearGradient(
            colors: [Color(0xFF6A3DE8), Color(0xFFA24DFF)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF8B4DFF).withOpacity(0.35),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () {
              // TODO: handle mature investment
            },
            child:  Center(
              child: Text(
                'Mature Investment',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DashedDivider extends StatelessWidget {
  const _DashedDivider();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const dashWidth = 5.0;
        const dashGap = 4.0;
        final dashCount =
        (constraints.maxWidth / (dashWidth + dashGap)).floor();
        return SizedBox(
          height: 1,
          child: Row(
            children: List.generate(dashCount, (_) {
              return Padding(
                padding: const EdgeInsets.only(right: dashGap),
                child: Container(
                  width: dashWidth,
                  height: 1,
                  color: const Color(0xff7750D5),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}