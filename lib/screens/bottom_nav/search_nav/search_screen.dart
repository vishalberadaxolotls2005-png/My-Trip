import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // ---- Colors (kept consistent with the rest of the app) ----
  static const Color purple = Color(0xff7750D5);
  static const Color greyText = Color(0xff707070);
  static const Color blackText = Color(0xFF1B1B1B);
  static const Color borderGrey = Color(0xffD9D9D9);

  final TextEditingController _searchController = TextEditingController();

  // Mock data - replace with real recent searches / trending places from your API.
  final List<String> _recentSearches = [
    'Delhi to Goa Flights',
    'Delhi in Hotels',
  ];

  static const List<_TrendingPlace> _trendingPlaces = [
    _TrendingPlace(name: 'Kerala', imgPath: 'assets/images/image 20.png'),
    _TrendingPlace(name: 'Goa', imgPath: 'assets/images/image 7.png'),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _removeRecentSearch(int index) {
    setState(() => _recentSearches.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back button + search field row
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 16, 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 17),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Container(
                      height: 42,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: purple),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search, color: greyText, size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              style: GoogleFonts.poppins(fontSize: 13, color: blackText),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                hintText: 'ex. Delhi to Goa Flights',
                                hintStyle: GoogleFonts.poppins(fontSize: 13, color: greyText),
                              ),
                              onSubmitted: (value) {
                                // TODO: trigger search + add to recent searches
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_recentSearches.isNotEmpty) ...[
                      Text(
                        'Recent Searches',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: blackText,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ...List.generate(_recentSearches.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _RecentSearchTile(
                            label: _recentSearches[index],
                            onRemove: () => _removeRecentSearch(index),
                          ),
                        );
                      }),
                      const SizedBox(height: 6),
                    ],
                    Text(
                      'Trending Places',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: blackText,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: _trendingPlaces
                          .map((place) => Padding(
                        padding: const EdgeInsets.only(right: 18),
                        child: _TrendingPlaceItem(place: place),
                      ))
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecentSearchTile extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;
  const _RecentSearchTile({required this.label, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _SearchScreenState.borderGrey),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: _SearchScreenState.blackText,
              ),
            ),
          ),
          InkWell(
            onTap: onRemove,
            child: const Icon(Icons.close, size: 18, color: _SearchScreenState.greyText),
          ),
        ],
      ),
    );
  }
}

class _TrendingPlace {
  final String name;
  final String imgPath;
  const _TrendingPlace({required this.name, required this.imgPath});
}

class _TrendingPlaceItem extends StatelessWidget {
  final _TrendingPlace place;
  const _TrendingPlaceItem({required this.place});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Container(
            width: 64,
            height: 64,

            decoration: BoxDecoration(
              border: Border.all(color: Colors.white,  width: 2),

            ),
            child: Image.asset(
              place.imgPath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image, color: _SearchScreenState.greyText, size: 24);
              },
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          place.name,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: _SearchScreenState.blackText,
          ),
        ),
      ],
    );
  }
}