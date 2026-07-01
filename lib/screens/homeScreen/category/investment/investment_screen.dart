import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'invest_detail_bottom_sheet.dart';

class InvestmentsScreen extends StatefulWidget {
  const InvestmentsScreen({super.key});

  @override
  State<InvestmentsScreen> createState() => _InvestmentsScreenState();
}

class _InvestmentPlan {
  final String rate;
  final String tenure;

  const _InvestmentPlan({required this.rate, required this.tenure});
}

class _InvestmentsScreenState extends State<InvestmentsScreen> {
  // 0 = One Time Invest, 1 = My Investments
  int _selectedTab = 0;

  var amountController=TextEditingController();

  // Amount chips
  final List<String> _amountOptions = ['₹50,000', '₹75,000', '₹1,00,000'];
  int _selectedAmountIndex = 0;

  // Investment plans filter: 0 = Rate, 1 = Tenure
  int _planFilter = 0;

  final List<_InvestmentPlan> _plans = const [
    _InvestmentPlan(rate: '8.1%', tenure: '2Y 6M'),
    _InvestmentPlan(rate: '7.9%', tenure: '5Y'),
    _InvestmentPlan(rate: '7.9%', tenure: '3Y'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
     appBar:  AppBar(
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
        title: const Text(
          "Investments",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        bottom:PreferredSize(preferredSize:   const Size.fromHeight(440), child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 14),
          child: Column(
            children: [
              _buildTabSwitcher(),
              SizedBox(height: 10,),
              // Investment amount box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                      "Investment Amount",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF707070),
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    Row(
                      children: [
                        const Text(
                          '₹',
                          style: TextStyle(
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
                            style: const TextStyle(
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
                            color: selected
                                ? const Color(0xFFF3EEFE)
                                : Colors.white,
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
                            style: TextStyle(
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
                  border: Border.all(
                    color: Color(0xffC7C7C7)
                  )
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Maturity Amount',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF9B9BAB),
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    Text(
                      '₹61,099',
                      style: TextStyle(
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
                children: const [
                  Text(
                    'Avg. Annual Yield',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6B6B7B),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '8.86% p.a.',
                    style: TextStyle(
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
                onTap: (){
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
                      "Invest Now",
                      style: TextStyle(
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
        )),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: _selectedTab == 0
                    ? _buildOneTimeInvestContent()
                    : _buildMyInvestmentsContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }



  // ---------- Segmented tab switcher ----------
  Widget _buildTabSwitcher() {
    return Row(
      children: [
        Expanded(child: _buildTabButton('One Time Invest', 0)),
        const SizedBox(width: 10),
        Expanded(child: _buildTabButton('My Investments', 1)),
      ],
    );
  }

  Widget _buildTabButton(String label, int index) {
    final selected = _selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFF3EEFE) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? const Color(0xff7750D5) : const Color(0xffC7C7C7),
            width: selected ? 1.5 : 1,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: selected ? const Color(0xFF8B4DFF) : const Color(0xFF1A1A2E),
          ),
        ),
      ),
    );
  }

  // ---------- One Time Invest tab content ----------
  Widget _buildOneTimeInvestContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // Investment Plans section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Investment Plans',
              style: TextStyle(
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

  Widget _buildInfoBox({required String label, required String value}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xffC7C7C7),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF9B9BAB),
              fontWeight: FontWeight.w700,
            ),
          ),

          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1A1A2E),
            ),
          ),
        ],
      ),
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
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: selected ? const Color(0xFF8B4DFF) : const Color(0xFF1A1A2E),
          ),
        ),
      ),
    );
  }

  Widget _buildPlanTile(_InvestmentPlan plan) {
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
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1A1A2E),
                  ),
                ),

                const Text(
                  'Interest Rate',
                  style: TextStyle(
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
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1A1A2E),
                  ),
                ),

                const Text(
                  'Tenure',
                  style: TextStyle(
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
                  colors: [ Color(0xff7750D5),
                    Color(0xffB457EB),
                    Color(0xffA751D8)],
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
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Center(
                      child: Text(
                        'Invest',
                        style: TextStyle(
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

  // ---------- My Investments tab content ----------
  Widget _buildMyInvestmentsContent() {
    return const Padding(
      padding: EdgeInsets.only(top: 60),
      child: Center(
        child: Text(
          'You have no investments yet.',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF9B9BAB),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}