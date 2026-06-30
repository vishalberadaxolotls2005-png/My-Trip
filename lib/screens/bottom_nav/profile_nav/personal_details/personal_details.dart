import 'package:flutter/material.dart';

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
        title: const Text(
          "Personal Details",
          style: TextStyle(
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

                      customTextField(
                        label: "Full Name",
                        controller: nameController,
                      ),

                      const SizedBox(height: 10),

                      customTextField(
                        label: "Phone Number",
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                      ),

                      const SizedBox(height: 10),

                      Row(
                        children: [
                          Expanded(
                            child: customTextField(
                              label: "Date of Birth",
                              controller: dobController,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: customTextField(
                              label: "Gender",
                              controller: genderController,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: customTextField(
                            label: "City",
                            controller: cityController,
                            readOnly: true,
                            suffixIcon: const Icon(Icons.keyboard_arrow_down),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: customTextField(
                            label: "PIN Code",
                            controller: pinController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),

                      const SizedBox(height: 10),
                      customTextField(
                        label: "State",
                        controller: stateController,
                        readOnly: true,
                        suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      ),

                      const SizedBox(height: 10),

                      customTextField(
                        label: "Address",
                        controller: addressController,
                      ),
                    ],
                  ),
                ),


              const SizedBox(height: 50),

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
                    style: TextStyle(
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

  Widget customTextField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    bool readOnly = false,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Color(0xff2E2E2E),
      ),
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: const TextStyle(
          fontSize: 14,
          color: Color(0xff707070),
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: const Color(0xffF7F7F7),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 18,
        ),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xff8B5CF6),
            width: 1.3,
          ),
        ),
      ),
    );
  }
}