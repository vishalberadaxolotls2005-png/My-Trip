import 'package:flutter/material.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

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
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 17,
          ),
        ),
        title: const Text(
          "Terms & Conditions",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SectionTitle("1. Introduction"),

            SizedBox(height: 7),

            Description(
              "Welcome to our Bible Quiz App. By using this app, you agree to follow these Terms & Conditions. The app is designed to provide fun, learning, and competitive quiz challenges for all users. Please use it responsibly and enjoy the experience.",
            ),

            SizedBox(height: 10),

            SectionTitle("2. User Rules"),

            SizedBox(height: 7),

            BulletText(
                "Users must provide accurate profile information."),
            BulletText(
                "Any cheating, use of bots, or unfair means is strictly prohibited."),
            BulletText(
                "Respect other players in chats, comments, or leaderboards."),
            BulletText(
                "Do not attempt to hack, modify, or misuse the app system."),
            BulletText(
                "One account per user is recommended for fair gameplay."),

            SizedBox(height: 10),

            SectionTitle("3. Privacy Policy"),

            SizedBox(height: 7),

            BulletText(
                "We collect basic user data like name, score, and gameplay activity to improve experience."),
            BulletText(
                "Your personal information will never be sold or shared with third parties."),
            BulletText(
                "Score and ranking data may be visible on leaderboards."),
            BulletText(
                "We use cookies and analytics to improve app performance and user experience."),

            SizedBox(height: 10),

            SectionTitle("4. Payment Terms (if any)"),

            SizedBox(height: 7),

            BulletText(
                "Some features like premium quizzes, subscriptions, or in-app purchases may require payment."),
            BulletText(
                "All purchases are final unless otherwise stated."),
            BulletText(
                "Refund requests will follow the platform's payment policy."),

          ],

        ),
      ),
    );
  }
}
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Color(0xff2E2E2E),
      ),
    );
  }
}

class Description extends StatelessWidget {
  final String text;

  const Description(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: const TextStyle(
        fontSize: 12,
        color: Color(0xff8A8A8A),
        height: 1.6,
      ),
    );
  }
}

class BulletText extends StatelessWidget {
  final String text;

  const BulletText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "•",
            style: TextStyle(
              fontSize: 12,
              color: Color(0xff7A7A7A),
            ),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xff8A8A8A),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}