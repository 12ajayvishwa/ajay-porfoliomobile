import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/colors.dart';
import '../../utils/responsive.dart';
import '../../widgets/app_bar_item.dart';
import '../../widgets/text_builder.dart';

class TopMenu extends StatefulWidget {
  final Function()? home;
  final Function()? about;
  final Function()? project;
  final Function()? skills;
  const TopMenu({
    Key? key,
    this.home,
    this.about,
    this.project,
    this.skills,
  }) : super(key: key);

  @override
  State<TopMenu> createState() => _TopMenuState();
}

class _TopMenuState extends State<TopMenu> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 90,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 120 : 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: widget.home,
            child: Row(
              children: [
                // Image.asset(
                //   'assets/icons/logo.png',
                //   height: 40,
                //   width: 40,
                // ),
                const SizedBox(width: 10.0),
                TextBuilder(
                  text: 'Ajay Portfolio',
                  fontSize: 26,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w600,
                  color: kBlack,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TopMenuItem(
                title: 'About Me',
                onTap: widget.about,
              ),
              TopMenuItem(
                title: 'Projects',
                onTap: widget.project,
              ),
              TopMenuItem(
                title: 'Skills',
                onTap: widget.skills,
              ),
              const SizedBox(width: 10.0),
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
          )
        ],
      ),
    );
  }
}
