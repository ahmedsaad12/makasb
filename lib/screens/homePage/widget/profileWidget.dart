import 'dart:async';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makasb/colors/colors.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class profileWidget extends StatefulWidget {
  const profileWidget({Key? key}) : super(key: key);

  @override
  State<profileWidget> createState() => _profileWidgetState();
}

class _profileWidgetState extends State<profileWidget>
    with SingleTickerProviderStateMixin {
  double _currentPage = 0;
  List<int> _list = [
    10,
    20,
    30,
    40,
    50,
    10,
    20,
    30,
    40,
    50,
    10,
    20,
    30,
    40,
    50
  ];
  late Timer _timer;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 10) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage.toInt(),
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Transform.rotate(
                angle: Localizations.localeOf(context).languageCode == 'en'
                    ? 0
                    : 3.14,
                child: Image.asset(
                  '${AppConstant.localImagePath}rectangle.png',
                  width: 20.0,
                  height: 40.0,
                )),
            Text(
              "top_social_media".tr(),
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
            ),
          ],
        ),
        Container(
            constraints: const BoxConstraints.expand(height: 230),
            child: _imageSlider(context)),
        SmoothPageIndicator(
          controller: _pageController, // PageController
          count: 10,
          effect:
              const ExpandingDotsEffect(expansionFactor: 2), // your preferred effect
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Transform.rotate(
                angle: Localizations.localeOf(context).languageCode == 'en'
                    ? 0
                    : 3.14,
                child: Image.asset(
                  '${AppConstant.localImagePath}rectangle.png',
                  width: 20.0,
                  height: 40.0,
                )),
            Text(
              "top_social_media".tr(),
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
            ),
          ],
        ),
        GridView.builder(
          shrinkWrap: true,
          itemCount: _list.length,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 20,
            childAspectRatio: 1,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Card(
                elevation: 10,
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Center(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                                height: 50,
                                fit: BoxFit.cover,
                                '${AppConstant.localImagePath}bottom_splash.png')))));
          },
        ),
        const SizedBox(height: 10),

      ]),
    );
  }

  _userShow() {
    return Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.colorPrimary,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            Container(
                margin: const EdgeInsets.all(10),
                width: 90.0,
                height: 90.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    '${AppConstant.localImagePath}logo.png',
                    width: 90.0,
                    height: 90.0,
                  ),
                )),
            Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          '${AppConstant.localImagePath}dolar.svg',
                        ),
                        const SizedBox(width: 5), // give it width

                        Text(
                          'email'.tr(),
                          style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                              color: AppColors.black),
                        ),
                      ],
                    )),
                const Text(
                  "Mahmoud Elkomy",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.colorPrimary),
                )
              ],
            )
          ],
        ));
  }

  _imageSlider(context) {
    return PageView.builder(
      controller: _pageController,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            margin: const EdgeInsets.all(10),
            child:Card(
              child: Container(),
            )
        );
      },
      itemCount: 10,
    );
  }
}
