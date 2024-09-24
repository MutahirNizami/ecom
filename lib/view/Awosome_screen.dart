// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:newappui_8/router/dashboard.dart';
import 'package:newappui_8/widgets/button.dart';
import 'package:newappui_8/utilis/colors.dart';

class AwosomeScreen extends StatelessWidget {
  const AwosomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.07, horizontal: width * 0.06),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/Tickmark.png",
                height: height * 0.2,
                width: width * 0.4,
              ),
              Text(
                "Awesome!!",
                style: TextStyle(
                    fontSize: height * 0.045, fontWeight: FontWeight.w700),
              ),
              Text(
                "   Your order has been \ncompleted and is being \n          attended to.",
                style: TextStyle(
                    fontSize: height * 0.025,
                    fontWeight: FontWeight.w400,
                    color: Appcolors().subtitlecolor),
              ),
              Appbutton(
                ontap: () {},
                text: "Track order",
                fontSize: height * 0.025,
                fontWeight: FontWeight.w600,
                btnheight: height * 0.07,
                btnwidth: width,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardScreen(),
                      ));
                },
                child: Container(
                  height: height * 0.07,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(height * 0.02),
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black)),
                  child: Center(
                    child: Text(
                      "Continue shopping",
                      style: TextStyle(
                          fontSize: height * 0.025,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
