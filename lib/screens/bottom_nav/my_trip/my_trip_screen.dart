import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'all_trip_details.dart';
import 'all_tab/all_trip_tab.dart';
import 'cancelled_tab/cancelled_trip_tab.dart';
import 'completed_tab/completed_trip_tab.dart';
import 'trip_model.dart'; // adjust path to wherever you saved Trip

class MyTripScreen extends StatefulWidget {
  const MyTripScreen({super.key});

  @override
  State<MyTripScreen> createState() => _MyTripScreenState();
}

class _MyTripScreenState extends State<MyTripScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  Trip? _selectedTrip;

  static const Color tabSelectedBg = Color(0xFFF9F0FD);
  static const Color tabSelectedText = Color(0xFF7750D5);
  static const Color tabUnselectedText = Color(0xff1B1A1A);

  static const _labels = ['All', 'Completed', 'Cancelled'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _openDetails(Trip trip) {
    setState(() => _selectedTrip = trip);
  }

  void _closeDetails() {
    setState(() => _selectedTrip = null);
  }

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
        title: Text(
          "My Trip",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xffC7C7C7)),
              ),
              child: Row(
                children: List.generate(_labels.length, (index) {
                  final isSelected = _tabController.index == index;
                  return Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        _tabController.animateTo(index);
                      },
                      child: AnimatedContainer(
                        duration: Duration.zero,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? tabSelectedBg : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isSelected ? tabSelectedText : Colors.white,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            _labels[index],
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: isSelected ? tabSelectedText : tabUnselectedText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _selectedTrip != null
                ? TripDetailsScreen(trip: _selectedTrip!, onBack: _closeDetails)
                : TabBarView(
              controller: _tabController,
              children: [
                AllTripsTab(onViewDetails: _openDetails),
                CompletedTripsTab(onViewDetails: _openDetails),
                CancelledTripsTab(onViewDetails: _openDetails),
              ],
            ),
          ),
        ],
      ),
    );
  }
}