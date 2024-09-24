import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newappui_8/contoller/cartcontroller.dart';
import 'package:newappui_8/model/Apimodel.dart';

import 'package:newappui_8/utilis/colors.dart';

import 'package:newappui_8/view/product_detials_screen.dart';

// product gridview builder............................

import 'package:newappui_8/contoller/whislist_controller.dart';
import 'package:newappui_8/widgets/button.dart';

class Mygrid2 extends StatelessWidget {
  final List<ApiModel> productList;

  Mygrid2({super.key, required this.productList});

  final WishlistController _wishlistController = Get.put(WishlistController());
  final CartlistController _cartlistController = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4, // Adjust this value to fit the content
      ),
      itemBuilder: (context, index) {
        final model = productList[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsPage(
                  product: model,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Appcolors().contianercolor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Image.network(
                            model.image.toString(),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 7,
                        child: Obx(() {
                          // Ensure wishlist state is accurate
                          bool isInWishlist =
                              _wishlistController.isInWishList(model);
                          return IconButton(
                            icon: Icon(
                              isInWishlist
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: isInWishlist
                                  ? Appcolors().heartcolor
                                  : Appcolors().subtitlecolor,
                            ),
                            onPressed: () {
                              if (isInWishlist) {
                                _wishlistController.removeFromWishList(model);
                              } else {
                                _wishlistController.addToWishList(model);
                              }
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.02),
                child: Appbutton(
                  ontap: () {
                    // Manage cart state
                    if (_cartlistController.isInCart(model)) {
                    } else {
                      _cartlistController.addToCart(model);
                    }
                  },
                  text: 'Add to cart',
                  btnwidth: width * 0.3,
                  btnheight: height * 0.04,
                  fontSize: height * 0.022,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Text(
                  model.title.toString(),
                  style: TextStyle(
                    fontSize: height * 0.02,
                    color: Appcolors().titletextcolor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "\$${model.price.toString()}",
                  style: TextStyle(
                    fontSize: height * 0.02,
                    color: Appcolors().subtitlecolor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// wishlist products....................................
// class Mygrid3 extends StatelessWidget {
//   const Mygrid3({super.key, required filteredProducts});

//   @override
//   Widget build(BuildContext context) {
//     final WishlistController wishlistController = Get.find();
//     final isFavorite = wishlistController.wishList.contains(wishlistController);

//     return Obx(() {
//       if (wishlistController.wishList.isEmpty) {
//         return const Center(child: Text("No items in wishlist"));
//       }
//       return GridView.builder(
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: wishlistController.wishList.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, mainAxisSpacing: 1, childAspectRatio: 3 / 4),
//         itemBuilder: (context, index) {
//           final model = wishlistController.wishList[index];
//           return GestureDetector(
//             onTap: () {
//               Get.to(ProductDetailsPage(product: model));
//             },
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Center(
//                       child: Stack(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(16),
//                         decoration: BoxDecoration(
//                           color: Appcolors().contianercolor,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Image.network(
//                           model.image.toString(),
//                         ),
//                       ),
//                       Positioned(
//                         top: 10,
//                         right: 7,
//                         child: IconButton(
//                           icon: Icon(
//                             Icons.favorite,
//                             color: Appcolors().heartcolor,
//                           ),
//                           onPressed: () {
//                             if (isFavorite) {
//                               (wishlistController.addToWishList(model));
//                             } else {
//                               wishlistController.removeFromWishList(model);
//                             }
//                           },
//                         ),
//                       )
//                     ],
//                   )),
//                 ),
//                 Text(
//                   model.title.toString(),
//                   style: TextStyle(color: Appcolors().titletextcolor),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   softWrap: true,
//                 ),
//                 Text(
//                   model.price.toString(),
//                   style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 14,
//                       color: Appcolors().subtitlecolor),
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     });
//   }
// }

class Mygrid3 extends StatelessWidget {
  const Mygrid3({super.key, required this.filteredProducts});

  final List<ApiModel> filteredProducts;

  @override
  Widget build(BuildContext context) {
    final WishlistController wishlistController = Get.find();

    return Obx(() {
      if (wishlistController.wishList.isEmpty) {
        return const Center(child: Text("No items in wishlist"));
      }

      return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: wishlistController.wishList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          childAspectRatio: 3 / 4,
        ),
        itemBuilder: (context, index) {
          final model = wishlistController.wishList[index];
          final isFavorite = wishlistController.isInWishList(model);

          return GestureDetector(
            onTap: () {
              Get.to(ProductDetailsPage(product: model));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Appcolors().contianercolor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.network(
                            model.image.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 7,
                          child: IconButton(
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite
                                  ? Colors.red
                                  : Appcolors().heartcolor,
                            ),
                            onPressed: () {
                              if (isFavorite) {
                                wishlistController.removeFromWishList(model);
                              } else {
                                wishlistController.addToWishList(model);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  model.title.toString(),
                  style: TextStyle(color: Appcolors().titletextcolor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
                Text(
                  "\$${model.price.toString()}",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Appcolors().subtitlecolor,
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
