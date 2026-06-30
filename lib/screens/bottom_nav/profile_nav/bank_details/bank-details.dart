import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BankDetailsScreen extends StatelessWidget {
  const BankDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),

      appBar: AppBar(
        elevation: 3,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        shadowColor: Colors.black12,
        centerTitle: true,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new,color: Colors.black,size: 17)),
        title: const Text(
          "Bank Details",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            BankCard(
              logo: "assets/images/kotak.png",
              bankName: "Kotak Mahindra Bank",
              accountNumber: "**94308",
              isPrimary: true,
            ),

            const SizedBox(height: 12),

            BankCard(
              logo: "assets/images/hdfc.png",
              bankName: "HDFC Bank",
              accountNumber: "**94308",
            ),

            const Spacer(),

            Container(
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
                  "Add New Account",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BankCard extends StatelessWidget {

  final String logo;
  final String bankName;
  final String accountNumber;
  final bool isPrimary;

  const BankCard({
    super.key,
    required this.logo,
    required this.bankName,
    required this.accountNumber,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 14,
            offset: const Offset(0,4),
          )
        ],
      ),

      child: Row(
        children: [

          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(logo),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  bankName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),



                Row(
                  children: [

                    Text(
                      accountNumber,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),

                    if(isPrimary)...[
                      const SizedBox(width: 8),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffE8F8E8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Primary Account",
                          style: TextStyle(
                            color: Color(0xff48A84E),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ]
                  ],
                )
              ],
            ),
          ),

          PopupMenuButton(
            icon: const Icon(Icons.more_vert,color: Colors.black,size: 20,),
            itemBuilder: (context)=>[
              const PopupMenuItem(
                value: 1,
                child: Text("Edit"),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text("Delete"),
              ),
            ],
          )
        ],
      ),
    );
  }
}