import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_invest_tab/my_investment_tab.dart';
import 'one_time_invest_tab/one_time_invest_tab.dart';


class InvestmentsScreen extends StatefulWidget {
  const InvestmentsScreen({super.key});

  @override
  State<InvestmentsScreen> createState() => _InvestmentsScreenState();
}

class _InvestmentsScreenState extends State<InvestmentsScreen> {
  // 0 = One Time Invest, 1 = My Investments
  int _selectedTab = 0;

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
          "Investments",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            child: Column(
              children: [
                _buildTabSwitcher(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: _selectedTab == 0
              ? const OneTimeInvestTab()
              : const MyInvestmentsTab(),
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
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: selected ? const Color(0xFF8B4DFF) : const Color(0xFF1A1A2E),
          ),
        ),
      ),
    );
  }
}