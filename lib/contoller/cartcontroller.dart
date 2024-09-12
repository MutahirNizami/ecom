import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:newappui_8/model/Apimodel.dart';

class CartlistController extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  RxList<ApiModel> cartList = RxList<ApiModel>.empty();
  RxDouble subtotal = 0.0.obs;

  @override
  void onInit() {
    fetchCartList();
    super.onInit();
  }

  void clearCart() {
    cartList.clear();
    subtotal.value = 0.0;
    // Get.snackbar('Cleared', 'Cart has been cleared for the new user');
  }

  // Fetch cart list from Firestore for the logged-in user
  Future<void> fetchCartList() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        var snapshot = await _firestore
            .collection("cart")
            .where('userId', isEqualTo: user.uid)
            .get();
        var products = snapshot.docs.map((doc) {
          var data = doc.data();
          return ApiModel.fromJson(data);
        }).toList();
        cartList.assignAll(products);
        calculateTotal();
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch cart list: ${e.toString()}");
    }
  }

  // Add a product to the cart
  void addToCart(ApiModel product) async {
    final user = _auth.currentUser;
    if (user != null) {
      try {
        await _firestore.collection("cart").add({
          ...product.toJson(),
          'userId': product.userId, // Add userId to the cart item
        });
        cartList.add(product);
        calculateTotal();
        Get.snackbar("Success", "Product added to cart");
      } catch (e) {
        Get.snackbar("Error", "Failed to add product to cart: ${e.toString()}");
      }
    }
  }

  // Remove a product from the cart
  void removeFromCart(ApiModel product) async {
    final user = _auth.currentUser;
    if (user != null) {
      try {
        var snapshot = await _firestore
            .collection("cart")
            .where('userId', isEqualTo: user.uid)
            .where('id', isEqualTo: product.id)
            .get();

        for (var doc in snapshot.docs) {
          await doc.reference.delete();
        }

        cartList.remove(product);
        calculateTotal();
        Get.snackbar("Success", "Product removed from cart");
      } catch (e) {
        Get.snackbar(
            "Error", "Failed to remove product from cart: ${e.toString()}");
      }
    }
  }

  // Check if a product is in the cart
  bool isInCart(ApiModel product) {
    return cartList.any((item) => item.id == product.id);
  }

  // Check if the cart has any products
  bool checkCartHasProducts() {
    return cartList.isEmpty;
  }

  // Increment the quantity of a product in the cart
  void incrementQty(int index) {
    var product = cartList[index];
    cartList[index] = product.copyWith(
      items: product.items + 1,
    );
    update([0]);
    calculateTotal();
  }

  // Decrement the quantity of a product in the cart
  void decrementQty(int index) {
    var product = cartList[index];
    if (product.items > 1) {
      cartList[index] = product.copyWith(
        items: product.items - 1,
      );
    }
    update([0]);
    calculateTotal();
  }

  // Calculate the total price of the products in the cart
  void calculateTotal() {
    subtotal.value = 0;
    for (var product in cartList) {
      subtotal.value += product.price * product.items;
    }
  }

  void fetchCart(String uid) {}
}
