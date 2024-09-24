import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newappui_8/model/Apimodel.dart';
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
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.02, horizontal: width * 0.04),
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
                    child: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    "Checkout",
                    style: TextStyle(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.w600,
                      color: Appcolors().titletextcolor,
                    ),
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
              color: Appcolors().contianercolor,
              thickness: height * 0.002,
            ),
            Text(
              "Shipping address",
              style: TextStyle(
                fontSize: height * 0.02,
                fontWeight: FontWeight.w500,
                color: Appcolors().subtitlecolor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: height * 0.06,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                      color: Appcolors().white,
                      shape: BoxShape.circle,
                    ),
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
                          color: Appcolors().titletextcolor,
                        ),
                      ),
                      Text(
                        "No 46, Awolowo Road....",
                        style: TextStyle(
                          fontSize: height * 0.02,
                          fontWeight: FontWeight.w500,
                          color: Appcolors().subtitlecolor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width * 0.2,
                  ),
                  Icon(
                    Icons.edit,
                    size: height * 0.04,
                  ),
                ],
              ),
            ),
            Text(
              "Order list",
              style: TextStyle(
                fontSize: height * 0.02,
                fontWeight: FontWeight.w500,
                color: Appcolors().subtitlecolor,
              ),
            ),

            // StreamBuilder to display cart items
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('cart')
                    .where('userId',
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text(
                        "No items in your cart",
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                    );
                  }

                  var cartItems = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      var item = cartItems[index];
                      var product = ApiModel.fromJson(
                          item.data() as Map<String, dynamic>);

                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.02, vertical: height * 0.01),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Product Image
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: EdgeInsets.only(right: width * 0.02),
                                  height: height * 0.1,
                                  width: width * 0.2,
                                  decoration: BoxDecoration(
                                    color: Appcolors().contianercolor,
                                    borderRadius:
                                        BorderRadius.circular(height * 0.01),
                                  ),
                                  child: Image.network(
                                    product.image,
                                    fit: BoxFit.contain,
                                  ),
                                ),

                                // Product Name and Price
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: width * 0.4,
                                      child: Text(
                                        product.title,
                                        style: TextStyle(
                                          fontSize: height * 0.02,
                                          fontWeight: FontWeight.w500,
                                          color: Appcolors().subtitlecolor,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                      ),
                                    ),
                                    Text(
                                      "NGN${product.price.toStringAsFixed(2)}",
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    // Delete Icon
                                    IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Appcolors().contianercolor,
                                        size: height * 0.04,
                                      ),
                                      onPressed: () async {
                                        await FirebaseFirestore.instance
                                            .collection('cart')
                                            .doc(item.id)
                                            .delete();
                                      },
                                    ),
                                    // Quantity Selector
                                    Container(
                                      height: height * 0.045,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            height * 0.01),
                                        border: Border.all(
                                            color: Appcolors().titletextcolor),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (product.items > 1) {
                                                item.reference.update({
                                                  'items': product.items - 1,
                                                });
                                              }
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              size: height * 0.025,
                                            ),
                                          ),
                                          Text(
                                            '${product.items}',
                                            style: TextStyle(
                                              fontSize: height * 0.02,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              item.reference.update({
                                                'items': product.items + 1,
                                              });
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
                  );
                },
              ),
            ),

            // Payment Button
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
                      ),
                    );
                  },
                  text: "Continue to payment",
                  fontSize: height * 0.02,
                  fontWeight: FontWeight.w700,
                  borderradius: height * 0.02,
                  btnheight: height * 0.07,
                  btnwidth: width * 0.9,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
