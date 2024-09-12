import 'package:flutter/material.dart';

import 'package:newappui_8/model/gridmodel.dart';
import 'package:newappui_8/utilis/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.04, horizontal: width * 0.06),
        child: Column(
          children: [
            Row(
              children: [
                // Search bar
                Expanded(
                  child: Container(
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      color: Appcolors()
                          .contianercolor, // Light gray background color
                      borderRadius: BorderRadius.circular(
                          height * 0.011), // Rounded corners
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "iPhone 13 pro",
                        hintStyle: TextStyle(
                          color: Appcolors().subtitlecolor.withOpacity(0.75),
                          fontSize: height * 0.02,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Appcolors().subtitlecolor.withOpacity(0.75),
                          size: height * 0.025,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(height * 0.03),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: width * 0.03),
                Image(
                  image: const AssetImage("assets/images/sliders.png"),
                  width: width * 0.07,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent searches",
                  style: TextStyle(
                      color: Appcolors().subtitlecolor,
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.w600),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Clear all",
                      style: TextStyle(
                          color: Appcolors().subtitlecolor,
                          fontSize: height * 0.02,
                          fontWeight: FontWeight.w600),
                    ))
              ],
            ),
            const Divider(),
            SizedBox(
              height: height * 0.75,
              child: ListView.builder(
                itemCount: Searchlist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(Searchlist[index].text.toString()),
                        Icon(Searchlist[index].icon)
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
