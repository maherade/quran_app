import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/componants/componants.dart';
import 'package:islami_app/presentation/screens/quran_screen/widgets/surah_title_row.dart';
import 'package:islami_app/presentation/screens/surah_details_screen/surah_details_screen.dart';
import 'package:islami_app/styles/color_manager.dart';
import 'package:islami_app/widgets/side_menu.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({ super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.grey,
        appBar: defaultAppBar(
          title: "القرآن الكريم",
          isSideMenuShawn: true, context: context,
        ),
        drawer: const SideMenu(),
        body: BlocConsumer<AppCubit, AppState>(
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return SurahTitleRow(
                            index: index,
                            onTap: () {
                              cubit.getAyah( cubit.surahNames![index].number).then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ReadingScreen(
                                        surahName: "${cubit.surahNames![index].name}",
                                        index: cubit.surahNames![index].number,
                                        // ayahContent:"${cubit.ayahContent![index].text}",
                                      ),
                                    ));
                                // cubit.getAudio();
                              }).catchError((onError){
                                print(onError.toString());
                              });
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: MediaQuery.sizeOf(context).height * .01,
                          );
                        },
                        itemCount: cubit.surahNames!.length),
                  ),
                ],
              ),
            );
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
