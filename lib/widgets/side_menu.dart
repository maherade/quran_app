import 'package:flutter/material.dart';
import 'package:islami_app/presentation/screens/azkar_screens/azkar_alsabah/azkar_alsabah.dart';
import 'package:islami_app/presentation/screens/azkar_screens/azkar_night/azkar_night.dart';
import 'package:islami_app/presentation/screens/azkar_screens/azkar_pray/azkar_pray.dart';
import 'package:islami_app/presentation/screens/azkar_screens/tasabih/tasabih.dart';
import 'package:islami_app/presentation/screens/prayer_times/prayer_times.dart';
import 'package:islami_app/presentation/screens/quran_screen/quran_screen.dart';
import 'package:islami_app/styles/color_manager.dart';
import 'package:islami_app/widgets/side_menu_card.dart';

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
        width: MediaQuery
            .sizeOf(context)
            .width * .7,
        backgroundColor: ColorManager.lightColor2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery
                  .sizeOf(context)
                  .width * .02,
              vertical: MediaQuery
                  .sizeOf(context)
                  .height * .06),
          child: Column(
            children: [
              SideMenuCard(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuranScreen()
                  ,    ), (route) => false);
                },
                image: "assets/images/quran.png",
                title: "القرآن الكريم",
              ),
              SizedBox(
                height: MediaQuery
                    .sizeOf(context)
                    .height * .02,
              ),



              SideMenuCard(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_){
                    return const PrayerTimes();
                  }));
                },
                image: "assets/images/time.png",
                title: "مواقيت الصلاه",
              ),

              SizedBox(
                height: MediaQuery
                    .sizeOf(context)
                    .height * .02,
              ),


              SideMenuCard(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AzkarAlsabah(),),
                          (route) => false);

                },
                image: "assets/images/sun.png",
                title: "أذكار الصباح",
              ),
              SizedBox(
                height: MediaQuery
                    .sizeOf(context)
                    .height * .02,
              ),
              SideMenuCard(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_){
                    return const AzkarNight();
                  }));
                },
                image: "assets/images/moon.png",
                title: "أذكار المساء",
              ),

              SizedBox(
                height: MediaQuery
                    .sizeOf(context)
                    .height * .02,
              ),
              SideMenuCard(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_){
                    return const AzkarPray();
                  }));
                },
                image: "assets/images/praying.png",
                title: "أذكار بعد الصلاة",
              ),

              SizedBox(
                height: MediaQuery
                    .sizeOf(context)
                    .height * .02,
              ),
              SideMenuCard(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_){
                    return const Tasabih();
                  }));
                },
                image: "assets/images/tasbih.png",
                title: "تسابيح",
              ),



            ],
          ),
        ),
      ),
    );
  }
}
