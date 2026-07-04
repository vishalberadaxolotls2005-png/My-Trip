
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomGuestBottomSheet extends StatefulWidget {
  const RoomGuestBottomSheet({super.key});

  @override
  State<RoomGuestBottomSheet> createState() =>
      _RoomGuestBottomSheetState();
}

class _RoomGuestBottomSheetState
    extends State<RoomGuestBottomSheet> {

  int rooms = 1;
  int adults = 1;
  int children = 0;
  int pets = 0;

  Widget counter({
    required int value,
    required VoidCallback onAdd,
    required VoidCallback onRemove,
    bool isAddButton = false,
  }) {
    if (isAddButton) {
      return InkWell(
        onTap: onAdd,
        child: Container(
          width: 90,
          height: 34,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff7750D5)),
            color: Color(0xffF3EFFB),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              "ADD",
              style: GoogleFonts.poppins(
                color: const Color(0xff7750D5),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      width: 90,
      height: 34,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff7750D5)),
        color: Color(0xffF3EFFB),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [

          Expanded(
            child: InkWell(
              onTap: onRemove,
              child: const Center(
                child: Text(
                  "-",
                  style: TextStyle(
                      fontSize: 22,
                      color: Color(0xff7750D5)),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "$value",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color:Color(0xff7750D5)
                ),
              ),
            ),
          ),

          Expanded(
            child: InkWell(
              onTap: onAdd,
              child: const Center(
                child: Text(
                  "+",
                  style: TextStyle(
                      fontSize: 22,
                      color: Color(0xff815DD8)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget item({
    required String title,
    String? subtitle,
    required Widget trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                if (subtitle != null)

                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  ),
              ],
            ),
          ),

          trailing,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(top: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(22),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [

                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close,size: 20,),
                  ),

                  const Spacer(),

                  Text(
                    "Select Rooms & Guests",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),

                  const Spacer(),
                ],
              ),
            ),

            const Divider(color: Color(0xff707070),),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [

                  item(
                    title: "Rooms",
                    trailing: counter(
                      value: rooms,
                      onAdd: () {
                        setState(() => rooms++);
                      },
                      onRemove: () {
                        if (rooms > 1) {
                          setState(() => rooms--);
                        }
                      },
                    ),
                  ),

                  item(
                    title: "Adults",
                    trailing: counter(
                      value: adults,
                      onAdd: () {
                        setState(() => adults++);
                      },
                      onRemove: () {
                        if (adults > 1) {
                          setState(() => adults--);
                        }
                      },
                    ),
                  ),

                  item(
                    title: "Children",
                    subtitle: "0 - 17 Years Old",
                    trailing: counter(
                      value: children,
                      isAddButton: children == 0,
                      onAdd: () {
                        setState(() => children++);
                      },
                      onRemove: () {
                        if (children > 0) {
                          setState(() => children--);
                        }
                      },
                    ),
                  ),

                  Text(
                    "Please provide right number of children along with their right age for best options and prices.",
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      color: Color(0xff707070),
                    ),
                  ),



                  item(
                    title: "Number of Pets",
                    trailing: counter(
                      value: pets,
                      isAddButton: pets == 0,
                      onAdd: () {
                        setState(() => pets++);
                      },
                      onRemove: () {
                        if (pets > 0) {
                          setState(() => pets--);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),

            const Divider(color: Color(0xff707070),),

            Padding(
              padding: const EdgeInsets.all(16),
              child:   InkWell(
                onTap: () {


                },
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff7750D5),
                        Color(0xffB457EB),
                        Color(0xffA751D8)
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Done",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
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