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



  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
    Scaffold(

        body: new Stack(children: <Widget>[
          new Image.asset('${AppConstant.localImagePath}profile_background.png',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.33
          ),
          ListView(children: <Widget>[
             Padding(

                padding: EdgeInsets.all(10),
                child: new Center(
                  child: new Container(
                    child: Image.asset('${AppConstant.localImagePath}logo.png',
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.33
                    ),
                  ),
                )
            )
          ]),
        ])
    ),
        ]),
    );
  }


}
