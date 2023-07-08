import 'package:ajayvishwa/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/responsive.dart';
import '../../utils/string.dart';
import '../../utils/url_launch.dart';

class Footer extends StatefulWidget {
  final void Function()? clickToTop;
  const Footer({
    Key? key,
    this.clickToTop,
  }) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 120 : 20, vertical: Responsive.isDesktop(context) ? 50 : 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 50, width: 50),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (kDebugMode) {
                    print('LinkedinIn Button Clicked');
                  }

                  UrlLaunch.launchInBrowser(url: linkedin);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.linkedinIn,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  if (kDebugMode) {
                    print('Git Button Clicked');
                  }

                  UrlLaunch.launchInBrowser(url: github);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.github,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  if (kDebugMode) {
                    print('Twitter Button Clicked');
                  }

                  UrlLaunch.launchInBrowser(url: insta);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.squareInstagram,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  if (kDebugMode) {
                    print('Email Button Clicked');
                  }
                  UrlLaunch.makeEmail(email: emailId, subject: '', body: '');
                },
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: widget.clickToTop,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: kPrimary,
              ),
              child: const Icon(
                Icons.expand_less,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}