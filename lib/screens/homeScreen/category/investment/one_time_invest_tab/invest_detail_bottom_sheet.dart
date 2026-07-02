import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';



class InvestmentDetailsBottomSheet extends StatefulWidget {
  const InvestmentDetailsBottomSheet({super.key});

  @override
  State<InvestmentDetailsBottomSheet> createState() =>
      _InvestmentDetailsBottomSheetState();
}

class _InvestmentDetailsBottomSheetState
    extends State<InvestmentDetailsBottomSheet> {
  // 0 = Wallet, 1 = Bank Account, 2 = UPI
  int _selectedMethod = 0;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(color: Color(0xff707070), height: 1),
                      const SizedBox(height: 5),
                       Text(
                        'Earn returns on your investment.',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Color(0xFF9B9BAB),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),

                      _buildDetailRow('Investment Amount', '₹50,000'),
                      const SizedBox(height: 8),
                      _buildDetailRow('Monthly Return', '₹500'),
                      const SizedBox(height: 8),
                      _buildDetailRow('Duration', '12 Months'),
                      const SizedBox(height: 8),
                      _buildDetailRow('Total Expected Returns', '₹6,000'),
                      const SizedBox(height: 8),
                      _buildDetailRow('Principal Amount', '₹56,000'),
                      const SizedBox(height: 10),

                      const Divider(color: Color(0xff707070), height: 1),
                      const SizedBox(height: 8),

                      const Text(
                        'Payout Details',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF9B9BAB),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildDetailRow('First Payout Date', '15 Jun 26'),
                      const SizedBox(height: 8),
                      _buildDetailRow('Payout Frequency', 'Monthly'),
                      const SizedBox(height: 8),
                      _buildDetailRow('Returns Credited To', 'Wallet'),
                      const SizedBox(height: 10),
                      const Divider(color: Color(0xff707070), height: 1),
                      const SizedBox(height: 8),

                       Text(
                        'Select Payment Method',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Color(0xFF9B9BAB),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Payment method options
                      _PaymentOptionTile(
                        imgpath: "assets/images/recharge_wallet.svg",
                        iconColor: const Color(0xFF7B2FF7),
                        iconBgColor: const Color(0xFFF3E8FF),
                        label: 'Wallet',
                        selected: _selectedMethod == 0,
                        onTap: () => setState(() => _selectedMethod = 0),
                      ),
                      const SizedBox(height: 8),
                      _PaymentOptionTile(
                        imgpath: "assets/images/bank.svg",
                        iconColor: const Color(0xFF1A1A2E),
                        iconBgColor: Colors.transparent,
                        label: 'Bank Account',
                        selected: _selectedMethod == 1,
                        onTap: () => setState(() => _selectedMethod = 1),
                      ),
                      const SizedBox(height: 8),
                      _PaymentOptionTile(
                        imgpath: "assets/images/upi.png",
                        iconColor: const Color(0xFF1A1A2E),
                        iconBgColor: Colors.transparent,
                        label: 'UPI',
                        selected: _selectedMethod == 2,
                        onTap: () => setState(() => _selectedMethod = 2),

                      ),
                      const SizedBox(height: 24),

                      InkWell(
                        onTap: (){


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
                              "Confirm Investment",
                              style: GoogleFonts.poppins(
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
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.close, color: Color(0xFF1A1A2E), size: 22),
          ),
           Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(right: 24),
                child: Text(
                  'Investment Details',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style:GoogleFonts.poppins(
            fontSize: 14,
            color: Color(0xFF1A1A2E),
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Color(0xFF1A1A2E),
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }



}


class _PaymentOptionTile extends StatelessWidget {
  final String imgpath;
  final Color iconColor;
  final Color iconBgColor;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Widget? customIcon;

  const _PaymentOptionTile({
    required this.imgpath,
    required this.iconColor,
    required this.iconBgColor,
    required this.label,
    required this.selected,
    required this.onTap,
    this.customIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFF3EEFE) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? const Color(0xff7750D5) : const Color(0xFFE8E8EF),
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [

            if (customIcon != null)
              customIcon!
            else if (imgpath.endsWith('.svg'))
              SvgPicture.asset(
                imgpath,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              )
            else
              Image.asset(
                imgpath,
                width: 24, // Control the size of your PNG
                height: 24,
                fit: BoxFit.contain,
              ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style:GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A1A2E),
                ),
              ),
            ),
            // Radio circle
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected
                      ? const Color(0xff7750D5)
                      : const Color(0xFFD8D8E0),
                  width: 2,
                ),
              ),
              alignment: Alignment.center,
              child: selected
                  ? Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff7750D5),
                ),
              )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}