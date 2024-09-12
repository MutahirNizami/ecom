import 'package:flutter/material.dart';

import 'package:newappui_8/model/Apimodel.dart';

import 'package:newappui_8/utilis/colors.dart';

import 'package:newappui_8/view/payementmethod.dart';
import 'package:newappui_8/widgets/button.dart';

class ProductDetailsPage extends StatefulWidget {
  final ApiModel product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image......................................
              SizedBox(height: height * 0.01),
              Center(
                child: Image.network(
                  widget.product.image,
                  height: height * 0.3,
                  fit: BoxFit.contain,
                ),
              ),

              // Product Title............................
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                child: Text(
                  widget.product.title,
                  style: TextStyle(
                    fontSize: height * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Product Price and Pay Now Button..................................
              SizedBox(
                height: height * 0.06,
                width: width * 0.53,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.product.price}",
                      style: TextStyle(
                        fontSize: height * 0.03,
                        color: Appcolors().priceColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Appbutton(
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PayementmethodScreen(),
                          ),
                        );
                      },
                      text: "Pay Now",
                      btncolor: Appcolors().heartcolor,
                      btnheight: height * 0.05,
                      btnwidth: width * 0.3,
                    )
                  ],
                ),
              ),

              // Product Category.......................................
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                child: Text(
                  "Category: ${widget.product.category}",
                  style: TextStyle(
                    fontSize: height * 0.025,
                    color: Appcolors().subtitlecolor,
                  ),
                ),
              ),

              // Product Description................................
              Text(
                "Description",
                style: TextStyle(
                  fontSize: height * 0.025,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                child: Text(
                  widget.product.description,
                  style: TextStyle(
                    fontSize: height * 0.02,
                  ),
                ),
              ),

              // Product Rating.....................................
              Row(
                children: [
                  Icon(Icons.star_rate_rounded,
                      color: Appcolors().rattingiconcolor),
                  const SizedBox(width: 4.0),
                  Text(
                    "${widget.product.rating.rate} (${widget.product.rating.count} reviews)",
                    style: TextStyle(
                      fontSize: height * 0.02,
                      color: Appcolors().subtitlecolor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
