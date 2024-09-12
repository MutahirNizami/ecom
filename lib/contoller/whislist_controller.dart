import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:newappui_8/model/Apimodel.dart';

class WishlistController extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  var wishList = <ApiModel>[].obs;
  var categoryList = <String>[].obs;
  var filterProductList = <ApiModel>[].obs;
  var productList = <ApiModel>[].obs;
  RxInt selected = 0.obs;

  @override
  void onInit() {
    final user = _auth.currentUser;
    if (user != null) {
      fetchWishlist(user.uid);
    }
    super.onInit();
  }

  void clearWishlist() {
    wishList.clear();
    Get.snackbar('Cleared', 'Wishlist has been cleared for the new user');
  }

  // Fetch the wishlist from Firestore for the logged-in user
  void fetchWishlist(String userId) async {
    log("Fetching wishlist for user: $userId");
    try {
      var snapshot = await _firestore
          .collection('wishlist')
          .where('userId', isEqualTo: userId)
          .get();
      wishList.clear();
      var products = snapshot.docs.map((doc) {
        var data = doc.data();
        return ApiModel.fromJson(data);
      }).toList();
      wishList.assignAll(products);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch wishlist: ${e.toString()}');
    }
  }

  // Add item to wishlist
  void addToWishList(ApiModel model) async {
    final user = _auth.currentUser;
    if (user != null) {
      if (!isInWishList(model)) {
        try {
          await _firestore.collection('wishlist').add({
            ...model.toJson(),
            'userId': user.uid, // Add userId to the wishlist item
          });
          wishList.add(model);
          Get.snackbar('Success', 'Product added to wishlist');
        } catch (e) {
          Get.snackbar(
              'Error', 'Failed to add product to wishlist: ${e.toString()}');
        }
      }
    }
  }

  // Remove item from the wishlist
  void removeFromWishList(ApiModel model) async {
    final user = _auth.currentUser;
    if (user != null) {
      try {
        var snapshot = await _firestore
            .collection('wishlist')
            .where('userId', isEqualTo: user.uid)
            .where('id', isEqualTo: model.id)
            .get();

        for (var doc in snapshot.docs) {
          await doc.reference.delete();
        }
        wishList.removeWhere((item) => item.id == model.id);
        Get.snackbar('Removed', 'Product removed from wishlist');
      } catch (e) {
        Get.snackbar(
            'Error', 'Failed to remove product from wishlist: ${e.toString()}');
      }
    }
  }

  // Filter product list for category list
  void filterProducts(String category) {
    filterProductList.clear();
    if (category == "All") {
      filterProductList.addAll(productList);
    } else {
      filterProductList
          .addAll(productList.where((product) => product.category == category));
    }
  }

  void updateSelectedIndex(int index) {
    selected.value = index;
  }

  // Check if a product is in the wishlist
  bool isInWishList(ApiModel product) {
    return wishList.any((item) => item.id == product.id);
  }
}
