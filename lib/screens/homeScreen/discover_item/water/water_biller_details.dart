import 'package:flutter/material.dart';
import 'package:my_trip/screens/homeScreen/discover_item/water/water_biller_bottom_sheet.dart';

class WaterBillDetailsScreen extends StatelessWidget {
  const WaterBillDetailsScreen({super.key});

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
        title: const Text(
          "Water",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),

      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 14),
          child: Column(
            children: [

              _buildBillCard(),
              Spacer(),
              InkWell(
                onTap: (){
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) =>  WaterBillerBottomSheet(),
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
                      "Pay Bill",
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

    );
  }



  // ---------- Bill card ----------
  Widget _buildBillCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
       border: Border.all(
         width: 1,
         color: Color(0xffC4C4C4)
       )
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Due date gradient header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: const BoxDecoration(
              gradient:  LinearGradient(
                colors: [
                  Color(0xff7750D5),
                  Color(0xffB457EB),
                  Color(0xffA751D8)
                ],
              ),
            ),
            child:  Center(
              child: Text(
                'Due Date: 01-Jul-2026',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Biller row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEFF3FB),
                        shape: BoxShape.circle,

                      ),
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/water_img.png",fit: BoxFit.cover,),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Maharashtra Jeevan Pradhikaran 105Vr..',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1A1A2E),
                            ),
                          ),

                          Text(
                            '944393952909',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1A1A2E),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 13),

                // Dashed divider
                const _DashedDivider(),
                const SizedBox(height: 16),

                // Bill Details heading
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Bill Details',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                    Text(
                      'Hide',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff7750D5),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                _buildDetailRow('Customer Name', 'Rohit Satpute'),
                const SizedBox(height: 5),
                _buildDetailRow('Bill Number', '000003374819158'),
                const SizedBox(height: 5),
                _buildDetailRow('Bill Date', '11-Jun-2026'),
                const SizedBox(height: 18),

                // Total Payable box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xffF6F6F6),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xffC4C4C4)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Total Payable',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF9B9BAB),
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      Text(
                        '₹1,280',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1A1A2E),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 130,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF6B6B7B),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Text(
          ': ',
          style: TextStyle(
            fontSize: 13,
            color: Color(0xFF6B6B7B),
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF6B6B7B),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
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
                  color: const Color(0xff7750D5),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}