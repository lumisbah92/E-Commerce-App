import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_app/Utils/colors.dart';
import 'package:e_commerce_app/widgets/bigText.dart';
import 'package:e_commerce_app/widgets/smallText.dart';
import 'package:e_commerce_app/widgets/textWithIcon.dart';
import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        // print("Current Page value is " + _currPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue.round(),
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if(index == _currPageValue.floor()) {
        var currScale = 1 - ((_currPageValue - index) * (1 - _scaleFactor));
        var currTrans = _height * ((1 - currScale) / 2);
        matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else if(index == _currPageValue.floor() + 1) {
        var currScale = _scaleFactor + ((_currPageValue - index + 1) * (1 - _scaleFactor));
        var currTrans = _height * ((1 - currScale) / 2);
        matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else if(index == _currPageValue.floor() - 1) {
      var currScale = 1 - ((_currPageValue - index) * (1 - _scaleFactor));
      var currTrans = _height * ((1 - currScale) / 2);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = _height * ((1 - currScale) / 2);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: _height,
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven
                    ? const Color(0xFF69c5df)
                    : const Color(0xFF9294cc),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/image/food1.jpg",
                    ))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                   BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5)
                  ),
                   BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0)
                  ),
                   BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0)
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Chinese Side"),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(Icons.star,
                                  color: AppColors.mainColor, size: 15)),
                        ),
                        const SizedBox(width: 10),
                        SmallText(text: "4.5"),
                        const SizedBox(width: 10),
                        SmallText(text: "1287 comments"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWithIcon(
                            icon: Icons.circle_sharp,
                            iconColor: AppColors.iconColor1,
                            text: "Normal"),
                        TextWithIcon(
                            icon: Icons.location_on,
                            iconColor: AppColors.mainColor,
                            text: "1.7 km"),
                        TextWithIcon(
                            icon: Icons.access_time_rounded,
                            iconColor: AppColors.iconColor2,
                            text: "32 min"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
