import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newappui_8/contoller/cartcontroller.dart';
import 'package:newappui_8/router/dashboard.dart';
import 'package:newappui_8/utilis/colors.dart';
import 'package:newappui_8/view/checkout_screen.dart';
import 'package:newappui_8/view/ecom_product.dart';
import 'package:newappui_8/view/recentsearch_screen.dart';
import 'package:newappui_8/widgets/button.dart';

class MycartScreen extends StatefulWidget {
  const MycartScreen({super.key});

  @override
  State<MycartScreen> createState() => _MycartScreenState();
}

class _MycartScreenState extends State<MycartScreen> {
  final CartlistController _cartlistController = Get.put(CartlistController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Header with "My Cart" and Search Icon
          Padding(
            padding: EdgeInsets.only(
                top: height * 0.05, right: width * 0.05, left: width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DashboardScreen(),
                          ));
                    },
                    child: Icon(Icons.arrow_back)),
                Text(
                  "My Cart",
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

          // Cart Items List

          GetBuilder(
              init: CartlistController(),
              id: 0,
              builder: (context) {
                return Expanded(
                  child: _cartlistController.cartList.isEmpty
                      ? Center(
                          child: Text(
                            "Your cart is empty",
                            style: TextStyle(
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.w500,
                              color: Appcolors().subtitlecolor,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: _cartlistController.cartList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.05,
                                  vertical: height * 0.01),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Product Image
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        margin: EdgeInsets.only(
                                            right: width * 0.02),
                                        height: height * 0.1,
                                        width: width * 0.2,
                                        decoration: BoxDecoration(
                                          color: Appcolors().contianercolor,
                                          borderRadius: BorderRadius.circular(
                                              height * 0.01),
                                        ),
                                        child: Image.network(
                                          _cartlistController
                                              .cartList[index].image,
                                          fit: BoxFit.contain,
                                        ),
                                      ),

                                      // Product Name and Price
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: width * 0.4,
                                            child: Text(
                                              _cartlistController
                                                  .cartList[index].title,
                                              style: TextStyle(
                                                fontSize: height * 0.02,
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    Appcolors().subtitlecolor,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                            ),
                                          ),
                                          Text(
                                            "NGN${_cartlistController.cartList[index].price.toStringAsFixed(2)}",
                                            style: TextStyle(
                                              fontSize: height * 0.02,
                                              fontWeight: FontWeight.w600,
                                              color: Appcolors().titletextcolor,
                                            ),
                                          ),
                                        ],
                                      ),

                                      // Quantity Control and Delete Button
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          // Delete Icon
                                          IconButton(
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Color(0xffD1D5DB),
                                            ),
                                            onPressed: () {
                                              _cartlistController
                                                  .removeFromCart(
                                                      _cartlistController
                                                          .cartList[index]);
                                            },
                                          ),
                                          // Quantity Selector
                                          Container(
                                            height: height * 0.045,
                                            width: width * 0.22,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      height * 0.01),
                                              border: Border.all(
                                                  color: Appcolors()
                                                      .titletextcolor),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    _cartlistController
                                                        .decrementQty(index);
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    size: height * 0.025,
                                                  ),
                                                ),
                                                Text(
                                                  '${_cartlistController.cartList[index].items}',
                                                  style: TextStyle(
                                                    fontSize: height * 0.02,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    _cartlistController
                                                        .incrementQty(index);
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    size: height * 0.025,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Divider(color: Color(0xffF1F1F1)),
                                ],
                              ),
                            );
                          },
                        ),
                );
              }),

          // Total Price and Checkout Button
          GetBuilder(
            init: CartlistController(),
            id: 0,
            builder: (context) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                height: height * 0.09,
                width: width,
                decoration: BoxDecoration(color: Appcolors().contianercolor),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Total Price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total price",
                            style: TextStyle(
                              fontSize: height * 0.015,
                              fontWeight: FontWeight.w500,
                              color: Appcolors().subtitlecolor,
                            ),
                          ),
                          Text(
                            "NGN${_cartlistController.subtotal.value.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.w700,
                              color: Appcolors().titletextcolor,
                            ),
                          ),
                        ],
                      ),

                      // Checkout Button
                      Appbutton(
                        ontap: () {
                          Get.to(const CheckoutScreen());
                        },
                        text: "Checkout",
                        fontSize: height * 0.018,
                        fontWeight: FontWeight.w700,
                        borderradius: height * 0.02,
                        btnheight: height * 0.06,
                        btnwidth: width * 0.4,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
