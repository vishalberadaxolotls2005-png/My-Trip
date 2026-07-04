import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'by_night_tab/by_night_tab.dart';
import 'hourly_stay_tab/hourly_stay_tab.dart';
import 'near_you_tab/near_you_tab.dart';

class HotelHomestayScreen extends StatefulWidget {
  const HotelHomestayScreen({super.key});

  @override
  State<HotelHomestayScreen> createState() => _HotelHomestayScreenState();
}

class _HotelHomestayScreenState extends State<HotelHomestayScreen> {
  int _selectedIndex = 0; // 0 = By Night, 1 = Hourly Stays, 2 = Near You

  static const Color purple = Color(0xff7750D5);
  static const Color tabSelectedBg = Color(0xFFF9F0FD);
  static const Color blackText = Color(0xFF1B1B1B);

  static const _labels = ['By Night', 'Hourly Stays', 'Near You'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 17),
        ),
        title: Text(
          'Hotels & Homestays',
          style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
      body: Column(
        children: [
          // ---------- Segmented tab bar (fixed, never rebuilt on tab switch) ----------
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Container(
              height: 46,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xffC7C7C7)),
              ),
              child: Row(
                children: List.generate(_labels.length, (index) {
                  final isSelected = _selectedIndex == index;
                  final isPrevSelected = index > 0 && _selectedIndex == index - 1;
                  final showDividerBefore = index > 0 && !isSelected && !isPrevSelected;

                  return Expanded(
                    child: Row(
                      children: [

                        Expanded(
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () => setState(() => _selectedIndex = index),
                            child: AnimatedContainer(
                              duration:  Duration.zero,
                              decoration: BoxDecoration(
                                color: isSelected ? tabSelectedBg : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: isSelected ? purple : Colors.transparent),
                              ),
                              child: Center(
                                child: Text(
                                  _labels[index],
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: isSelected ? purple : blackText,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),

          // ---------- Body: ONLY this swaps when a tab is tapped ----------
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children:  [
                ByNightTab(),
                HourlyStayTab(),
                NearYouTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}