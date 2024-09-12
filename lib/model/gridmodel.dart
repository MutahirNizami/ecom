// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Gridmodel {
  final Icon? icon;
  final String image;
  final String text;

  const Gridmodel({
    this.icon,
    required this.image,
    required this.text,
  });
}

List<Gridmodel> gridlist = [
  const Gridmodel(image: "assets/images/buds.png", text: "Buds"),
  const Gridmodel(image: "assets/images/shirt.png", text: "Shirts"),
  const Gridmodel(image: "assets/images/watch.png", text: "Tv's"),
  const Gridmodel(image: "assets/images/tv.png", text: "Watchs"),
  const Gridmodel(image: "assets/images/shirt.png", text: "Shirts"),
  const Gridmodel(image: "assets/images/phone.png", text: "i-Phone"),
];

class ProductModel {
  final String image;
  final String title;
  final String? subtitle;
  const ProductModel({
    required this.image,
    required this.title,
    this.subtitle,
  });
}

List<ProductModel> productlist = [
  const ProductModel(
      image: "assets/images/buds.png",
      title: "Apple pro buds",
      subtitle: "NGN 646,000"),
  const ProductModel(
    image: "assets/images/shirt.png",
    title: "Balenciaga T-shirt M..",
    subtitle: "NGN 46,000",
  ),
  const ProductModel(
      image: "assets/images/tv.png",
      title: "Tcl TV's",
      subtitle: "NGN 646,000"),
  const ProductModel(
      image: "assets/images/watch.png",
      title: "Rado watch's",
      subtitle: "NGN 646,000"),
  const ProductModel(
      image: "assets/images/phone.png",
      title: "iPhone 13 pro",
      subtitle: "NGN 646,000"),
  const ProductModel(
      image: "assets/images/sneakershoe.png",
      title: "Converse Chuck Tay...",
      subtitle: "NGN 21,600"),
  const ProductModel(
      image: "assets/images/splitphone.png",
      title: "Converse Chuck Tay...",
      subtitle: "NGN 21,600"),
  const ProductModel(
      image: "assets/images/shoe.png",
      title: "Adidas core sneakers..",
      subtitle: "NGN 46,000"),
  const ProductModel(
      image: "assets/images/bluttoth.png",
      title: "Blutooth earing.....",
      subtitle: "NGN 46,000"),
];

class SearchModel {
  final String text;
  final IconData icon;
  const SearchModel({
    required this.text,
    required this.icon,
  });
}

// ignore: non_constant_identifier_names
List<SearchModel> Searchlist = [
  const SearchModel(text: "iPhone 13 pro", icon: Icons.cancel_outlined),
  const SearchModel(text: "iPhone 13 pro", icon: Icons.cancel_outlined),
  const SearchModel(text: "iPhone 13 pro", icon: Icons.cancel_outlined),
  const SearchModel(text: "iPhone 13 pro", icon: Icons.cancel_outlined),
  const SearchModel(text: "iPhone 13 pro", icon: Icons.cancel_outlined),
  const SearchModel(text: "iPhone 13 pro", icon: Icons.cancel_outlined),
  const SearchModel(text: "iPhone 13 pro", icon: Icons.cancel_outlined),
  const SearchModel(text: "iPhone 13 pro", icon: Icons.cancel_outlined),
  const SearchModel(text: "iPhone 13 pro", icon: Icons.cancel_outlined),
  const SearchModel(text: "iPhone 13 pro", icon: Icons.cancel_outlined),
  const SearchModel(text: "iPhone 13 pro", icon: Icons.cancel_outlined),
  const SearchModel(text: "iPhone 13 pro", icon: Icons.cancel_outlined),
  const SearchModel(text: "iPhone 13 pro", icon: Icons.cancel_outlined),
  const SearchModel(text: "iPhone 13 pro", icon: Icons.cancel_outlined),
  const SearchModel(text: "iPhone 13 pro", icon: Icons.cancel_outlined),
  const SearchModel(text: "iPhone 13 pro", icon: Icons.cancel_outlined),
  const SearchModel(text: "iPhone 13 pro", icon: Icons.cancel_outlined),
  const SearchModel(text: "iPhone 13 pro", icon: Icons.cancel_outlined),
  const SearchModel(text: "iPhone 13 pro", icon: Icons.cancel_outlined),
  const SearchModel(text: "iPhone 13 pro", icon: Icons.cancel_outlined),
  const SearchModel(text: "iPhone 13 pro", icon: Icons.cancel_outlined),
];

// craiusal slider.......................................

class SliderModel {
  final String image;
  const SliderModel({
    required this.image,
  });
}

// ignore: non_constant_identifier_names
List<SliderModel> Sliderlist = [
  const SliderModel(image: "assets/images/men.png"),
  const SliderModel(image: "assets/images/men.png"),
  const SliderModel(image: "assets/images/men.png"),
];

// color panel list

class ColorModel {
  final Color color;
  final Color? bordercolor;
  const ColorModel({
    required this.color,
    this.bordercolor,
  });
}

// ignore: non_constant_identifier_names
List<dynamic> Clist = [
  const ColorModel(
    color: Color(0xffF23737),
  ),
  const ColorModel(
    color: Color(0xff222222),
  ),
  const ColorModel(
    color: Color(0xffF1F1F1),
  ),
  const ColorModel(
    color: Color(0xffEDB82D),
  ),
  const ColorModel(
    color: Color(0xff50555C),
  ),
  const ColorModel(
    color: Color.fromARGB(255, 149, 92, 185),
  ),
  const ColorModel(
    color: Color.fromARGB(255, 103, 13, 163),
  ),
  const ColorModel(
    color: Color.fromARGB(255, 6, 145, 48),
  ),
];

class MycartModel {
  final String image;
  final String name;
  final String price;

  const MycartModel({
    required this.image,
    required this.name,
    required this.price,
  });
}

List<MycartModel> mycartlist = [
  const MycartModel(
    image: "assets/images/mycartimages/iphone.png",
    name: "iPhone 13 pro",
    price: "NGN 646,000",
  ),
  const MycartModel(
    image: "assets/images/mycartimages/applewatch.png",
    name: "Oraimo smartwatch",
    price: "NGN 16,400",
  ),
  const MycartModel(
    image: "assets/images/mycartimages/apple9pro.png",
    name: "Apple watch",
    price: "NGN 225,000",
  ),
  const MycartModel(
    image: "assets/images/mycartimages/blutooth.png",
    name: "Oraimo headset",
    price: "NGN 255,000",
  ),
  const MycartModel(
    image: "assets/images/mycartimages/macbook.png",
    name: "Macbook pro M1",
    price: "NGN965,000",
  ),
];
