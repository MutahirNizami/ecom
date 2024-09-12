import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:newappui_8/model/gridmodel.dart';
import 'package:newappui_8/view/Mycart_screen.dart';
import 'package:newappui_8/view/recentsearch_screen.dart';
import 'package:newappui_8/widgets/button.dart';
import 'package:newappui_8/utilis/colors.dart';

import 'package:newappui_8/view/payementmethod.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _counter = 0;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.02, horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back)),
                    Text(
                      "checkout",
                      style: TextStyle(
                          fontSize: height * 0.025,
                          fontWeight: FontWeight.w600,
                          color: Appcolors().titletextcolor),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const SearchScreen());
                      },
                      child: const Icon(Icons.search),
                    ),
                  ],
                ),
              ),
              Divider(
                color: const Color(0xffF1F1F1),
                thickness: height * 0.002,
              ),
              Text(
                "Shipping address",
                style: TextStyle(
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.w500,
                    color: Appcolors().subtitlecolor),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: height * 0.06,
                      width: width * 0.1,
                      decoration: const BoxDecoration(
                          color: Color(0xffD2E4FF), shape: BoxShape.circle),
                      child: Icon(
                        Icons.edit_location,
                        size: height * 0.04,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Home",
                          style: TextStyle(
                              fontSize: height * 0.025,
                              fontWeight: FontWeight.w600,
                              color: Appcolors().titletextcolor),
                        ),
                        Text(
                          "No 46, Awolowo Road....",
                          style: TextStyle(
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.w500,
                              color: Appcolors().subtitlecolor),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: width * 0.2,
                    ),
                    Icon(
                      Icons.edit,
                      size: height * 0.04,
                    )
                  ],
                ),
              ),
              Text(
                "Order list",
                style: TextStyle(
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.w500,
                    color: Appcolors().subtitlecolor),
              ),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: mycartlist.length,
              //     itemBuilder: (context, index) {
              //       return Column(
              //         children: [
              //           Padding(
              //               padding: EdgeInsets.only(
              //                   top: height * 0.02, bottom: height * 0.01),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Container(
              //                       height: height * 0.1,
              //                       width: width * 0.21,
              //                       decoration: BoxDecoration(
              //                           color: Appcolors().contianercolor,
              //                           borderRadius: BorderRadius.circular(
              //                               height * 0.01)),
              //                       child: Image.asset(
              //                           mycartlist[index].image.toString())),
              //                   Column(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceEvenly,
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       Text(
              //                         mycartlist[index].name.toString(),
              //                         style: TextStyle(
              //                             fontSize: height * 0.02,
              //                             fontWeight: FontWeight.w500,
              //                             color: Appcolors().subtitlecolor),
              //                       ),
              //                       Text(
              //                         mycartlist[index].price.toString(),
              //                         style: TextStyle(
              //                             fontSize: height * 0.025,
              //                             fontWeight: FontWeight.w600,
              //                             color: Appcolors().titletextcolor),
              //                       )
              //                     ],
              //                   ),
              //                   Column(
              //                     crossAxisAlignment: CrossAxisAlignment.end,
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceEvenly,
              //                     children: [
              //                       const Icon(
              //                         Icons.delete,
              //                         color: Color(0xffD1D5DB),
              //                       ),
              //                       //counter countainer...................................

              //                       Container(
              //                         height: height * 0.045,
              //                         width: width * 0.22,
              //                         decoration: BoxDecoration(
              //                             borderRadius: BorderRadius.circular(
              //                                 height * 0.01),
              //                             border: Border.all(
              //                                 color:
              //                                     Appcolors().titletextcolor)),
              //                         child: Row(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.spaceEvenly,
              //                           children: [
              //                             InkWell(
              //                                 onTap: decrementCounter,
              //                                 child: Icon(
              //                                   Icons.remove,
              //                                   size: height * 0.025,
              //                                 )),

              //                             // number's container
              //                             Container(
              //                               color: const Color(0xffD1D5DB),
              //                               child: Text(
              //                                 "$_counter",
              //                                 style: TextStyle(
              //                                   fontSize: height * 0.02,
              //                                   fontWeight: FontWeight.bold,
              //                                 ),
              //                               ),
              //                             ),

              //                             InkWell(
              //                               onTap: incrementCounter,
              //                               child: Icon(
              //                                 Icons.add,
              //                                 size: height * 0.025,
              //                               ),
              //                             )
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               )),
              //           const Divider(
              //             color: Color(0xffF1F1F1),
              //           ),
              //         ],
              //       );
              //     },
              //   ),
              // ),

              // Flexible(child: MycartScreen()),

              Container(
                height: height * 0.08,
                width: width,
                color: Appcolors().contianercolor,
                child: Center(
                  child: Appbutton(
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PayementmethodScreen(),
                          ));
                    },
                    text: "Continue to payment",
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.w700,
                    borderradius: height * 0.02,
                    btnheight: height * 0.07,
                    btnwidth: width * 0.9,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
