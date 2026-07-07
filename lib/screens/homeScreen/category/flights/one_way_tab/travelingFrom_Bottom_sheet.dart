import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Call this to show the "Travelling From" bottom sheet.
Future<void> showTravellingFromSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const TravellingFromBottomSheet(),
  );
}

class TravellingFromBottomSheet extends StatefulWidget {
  const TravellingFromBottomSheet({super.key});

  @override
  State<TravellingFromBottomSheet> createState() =>
      _TravellingFromBottomSheetState();
}

class _TravellingFromBottomSheetState
    extends State<TravellingFromBottomSheet> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  // Sample recent search data
  final List<_AirportData> _recentSearches = const [
    _AirportData(
      code: 'IXU',
      city: 'Chhatrapati Sambhajinagar',
      airportName: 'Chhatrapati Sambhaji Maharaj Airport',
    ),
    _AirportData(
      code: 'DEL',
      city: 'New Delhi',
      airportName: 'Indira Gandhi International Airport',
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Auto-focus like in the screenshot (cursor is blinking in the field)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close button
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.close,
                    color: Color(0xff374957),
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // FROM field (active / focused state with purple border)
              Container(
                width: double.infinity,

                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                decoration: BoxDecoration(
                    color: const Color(0xffF9F0FD),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color(0xff7750D5)
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TRAVELLING FROM?",
                      style:  GoogleFonts.poppins(
                        fontSize: 12,
                        color: Color(0xff7952D6),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    TextField(


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
                        hintText: 'Enter City/Airport Name',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffC2BEC5),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // TO field (static, showing selected destination)
              Container(
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
                      "TO",
                      style:  GoogleFonts.poppins(
                        fontSize: 12,
                        color: Color(0xFF707070),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    Row(
                      children: [
                        IntrinsicWidth(
                          child: TextField(
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff616161),
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                              hintText: 'New Delhi',
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff616161),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        Expanded(
                          child: Text(
                            "DEL-Indira Gandhi International Airport",
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: const Color(0xFF707070),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),

              // Recent Searches header
               Text(
                'Recent Searches',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 12),

              // Recent searches list
              ..._recentSearches.map(
                    (airport) => Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: _RecentSearchTile(data: airport),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: Color(0xFF9B9B9B),
        letterSpacing: 0.3,
      ),
    );
  }
}

class _AirportData {
  final String code;
  final String city;
  final String airportName;

  const _AirportData({
    required this.code,
    required this.city,
    required this.airportName,
  });
}

class _RecentSearchTile extends StatelessWidget {
  final _AirportData data;

  const _RecentSearchTile({required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle selection of this recent search
        Navigator.of(context).pop(data);
      },
      borderRadius: BorderRadius.circular(10),
      child: Row(
        children: [
          // Airport code badge
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xffF6F6F6),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Color(0xffC7C7C7))
            ),
            child: Text(
              data.code,
              style:GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff1B1A1A),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // City + airport name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.city,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff2E2F30),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  data.airportName,
                  style:GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff757576),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}