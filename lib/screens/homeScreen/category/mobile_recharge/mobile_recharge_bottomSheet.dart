import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Call this to show the bottom sheet


class MobileRechargeBottomSheet extends StatefulWidget {
  const MobileRechargeBottomSheet({super.key});

  @override
  State<MobileRechargeBottomSheet> createState() =>
      _MobileRechargeBottomSheetState();
}

class _MobileRechargeBottomSheetState
    extends State<MobileRechargeBottomSheet> {
  // 0 = Wallet, 1 = Bank Account, 2 = UPI
  int _selectedMethod = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: close icon + title
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child:  Icon(
                  Icons.close,
                  color: Color(0xFF1A1A2E),
                  size: 22,
                ),
              ),
              const Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 24), // balance the X icon
                    child: Text(
                      'Mobile Recharge',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Jio recharge summary row
          Row(
            children: [
              // Jio logo circle
              Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  color: Color(0xFF0F1E8C), // Jio dark blue
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Jio',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
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
                        color: Color(0xFF1A1A2E),
                      ),
                    ),

                    Text(
                      'Jio, Maharashtra & Goa',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF9B9BAB),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                '₹699',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A2E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Dashed divider
          const _DashedDivider(),
          const SizedBox(height: 16),

          // Select Payment Method label
          const Text(
            'Select Payment Method',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff707070),
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
          const SizedBox(height: 30),

          // Pay Now button
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
                  "Pay Now",
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
                style: const TextStyle(
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
                  color: const Color(0xFFE0E0E8),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}