import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newappui_8/contoller/whislist_controller.dart';
import 'package:newappui_8/utilis/colors.dart';
import 'package:newappui_8/view/recentsearch_screen.dart';
import 'package:newappui_8/widgets/gridviewbuilder.dart';

class WishlistScreen extends StatelessWidget {
  WishlistScreen({super.key});

  final WishlistController _wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.03, horizontal: width * 0.05),
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
                      "My Wishlist",
                      style: TextStyle(
                        fontSize: height * 0.025,
                        fontWeight: FontWeight.w600,
                        color: Appcolors().titletextcolor,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const SearchScreen());
                      },
                      child: const Icon(Icons.search),
                    ),
                  ],
                ),
              ),
              Obx(
                () {
                  log('Wishlist UI updated: ${_wishlistController.wishList.length} items');
                  return _wishlistController.wishList.isEmpty
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          height: height * 4,
                          width: width,
                          child: Mygrid3(
                            filteredProducts: _wishlistController.wishList,
                          ),
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
