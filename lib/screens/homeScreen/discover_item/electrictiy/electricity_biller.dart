import 'package:flutter/material.dart';
import 'package:my_trip/screens/homeScreen/discover_item/electrictiy/electricity_biller_details.dart';


class ElectricityBiller extends StatefulWidget {

  @override
  State<ElectricityBiller> createState() => _ElectricityBillerState();
}

class _BillerData {
  final String name;
  final Color logoBg;
  final IconData icon;
  final Color iconColor;

  const _BillerData({
    required this.name,
    required this.logoBg,
    required this.icon,
    required this.iconColor,
  });
}

class _ElectricityBillerState extends State<ElectricityBiller> {
  final TextEditingController _searchController = TextEditingController();

  final List<_BillerData> _billers = const [
    _BillerData(
      name: 'MSEDCL maharashtra state electricity board',
      logoBg: Color(0xFFEFF3FB),
      icon: Icons.water_drop_rounded,
      iconColor: Color(0xFF2F5DBB),
    ),
    _BillerData(
      name: 'Adani Electricity Board',
      logoBg: Color(0xFFFDEEEE),
      icon: Icons.water_drop_rounded,
      iconColor: Color(0xFFC0392B),
    ),
    _BillerData(
      name: 'Tata power electricity board',
      logoBg: Color(0xFFEAF3EC),
      icon: Icons.water_drop_rounded,
      iconColor: Color(0xFF1E7A46),
    ),
    _BillerData(
      name: 'Best Mumbai Electricity Board',
      logoBg: Color(0xFFFCEBEE),
      icon: Icons.water_drop_rounded,
      iconColor: Color(0xFFD6336C),
    ),
    _BillerData(
      name: 'Goa Electricity Board',
      logoBg: Color(0xFFEFF3FB),
      icon: Icons.water_drop_rounded,
      iconColor: Color(0xFF2F5DBB),
    ),
  ];

  int _selectedIndex = 0;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title:Text(
          'Electricity',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A2E),
          ),
        ) ,
        leading:IconButton(
          icon:  Icon(Icons.arrow_back_ios_new_rounded,
              color: Color(0xFF1A1A2E), size: 17),
          onPressed: () => Navigator.pop(context),
        ) ,
        actions: [

          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: (){
              },
              child: Container(
                width: 80,
                height: 30,
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
                    "View Sample",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
        bottom: PreferredSize(preferredSize:  Size.fromHeight(170),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 14),
              child: Column(
                children: [
                  _buildSelectBillerCard(),
                  const SizedBox(height: 12),
                  _buildConsumerNumberCard(),
                ],
              ),
            )),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    const Text(
                      'All Billers',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildSearchField(),
                    const SizedBox(height: 16),
                    ...List.generate(_billers.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: _buildBillerTile(index),
                      );
                    }),
                    const SizedBox(height: 10),
                    //Cointinue button
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ElectricityBillerDetails()));
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
                            "Continue",
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
              ),
            ),
          ],
        ),
      ),

    );
  }



  // ---------- Select Biller card ----------
  Widget _buildSelectBillerCard() {
    return _InputStyleCard(
      label: 'Select Biller',
      value: 'MSEDCL maharashtra state electricity board',
    );
  }

  // ---------- Consumer Number card ----------
  Widget _buildConsumerNumberCard() {
    return _InputStyleCard(
      label: 'Consumer Number',
      value: '944393952909265',
    );
  }

  // ---------- Search field ----------
  Widget _buildSearchField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xff7750D5)),
      ),
      child: TextField(
        controller: _searchController,
        style: const TextStyle(fontSize: 14, color: Color(0xFF1A1A2E)),
        decoration: const InputDecoration(
          hintText: 'Search by biller or state/union territory',
          hintStyle: TextStyle(
            fontSize: 14,
            color: Color(0xFF9B9BAB),
          ),
          suffixIcon: Icon(Icons.search, color: Color(0xff7750D5)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }

  // ---------- Biller tile ----------
  Widget _buildBillerTile(int index) {
    final biller = _billers[index];
    final selected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? const Color(0xff7750D5) : const Color(0xFFECECF2),
            width: 1,
          ),
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
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(

                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Image.asset("assets/images/electricity.png",fit: BoxFit.cover,),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                biller.name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A2E),
                  height: 1.3,
                ),
              ),
            ),
            if (selected)
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'Selected',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff7750D5),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }



}

/// Shared style for the "Select Biller" / "Consumer Number" light gray cards
class _InputStyleCard extends StatelessWidget {
  final String label;
  final String value;

  const _InputStyleCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          color: const Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 1,
              color: Color(0xffC7C7C7)
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
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A2E),
            ),
          ),
        ],
      ),
    );
  }
}