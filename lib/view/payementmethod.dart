import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newappui_8/widgets/button.dart';
import 'package:newappui_8/utilis/colors.dart';
import 'package:newappui_8/view/Awosome_screen.dart';

class PayementmethodScreen extends StatelessWidget {
  const PayementmethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.04, horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Get.back();
                  },
                ),
                SizedBox(
                  width: width * 0.2,
                ),
                Text(
                  "Payement Method",
                  style: TextStyle(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w600,
                      color: Appcolors().titletextcolor),
                ),
              ],
            ),
            Divider(
              thickness: height * 0.002,
              color: const Color(0xffF1F1F1),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.02),
              child: Text(
                "Pick a payment option",
                style: TextStyle(
                    fontSize: height * 0.017, color: Appcolors().subtitlecolor),
              ),
            ),
            //1st button..................
            Appbutton(
              ontap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.04, horizontal: width * 0.1),
                        child: SizedBox(
                          height: height * 0.35,
                          width: width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Password",
                                    style: TextStyle(
                                        fontSize: height * 0.03,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "Enter your password\nto complete payment.",
                                    style: TextStyle(
                                        fontSize: height * 0.015,
                                        fontWeight: FontWeight.w500,
                                        color: Appcolors().subtitlecolor),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Password",
                                    style: TextStyle(
                                        fontSize: height * 0.018,
                                        fontWeight: FontWeight.w600,
                                        color: Appcolors().titletextcolor),
                                  ),
                                  // textformfield.............................
                                  Container(
                                    height: height * 0.06,
                                    width: width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            height * 0.017),
                                        color: const Color.fromARGB(
                                            255, 229, 235, 241)),
                                    child: Center(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              bottom: height * 0.04,
                                              left: width * 0.02),
                                          hintText: "Enter password",
                                          hintStyle: TextStyle(
                                              fontSize: height * 0.02,
                                              color: Appcolors()
                                                  .subtitlecolor
                                                  .withOpacity(0.75)),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                height * 0.03),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  Appbutton(
                                    btnheight: height * 0.06,
                                    btnwidth: width,
                                    ontap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const AwosomeScreen(),
                                          ));
                                    },
                                    text: "Continue",
                                    fontSize: height * 0.02,
                                    fontWeight: FontWeight.bold,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              text: "Pay using Card",
              fontSize: height * 0.025,
              btncolor: Appcolors().titletextcolor,
              btnheight: height * 0.07,
              btnwidth: width,
              borderradius: height * 0.02,
            ),
            //2nd button.................
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.03),
              child: Appbutton(
                ontap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.04, horizontal: width * 0.1),
                          child: SizedBox(
                            height: height * 0.35,
                            width: width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Password",
                                      style: TextStyle(
                                          fontSize: height * 0.03,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Enter your password\nto complete payment.",
                                      style: TextStyle(
                                          fontSize: height * 0.015,
                                          fontWeight: FontWeight.w500,
                                          color: Appcolors().subtitlecolor),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Password",
                                      style: TextStyle(
                                          fontSize: height * 0.018,
                                          fontWeight: FontWeight.w600,
                                          color: Appcolors().titletextcolor),
                                    ),
                                    // textformfield.............................
                                    Container(
                                      height: height * 0.06,
                                      width: width,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              height * 0.017),
                                          color: const Color.fromARGB(
                                              255, 229, 235, 241)),
                                      child: Center(
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                bottom: height * 0.038,
                                                left: width * 0.02),
                                            hintText: "Enter password",
                                            hintStyle: TextStyle(
                                                fontSize: height * 0.02,
                                                color: Appcolors()
                                                    .subtitlecolor
                                                    .withOpacity(0.75)),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      height * 0.03),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    Appbutton(
                                      btnheight: height * 0.06,
                                      btnwidth: width,
                                      ontap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const AwosomeScreen(),
                                            ));
                                      },
                                      text: "Continue",
                                      fontSize: height * 0.02,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                text: "Pay using Bank transfer",
                fontSize: height * 0.025,
                btncolor: const Color(0xffE34899),
                btnheight: height * 0.07,
                btnwidth: width,
                borderradius: height * 0.02,
              ),
            ),
            //3rdbutton..................
            Appbutton(
              ontap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.04, horizontal: width * 0.1),
                        child: SizedBox(
                          height: height * 0.35,
                          width: width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Password",
                                    style: TextStyle(
                                        fontSize: height * 0.03,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "Enter your password\nto complete payment.",
                                    style: TextStyle(
                                        fontSize: height * 0.015,
                                        fontWeight: FontWeight.w500,
                                        color: Appcolors().subtitlecolor),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Password",
                                    style: TextStyle(
                                        fontSize: height * 0.018,
                                        fontWeight: FontWeight.w600,
                                        color: Appcolors().titletextcolor),
                                  ),
                                  // textformfield.............................
                                  Container(
                                    height: height * 0.06,
                                    width: width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            height * 0.017),
                                        color: const Color.fromARGB(
                                            255, 229, 235, 241)),
                                    child: Center(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              bottom: height * 0.038,
                                              left: width * 0.02),
                                          hintText: "Enter password",
                                          hintStyle: TextStyle(
                                              fontSize: height * 0.02,
                                              color: Appcolors()
                                                  .subtitlecolor
                                                  .withOpacity(0.75)),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                height * 0.03),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  Appbutton(
                                    btnheight: height * 0.06,
                                    btnwidth: width,
                                    ontap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const AwosomeScreen(),
                                          ));
                                    },
                                    text: "Continue",
                                    fontSize: height * 0.02,
                                    fontWeight: FontWeight.bold,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              text: "Buy now, pay later",
              fontSize: height * 0.025,
              btncolor: const Color(0xff7900DB),
              btnheight: height * 0.07,
              btnwidth: width,
              borderradius: height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
