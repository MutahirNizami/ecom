// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:newappui_8/utilis/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final IconData? sufixIcon;
  final IconData? prefixIcon;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.prefixIcon,
    this.sufixIcon,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.07,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height * 0.025),
          color: Appcolors().contianercolor),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: hintText,
          prefixIcon: Icon(prefixIcon ?? Icons.person),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(height * 0.02),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: height * 0.02,
          ),
        ),
      ),
    );
  }
}
