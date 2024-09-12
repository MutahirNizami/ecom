// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newappui_8/model/gridmodel.dart';

import 'package:newappui_8/widgets/button.dart';
import 'package:newappui_8/utilis/colors.dart';
import 'package:newappui_8/view/Mycart_screen.dart';

class CraiusolsliderScreen extends StatefulWidget {
  const CraiusolsliderScreen({super.key});

  @override
  State<CraiusolsliderScreen> createState() => _CraiusolsliderScreenState();
}

class _CraiusolsliderScreenState extends State<CraiusolsliderScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            // disableCenter: true,
            // aspectRatio: 16 / 9,

            height: height * 0.232,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: Sliderlist.map(
            (item) => Container(
              margin: EdgeInsets.only(top: height * 0.01),
              padding: EdgeInsets.only(
                left: width * 0.04,
                top: height * 0.01,
              ),
              height: height * 0.3,
              width: width * 0.825,
              decoration: BoxDecoration(
                color: Appcolors().contianercolor,
                borderRadius: BorderRadius.circular(height * 0.01),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "40% off",
                        style: TextStyle(
                          fontSize: height * 0.04,
                          fontWeight: FontWeight.w700,
                          color: Appcolors().titletextcolor,
                        ),
                      ),
                      Text(
                        "on select sales.",
                        style: TextStyle(
                          fontSize: height * 0.018,
                          fontWeight: FontWeight.w400,
                          color: Appcolors().subtitlecolor,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Appbutton(
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const MycartScreen()));
                        },
                        text: "Shop Now",
                        btnheight: height * 0.05,
                        btnwidth: width * 0.24,
                        fontSize: height * 0.02,
                        borderradius: height * 0.015,
                      )
                    ],
                  ),
                  Image.asset(
                    Sliderlist[_currentIndex].image, // Use _currentIndex here
                    height: height * 0.4,
                  ),
                ],
              ),
            ),
          ).toList(),
        ),
        SizedBox(height: height * 0.02),

        // dots.................................
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(Sliderlist.length, (index) {
            return Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                color: index == _currentIndex
                    ? Appcolors().titletextcolor
                    : Appcolors().subtitlecolor,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ],
    );
  }
}
