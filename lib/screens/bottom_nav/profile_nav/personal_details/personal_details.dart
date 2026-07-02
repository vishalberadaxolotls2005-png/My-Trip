import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalDetailsScreen extends StatelessWidget {
   PersonalDetailsScreen({super.key});

  final nameController = TextEditingController(text: "Sarah Smith");
  final phoneController = TextEditingController(text: "+91 3884992855");
  final dobController = TextEditingController(text: "10/06/2026");
  final genderController = TextEditingController(text: "Male");
  final cityController = TextEditingController(text: "Pune");
  final pinController = TextEditingController(text: "4100637");
  final stateController = TextEditingController(text: "Maharashtra");
  final addressController = TextEditingController(text: "Katraj road, Pune");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),

      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.black12,
        centerTitle: true,
        leading:  InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new,
              color: Colors.black, size: 17),
        ),
        title:  Text(
          "Personal Details",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
          child: Column(
            children: [

              const SizedBox(height: 15),

              /// Profile Image
              Stack(
                clipBehavior: Clip.none,
                children: [

                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.12),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ],
                    ),
                  ),

                  Positioned(
                    bottom: -5,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: const Color(0xff8B5CF6),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 35),

               Container(
                  padding: const EdgeInsets.symmetric(vertical: 13,horizontal: 13),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),

                  child: Column(
                    children: [
                      //name
                      Container(
                        width: double.infinity,

                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                        decoration: BoxDecoration(
                            color: const Color(0xffF6F6F6),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color(0xffC7C7C7)
                            )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Full Name",
                              style:  GoogleFonts.poppins(
                                fontSize: 12,
                                color: Color(0xFF707070),
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                            TextField(
                              controller: nameController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style:  GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              decoration:  InputDecoration(
                                isDense: true,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                                hintText: '',
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff1B1A1A),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),
                      //phone number
                      Container(
                        width: double.infinity,

                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                        decoration: BoxDecoration(
                            color: const Color(0xffF6F6F6),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color(0xffC7C7C7)
                            )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Phone Number",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Color(0xFF707070),
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                            TextField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style:  GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              decoration:  InputDecoration(
                                isDense: true,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                                hintText: '',
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff1B1A1A),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),
                      //Date+gender
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,

                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                              decoration: BoxDecoration(
                                  color: const Color(0xffF6F6F6),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Color(0xffC7C7C7)
                                  )
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Date of Birth",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Color(0xFF707070),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),

                                  TextField(
                                    controller: dobController,
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    style:  GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                    decoration:  InputDecoration(
                                      isDense: true,
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.zero,
                                      hintText: '',
                                      hintStyle: GoogleFonts.poppins(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xff1B1A1A),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child:Container(
                              width: double.infinity,

                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                              decoration: BoxDecoration(
                                  color: const Color(0xffF6F6F6),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Color(0xffC7C7C7)
                                  )
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Gender",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Color(0xFF707070),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),

                                  TextField(
                                    controller: genderController,
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    style:  GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                    decoration:  InputDecoration(
                                      isDense: true,
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.zero,
                                      hintText: '',
                                      hintStyle: GoogleFonts.poppins(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xff1B1A1A),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),
                      //city+Pin
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                            decoration: BoxDecoration(
                                color: const Color(0xffF6F6F6),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color(0xffC7C7C7)
                                )
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "City",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: Color(0xFF707070),
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),

                                      TextField(
                                        controller: cityController,
                                        keyboardType: TextInputType.phone,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                          isDense: true,
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.zero,
                                          hintText: '',
                                          hintStyle: GoogleFonts.poppins(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800,
                                            color: Color(0xff1B1A1A),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 22), // pushes icon down to line up with TextField
                                  child: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Color(0xff707070),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            width: double.infinity,

                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                            decoration: BoxDecoration(
                                color: const Color(0xffF6F6F6),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color(0xffC7C7C7)
                                )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "PIN Code",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Color(0xFF707070),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),

                                TextField(
                                  controller: pinController,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  style:  GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  decoration:  InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    hintText: '',
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xff1B1A1A),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),


                      //State
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                        decoration: BoxDecoration(
                            color: const Color(0xffF6F6F6),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color(0xffC7C7C7)
                            )
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "State",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Color(0xFF707070),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),

                                  TextField(
                                    controller: stateController,
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.zero,
                                      hintText: '',
                                      hintStyle: GoogleFonts.poppins(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xff1B1A1A),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 22), // pushes icon down to line up with TextField
                              child: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff707070),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),
                      //address
                      Container(
                        width: double.infinity,

                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                        decoration: BoxDecoration(
                            color: const Color(0xffF6F6F6),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color(0xffC7C7C7)
                            )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Address",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Color(0xFF707070),
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                            TextField(
                              controller: addressController,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style:  GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              decoration:  InputDecoration(
                                isDense: true,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                                hintText: '',
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff1B1A1A),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


              const SizedBox(height: 50),


              //Button
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
                    "Save details",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),


              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }


}