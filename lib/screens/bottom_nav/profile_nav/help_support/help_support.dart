import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),

      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 3,
        shadowColor: Colors.black12,
        centerTitle: true,
        leading:  InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 17,
          ),
        ),
        title: const Text(
          "Help & Support",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17,horizontal: 17),
        child: GridView.count(

          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 18,
          childAspectRatio: 1.1,
          physics: const NeverScrollableScrollPhysics(),
          children: const [

            SupportCard(
              icon: Icons.help_outline,
              title: "FAQ",
              subtitle: "Find answers to common questions",
            ),

            SupportCard(
              icon: Icons.report_gmailerrorred_outlined,
              title: "Report\nIssue",
              subtitle: "Report bugs or technical problems.",
            ),

            SupportCard(
              icon: Icons.feedback_outlined,
              title: "Feedback",
              subtitle: "Share your suggestions and experience.",
            ),

            SupportCard(
              icon: Icons.contact_support_outlined,
              title: "Help\nCenter",
              subtitle: "Browse guides and support articles.",
            ),
          ],
        ),
      ),
    );
  }
}

class SupportCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const SupportCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {},
      child: Container(

        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: const Color(0xffCFCFCF),
          ),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: const Color(0xff2D2D2D),
                ),
                SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff2D2D2D),
                    height: 1,
                  ),
                ),
              ],
            ),


 SizedBox(height: 5,),

            Text(
              subtitle,
              style: const TextStyle(
                color: Color(0xff8A8A8A),
                fontSize: 12,
                height: 1.35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}