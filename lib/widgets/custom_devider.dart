import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Responsive.isDesktop(context) ? 120 : 20),
      child: Divider(
        color: Colors.black.withOpacity(0.6),
        thickness: 0.5,
        height: 1,
      ),
    );
  }
}