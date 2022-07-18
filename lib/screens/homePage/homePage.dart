import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makasb/colors/colors.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/routes/app_routes.dart';
import 'package:makasb/widgets/app_widgets.dart';
class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    int index = 0;

    return Container(
      child:
      Scaffold(
        body:
      Column(   mainAxisSize: MainAxisSize.max,
        children: [
          _buildAppBar(context, "0"),

          Expanded(
            child: IndexedStack(

            ),
          ),
        ],),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Calls',


            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
          ],
        ),
      )
    );
  }
  Widget _buildBottomNavigationItem(
      BuildContext context, imageName, Color color, String title, int index) {
    return MaterialButton(

      minWidth: 48,
      onPressed: () {  },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppWidget.svg(imageName, color, 24.0, 24.0),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            title,
            style: TextStyle(color: color, fontSize: 13.0),
          )
        ],
      ),
    );
  }
  Widget _buildAppBar(BuildContext context, String notificationCount) {
    double width = MediaQuery.of(context).size.width;


    return Container(

      width: width,
      height: 56.0,
      decoration: BoxDecoration(color: AppColors.white),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 99.0,
            height: 36.0,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                    AssetImage('${AppConstant.localImagePath}logo.png'))),
          ),

        ],
      ),
    );
  }

}
