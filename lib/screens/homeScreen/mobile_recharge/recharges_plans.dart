import 'package:flutter/material.dart';

class RechargePlansScreen extends StatefulWidget {
  const RechargePlansScreen({super.key});

  @override
  State<RechargePlansScreen> createState() => _RechargePlansScreenState();
}

class _RechargePlansScreenState extends State<RechargePlansScreen> {
  int selectedTab = 0;
  final tabs = ['Popular', 'Data Packs', 'Yearly Plans', 'Sp...'];

  @override
  Widget build(BuildContext context) {
    const purple = Color(0xFF7B4CF0);

    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F2),
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
        title: const Text(
          "Mobile Recharge",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: purple, width: 1.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF0A1F6E),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Jio',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '4388292849',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),

                        Text(
                          'Jio, Maharashtra & Goa',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF8A8A8E),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.edit_outlined,
                    size: 20,
                    color: Color(0xff7750D5),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          children: [
            // Selected plan card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Color(0xffC4C4C4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffF6F6F6),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xffC4C4C4),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Plan Amount",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF7D7D7D),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "₹699",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF2D2D2D),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Text(
                          "Selected Plan",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff7750D5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  CustomPaint(
                    size: const Size(double.infinity, 1),
                    painter: _DashedLinePainter(),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Expanded(
                        child: _PlanInfoColumn(
                          label: 'Validity',
                          value: '28 Days',
                        ),
                      ),
                      Expanded(
                        child: _PlanInfoColumn(
                          label: 'Talk time',
                          value: 'Unlimited',
                        ),
                      ),
                      Expanded(
                        child: _PlanInfoColumn(
                          label: 'Data',
                          value: '2 GB/day',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 12.5,
                        color: Color(0xFF6B6B70),
                        height: 1.5,
                      ),
                      children: [
                        TextSpan(
                          text:
                              'Jio Special benefits: True 5G Unlimited Pla +JioHostar Mobile + Pro Google Gemini | Data: 2',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'View More',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff7750D5),
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>RechargePlansScreen()));
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
                          "Recharge Now",
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
            const SizedBox(height: 15),

            const Text(
              'Recharge Plans',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 14),

            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xff7750D5), width: 1.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: const [
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: 14, color: Color(0xFF1A1A1A)),
                      decoration: InputDecoration(
                        hintText:
                            "Search for a plan line '349' or 'Date' or...",
                        hintStyle: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF8A8A8E),
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                  Icon(Icons.search, color: Color(0xff7750D5), size: 20),
                ],
              ),
            ),
            const SizedBox(height: 13),

            // Tabs
            Container(
              height: 36,
              color: Colors.white,
              width: double.infinity,

              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: tabs.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, i) {
                  final isSelected = i == selectedTab;
                  return GestureDetector(
                    onTap: () => setState(() => selectedTab = i),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: isSelected ? Color(0xff7750D5) :  Colors.white,
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        tabs[i],
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? purple : const Color(0xFF1A1A1A),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 18),

            // Plan cards list
            _PlanListCard(
              validity: '28 Days',
              talktime: 'Unlimited',
              data: '2 GB/day',
              price: '\u20B9299',
            ),
            const SizedBox(height: 14),
            _PlanListCard(
              validity: '28 Days',
              talktime: 'Unlimited',
              data: '2 GB/day',
              price: '\u20B9349',

            ),
          ],
        ),
      ),
    );
  }
}

class _PlanInfoColumn extends StatelessWidget {
  final String label;
  final String value;

  const _PlanInfoColumn({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF8A8A8E)),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A),
          ),
        ),
      ],
    );
  }
}

class _PlanListCard extends StatelessWidget {
  final String validity;
  final String talktime;
  final String data;
  final String price;
  final bool showBenefits;

  const _PlanListCard({
    required this.validity,
    required this.talktime,
    required this.data,
    required this.price,
    this.showBenefits = true,
  });

  @override
  Widget build(BuildContext context) {
    const purple = Color(0xFF7B4CF0);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color:  Color(0xffC4C4C4),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: _PlanInfoColumn(
                        label: 'Validity',
                        value: validity,
                      ),
                    ),
                    Expanded(
                      child: _PlanInfoColumn(
                        label: 'Talk time',
                        value: talktime,
                      ),
                    ),
                    Expanded(
                      child: _PlanInfoColumn(label: 'Data', value: data),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RechargePlansScreen()));
                },
                child: Container(
                  width: 65,
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
                      price,
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
          if (showBenefits) ...[
            const SizedBox(height: 12),
            CustomPaint(
              size: const Size(double.infinity, 1),
              painter: _DashedLinePainter(),
            ),
            const SizedBox(height: 12),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 12.5,
                  color: Color(0xFF6B6B70),
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text:
                        'Jio Special benefits: True 5G Unlimited Pla +JioHostar Mobile + Pro Google Gemini | Data: 2 ',
                  ),
                  TextSpan(
                    text: 'View More',
                    style: TextStyle(
                      color: purple,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE0E0E4)
      ..strokeWidth = 1;
    const dashWidth = 5.0;
    const dashSpace = 4.0;
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
