import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'invest_detail_bottom_sheet.dart';

class InvestmentPlan {
  final String rate;
  final String tenure;

  const InvestmentPlan({required this.rate, required this.tenure});
}

/// Full "One Time Invest" tab: amount input box, amount chips,
/// tenure/gain boxes, maturity box, Invest Now button, and the
/// Investment Plans list below it.
class OneTimeInvestTab extends StatefulWidget {
  const OneTimeInvestTab({super.key});

  @override
  State<OneTimeInvestTab> createState() => _OneTimeInvestTabState();
}

class _OneTimeInvestTabState extends State<OneTimeInvestTab> {
  final TextEditingController amountController = TextEditingController();

  final List<String> _amountOptions = ['₹50,000', '₹75,000', '₹1,00,000'];
  int _selectedAmountIndex = 0;

  int _planFilter = 0; // 0 = Rate, 1 = Tenure

  final List<InvestmentPlan> _plans = const [
    InvestmentPlan(rate: '8.1%', tenure: '2Y 6M'),
    InvestmentPlan(rate: '7.9%', tenure: '5Y'),
    InvestmentPlan(rate: '7.9%', tenure: '3Y'),
  ];

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTopSection(context),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: _buildPlansSection(),
        ),
      ],
    );
  }

  // ---------- Top white input section ----------
  Widget _buildTopSection(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        child: Column(
          children: [
            // Investment amount box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xffF6F6F6),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xffC7C7C7)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "Investment Amount",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Color(0xFF707070),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Row(
                    children: [
                       Text(
                        '₹',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1A1A2E),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: amountController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style:GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            hintText: '50,000',
                            hintStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Amount chips
            Row(
              children: List.generate(_amountOptions.length, (index) {
                final selected = _selectedAmountIndex == index;
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: index != _amountOptions.length - 1 ? 10 : 0),
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedAmountIndex = index),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: selected ? const Color(0xFFF3EEFE) : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: selected
                                ? const Color(0xff7750D5)
                                : const Color(0xFFE8E8EF),
                            width: selected ? 1.5 : 1,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          _amountOptions[index],
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: selected
                                ? const Color(0xff7750D5)
                                : const Color(0xFF1A1A2E),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 10),

            // Tenure + Total Gain row
            Row(
              children: [
                Expanded(
                  child: _buildInfoBox(label: 'Tenure', value: '12 Months'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildInfoBox(label: 'Total Gain', value: '₹11,099'),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Maturity Amount box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xffF6F6F6),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xffC7C7C7)),
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Maturity Amount',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Color(0xFF9B9BAB),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '₹61,099',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1E8E63),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),

            // Avg Annual Yield row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Text(
                  'Avg. Annual Yield',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Color(0xFF6B6B7B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '8.86% p.a.',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Invest Now button
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const InvestmentDetailsBottomSheet(),
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
                    "Invest Now",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox({required String label, required String value}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xffC7C7C7)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style:GoogleFonts.poppins(
              fontSize: 12,
              color: Color(0xFF9B9BAB),
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            value,
            style:GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1A1A2E),
            ),
          ),
        ],
      ),
    );
  }

  // ---------- Investment Plans section ----------
  Widget _buildPlansSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              'Investment Plans',
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                _buildPlanFilterChip('Rate', 0),
                const SizedBox(width: 8),
                _buildPlanFilterChip('Tenure', 1),
              ],
            ),
          ],
        ),
        const SizedBox(height: 14),
        ...List.generate(_plans.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _buildPlanTile(_plans[index]),
          );
        }),
      ],
    );
  }

  Widget _buildPlanFilterChip(String label, int index) {
    final selected = _planFilter == index;
    return GestureDetector(
      onTap: () => setState(() => _planFilter = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFF3EEFE) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? const Color(0xFF8B4DFF) : const Color(0xffC7C7C7),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: selected ? const Color(0xFF8B4DFF) : const Color(0xFF1A1A2E),
          ),
        ),
      ),
    );
  }

  Widget _buildPlanTile(InvestmentPlan plan) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plan.rate,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
                 Text(
                  'Interest Rate',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Color(0xFF9B9BAB),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plan.tenure,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
                 Text(
                  'Tenure',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Color(0xFF9B9BAB),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 38,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
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
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    // TODO: handle invest for this plan
                  },
                  child:  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Center(
                      child: Text(
                        'Invest',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 13,
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
    );
  }
}