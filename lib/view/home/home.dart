import 'package:flutter/material.dart';
import 'dart:developer' as dev;
import '../../utils/colors.dart';
import '../../utils/responsive.dart';
import '../../utils/url_launch.dart';
import '../../widgets/app_banners.dart';
import '../../widgets/custom_devider.dart';
import '../../widgets/mobile_drawer.dart';
import '../../widgets/mobile_header.dart';
import '../about/about.dart';
import '../app_bar/top_menu.dart';
import '../footer/footer.dart';
import '../hero/hero_cta.dart';
import '../project/project.dart';
import '../skills/skills.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    // SchedulerBinding.instance.addPostFrameCallback((_) async {
    //   var seen = sp!.getBool('isAlreadySeen');
    //   if (seen == null) {
    //     bannerPopUp();
    //   } else {
    //     await Future.delayed(const Duration(hours: 4)).then((value) => bannerPopUp());
    //     await sp!.remove('isAlreadySeen');
    //   }
    // });
  }

  bannerPopUp() {
    showDialog(
      context: context,
      useSafeArea: true,
      barrierDismissible: false,
      builder: (context) {
        return const AlertDialog(
          iconPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          content: AppBanners(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeKey = GlobalKey();
    final aboutKey = GlobalKey();
    final projectKey = GlobalKey();
    final skillsKey = GlobalKey();
    final topKey = GlobalKey();

    final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: drawerKey,
      backgroundColor: kWhite,
      drawer: Responsive.isDesktop(context) ? const SizedBox() : MobileDrawer(about: aboutKey, project: projectKey, skills: skillsKey),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Responsive.isDesktop(context)
                  ? TopMenu(
                      key: homeKey,
                      home: () {
                        Scrollable.ensureVisible(
                          homeKey.currentState!.context,
                          duration: const Duration(seconds: 1),
                        );
                      },
                      about: () {
                        Scrollable.ensureVisible(
                          aboutKey.currentState!.context,
                          duration: const Duration(seconds: 1),
                        );
                      },
                      project: () {
                        Scrollable.ensureVisible(
                          projectKey.currentState!.context,
                          duration: const Duration(seconds: 1),
                        );
                      },
                      skills: () {
                        Scrollable.ensureVisible(
                          skillsKey.currentState!.context,
                          duration: const Duration(seconds: 1),
                        );
                      },
                    )
                  : MobileHeader(drawerKey: drawerKey),
              HeroCta(key: topKey),
              const CustomDivider(),
              About(key: aboutKey),
              const CustomDivider(),
              Project(key: projectKey),
              const CustomDivider(),
              Skills(key: skillsKey),
              const CustomDivider(),
              Footer(
                clickToTop: () {
                  if (Responsive.isDesktop(context)) {
                    Scrollable.ensureVisible(
                      homeKey.currentState!.context,
                      duration: const Duration(seconds: 1),
                    );
                  } else {
                    Scrollable.ensureVisible(
                      topKey.currentState!.context,
                      duration: const Duration(seconds: 1),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}