

import 'package:ajayvishwa/widgets/text_builder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/colors.dart';
import '../utils/string.dart';
import '../utils/url_launch.dart';

class MobileHeader extends StatelessWidget {
  final GlobalKey<ScaffoldState>? drawerKey;
  const MobileHeader({
    Key? key,
    this.drawerKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    drawerKey!.currentState!.openDrawer();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Icon(
                      Icons.menu,
                      color: kBlack,
                    ),
                  ),
                ),
                const SizedBox(width: 20.0),
                TextBuilder(
                  text: 'Ajay Portfolio',
                  fontSize: 22,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w800,
                  color: kBlack,
                ),
              ],
            ),
            InkWell(
              onTap: () {
                //UrlLaunch.launchInBrowser(url: apkDownloadLink);
              },
              child: const FaIcon(
                FontAwesomeIcons.android,
                size: 30,
                color: Color(0xff1C8302),
              ),
            )
          ],
        ),
      ),
    );
  }
}