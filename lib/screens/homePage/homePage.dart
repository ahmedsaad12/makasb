import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makasb/colors/colors.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/routes/app_routes.dart';
import 'package:makasb/screens/homePage/widget/coinsWidget.dart';
import 'package:makasb/screens/homePage/widget/homeWidget.dart';
import 'package:makasb/screens/homePage/widget/profileWidget.dart';
import 'package:makasb/screens/homePage/widget/socialWidget.dart';
import 'package:makasb/widgets/app_widgets.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}


class _homePageState extends State<homePage> {
  int indexpage = 0;

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        indexpage = index;
      });
    }
    List<Widget> screens = [
      const homeWidget(),
      const socialWidget(),
      const coinsWidget(),
      const profileWidget()
    ];


    return Container(
        child: Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildAppBar(context, "0"),
          Expanded(
          child: screens.elementAt(indexpage),
            ),
          ]),


      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        unselectedItemColor: AppColors.grey6,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset('${AppConstant.localImagePath}home.svg',
              color: indexpage == 0
                  ? AppColors.colorPrimary
                  : AppColors.grey6,
            ),
            label: 'home'.tr(),

          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('${AppConstant.localImagePath}home.svg',
              color: indexpage == 1
                  ? AppColors.colorPrimary
                  : AppColors.grey6,),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('${AppConstant.localImagePath}home.svg',
              color: indexpage == 2
                  ? AppColors.colorPrimary
                  : AppColors.grey6,),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('${AppConstant.localImagePath}home.svg',
              color: indexpage == 3
                  ? AppColors.colorPrimary
                  : AppColors.grey6,
            ),
            label: 'Chats',
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: indexpage,
        selectedItemColor: AppColors.colorPrimary,
      ),
    ));
  }

  Widget _buildAppBar(BuildContext context, String notificationCount) {
    return AppBar(
        backgroundColor: AppColors.white,
        flexibleSpace: Container(
          height: 90,
          alignment: Alignment.center,
          child: Center(
              child:
              Column(
                children: [
                  const SizedBox(height: 40),
                  Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 5),
                    Image.asset('${AppConstant.localImagePath}logo.png',
                        height: 30),
                    Expanded(flex: 1, child: Container()),
                    // give it width

                    Text(
                      'email'.tr(),
                      style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.color5),
                    ),
                    SizedBox(width: 5),
                    SvgPicture.asset(
                      '${AppConstant.localImagePath}dolar.svg',
                      height: 15,
                      width: 15,
                    ),
                    SizedBox(width: 5)
                  ],

                )],
             )),
        ));
  }
}
