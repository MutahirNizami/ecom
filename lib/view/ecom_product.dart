import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:newappui_8/contoller/cartcontroller.dart';
import 'package:newappui_8/contoller/product_controller.dart';

import 'package:newappui_8/model/gridmodel.dart';
import 'package:newappui_8/utilis/craiusolslidermodel_lists.dart';
import 'package:newappui_8/utilis/colors.dart';
import 'package:newappui_8/view/Accountdetail/login_screen.dart';

import 'package:newappui_8/view/Mycart_screen.dart';
import 'package:newappui_8/view/Wishlist_Screen.dart';

import 'package:newappui_8/widgets/gridviewbuilder.dart';

// ecom classsssssssssssss....................................
class EcomProductScreen extends StatelessWidget {
  EcomProductScreen({super.key});

  final ProductController productController = Get.put(ProductController());
  final CartlistController cartlistController = Get.put(CartlistController());

  Future<bool> _signOut() async {
    await FirebaseAuth.instance.signOut();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.03, horizontal: width * 0.04),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "E-shop",
                        style: TextStyle(
                            fontSize: height * 0.035,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "5,000+ products and categories.",
                        style: TextStyle(
                            fontSize: height * 0.02,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const MycartScreen();
                        },
                      ));
                    },
                    child: const Icon(Icons.shopping_cart_rounded),
                  ),
                  SizedBox(width: width * 0.03),
                  InkWell(
                    onTap: () {
                      Get.to(() => const WishlistScreen());
                    },
                    child: Icon(
                      Icons.favorite,
                      color: Appcolors().heartcolor,
                    ),
                  ),
                  SizedBox(width: width * 0.03),
                  InkWell(
                    onTap: () {
                      _signOut().then((value) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      });
                    },
                    child: const Icon(Icons.logout_outlined),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.05, bottom: height * 0.02),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: height * 0.05,
                        decoration: BoxDecoration(
                          color: Appcolors().contianercolor,
                          borderRadius: BorderRadius.circular(height * 0.01),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Search products, brands...",
                            hintStyle: TextStyle(
                              color:
                                  Appcolors().subtitlecolor.withOpacity(0.75),
                              fontSize: height * 0.02,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color:
                                  Appcolors().subtitlecolor.withOpacity(0.75),
                              size: height * 0.025,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(height * 0.03),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.04),
                    Image.asset(
                      "assets/images/sliders.png",
                      width: width * 0.07,
                    ),
                  ],
                ),
              ),

              //catogary builder..................
              Obx(() {
                return SizedBox(
                  height: height * 0.2,
                  width: width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productController.categoryList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          productController.selectedCategoryIndex.value = index;
                          productController.filterProducts(
                              productController.categoryList[index]);
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.04),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.02,
                                    horizontal: width * 0.03),
                                height: height * 0.11,
                                width: width * 0.21,
                                decoration: BoxDecoration(
                                  color: Appcolors().contianercolor,
                                  borderRadius:
                                      BorderRadius.circular(height * 0.02),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Appcolors().titletextcolor,
                                      offset: const Offset(0.5, 1.5),
                                      spreadRadius: height * 0.003,
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  gridlist[index].image,
                                  height: height * 0.2,
                                  width: width * 0.1,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(height: height * 0.02),
                              Text(productController.categoryList[index]),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
              SizedBox(height: height * 0.02),
              SizedBox(
                width: width * 2,
                height: height * 0.27,
                child: const CraiusolsliderScreen(),
              ),
              Obx(() {
                return productController.filteredProductList.isEmpty
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        height: height * 3.5,
                        width: width,
                        child: Mygrid2(
                          productList: productController.filteredProductList,
                        ),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
