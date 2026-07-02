import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'investment_view_details.dart';


class ActivePlan {
  final String monthsProgress;
  final String investmentAmount;
  final String returnAmount;

  const ActivePlan({
    required this.monthsProgress,
    required this.investmentAmount,
    required this.returnAmount,
  });
}


class MyInvestmentsTab extends StatefulWidget {
  const MyInvestmentsTab({super.key});

  @override
  State<MyInvestmentsTab> createState() => _MyInvestmentsTabState();
}

class _MyInvestmentsTabState extends State<MyInvestmentsTab> {
  bool _showDetails = false;

  static const List<ActivePlan> _activePlans = [
    ActivePlan(
      monthsProgress: '1/12 Months',
      investmentAmount: '₹50,000',
      returnAmount: '₹500 M',
    ),
    ActivePlan(
      monthsProgress: '1/12 Months',
      investmentAmount: '₹1,00,000',
      returnAmount: '₹500 M',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: _showDetails
          ? InvestmentViewDetailsContent(
        onBack: () => setState(() => _showDetails = false),
      )
          : _buildActivePlansList(),
    );
  }

  Widget _buildActivePlansList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Active Plans',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A2E),
          ),
        ),
        const SizedBox(height: 10),
        ...List.generate(_activePlans.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: _ActivePlanCard(
              plan: _activePlans[index],
              onViewDetails: () => setState(() => _showDetails = true),
            ),
          );
        }),
      ],
    );
  }
}

class _ActivePlanCard extends StatelessWidget {
  final ActivePlan plan;
  final VoidCallback onViewDetails;

  const _ActivePlanCard({required this.plan, required this.onViewDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
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
                        const Text(
                          'Active',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff12B76A),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      plan.monthsProgress,
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
              const SizedBox(height: 12),
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
                        const SizedBox(height: 4),
                        Text(
                          plan.investmentAmount,
                          style: GoogleFonts.poppins(
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
                        const SizedBox(height: 4),
                        Text(
                          plan.returnAmount,
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
              // View button
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                child: SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff7750D5),
                          Color(0xffB457EB),
                          Color(0xffA751D8)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: onViewDetails,
                        child:  Center(
                          child: Text(
                            'View Details',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
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
                  color: const Color(0xFF8765DA),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}