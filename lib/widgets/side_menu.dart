import 'package:flutter/material.dart';
import 'package:islami_app/presentation/screens/ahadeth_screen/ahadeth_screen.dart';
import 'package:islami_app/presentation/screens/allah_names/allah_names.dart';
import 'package:islami_app/presentation/screens/astakhar_pray/astakhar_pray.dart';
import 'package:islami_app/presentation/screens/quran_screen/quran_screen.dart';
import 'package:islami_app/presentation/screens/rasol_life_screen/rasol_life_screen.dart';
import 'package:islami_app/presentation/screens/tasbeeh_screen/tasbeeh_screen.dart';
import 'package:islami_app/styles/color_manager.dart';
import 'package:islami_app/widgets/side_menu_card.dart';
import '../presentation/screens/azkar_screens/azkar_alsabah/azkar_alsabah.dart';
import '../presentation/screens/azkar_screens/azkar_night/azkar_night.dart';
import '../presentation/screens/azkar_screens/azkar_pray/azkar_pray.dart';
import '../presentation/screens/azkar_screens/tasabih/tasabih.dart';
import '../presentation/screens/prayer_times/prayer_times.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: MediaQuery.sizeOf(context).width * .7,
        backgroundColor: ColorManager.lightColor2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * .02,
                vertical: MediaQuery.sizeOf(context).height * .06),
            child: Column(
              children: [
                SideMenuCard(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuranScreen(),
                        ));
                  },
                  image: "assets/images/quran.png",
                  title: "القرآن الكريم",
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .02,
                ),
                SideMenuCard(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return const PrayerTimes();
                    }));
                  },
                  image: "assets/images/time.png",
                  title: "مواقيت الصلاه",
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .02,
                ),
                SideMenuCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AzkarAlsabah(),
                      ),
                    );
                  },
                  image: "assets/images/sun.png",
                  title: "أذكار الصباح",
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .02,
                ),
                SideMenuCard(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return const AzkarNight();
                    }));
                  },
                  image: "assets/images/moon.png",
                  title: "أذكار المساء",
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .02,
                ),
                SideMenuCard(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return const AzkarPray();
                    }));
                  },
                  image: "assets/images/praying.png",
                  title: "أذكار بعد الصلاة",
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .02,
                ),
                SideMenuCard(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AhadethScreen(),
                        ));
                  },
                  image: "assets/images/hadeth.jpg",
                  title: "أحاديث",
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .02,
                ),
                SideMenuCard(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return const Tasabih();
                    }));
                  },
                  image: "assets/images/sebha.jpg",
                  title: "تسابيح",
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .02,
                ),
                SideMenuCard(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return const TasbeehScreen();
                    }));
                  },
                  image: "assets/images/tasbih.png",
                  title: "السبحه",
                ),

                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .02,
                ),
                SideMenuCard(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return const AstakharPray();
                    }));
                  },
                  image: "assets/images/stakhara.png",
                  title: "صلاه الاستخاره",
                ),


                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .02,
                ),
                SideMenuCard(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return const AllahNames();
                    }));
                  },
                  image: "assets/images/allah.png",
                  title: "اسماء الله الحسنه",
                ),

                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .02,
                ),
                SideMenuCard(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return const RasolLifeScreen();
                    }));
                  },
                  image: "assets/images/paper.png",
                  title: "سيرة الرسول",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }




}
