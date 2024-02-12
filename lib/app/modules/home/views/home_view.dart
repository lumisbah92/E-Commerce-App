import 'package:e_commerce_app/Utils/colors.dart';
import 'package:e_commerce_app/app/modules/home/views/components/food_page_body.dart';
import 'package:e_commerce_app/widgets/bigText.dart';
import 'package:e_commerce_app/widgets/smallText.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.buttonBackgroundColor,
      body: Column(
        children: [
          // showing the header
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Bangladesh", color: AppColors.mainColor, size: 22,),
                      Row(
                        children: [
                          SmallText(text: "Sylhet", color: Colors.black54,),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.mainColor,
                    ),
                    child: Center(child: Icon(Icons.search, color: Colors.white,)),
                  )
                ],
              ),
            ),
          ),
          // showing the body
          FoodPageBody(),
        ],
      )
    );
  }
}
