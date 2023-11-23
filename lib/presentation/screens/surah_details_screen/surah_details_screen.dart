import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/componants/componants.dart';
import 'package:islami_app/presentation/screens/surah_details_screen/widgets/surah_content_widget.dart';
import 'package:islami_app/presentation/screens/tafseer_screen/tafseer_screen.dart';
import 'package:islami_app/styles/color_manager.dart';
import 'package:islami_app/widgets/lower_row.dart';

import '../../../business_logic/app_cubit/app_cubit.dart';

class ReadingScreen extends StatefulWidget {
  String surahName;
  int index;

  ReadingScreen({required this.index, required this.surahName, super.key});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  @override
  Widget build(BuildContext context) {
    // print("///////////${AppCubit.get(context).audioFiles}");
    print("+++++++++++++++++++++${widget.index}");
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorManager.grey,
            appBar: defaultAppBar(
              title: widget.surahName,
              isSideMenuShawn: false, context: context,
            ),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     cubit.changePlay(cubit
            //         .audioFiles![widget.index].audioUrl!);
            //   },
            //   backgroundColor: ColorManager.darkBlueColor,
            //   child: cubit.play == false
            //       ? const Icon(
            //           Icons.play_circle_outlined,
            //           color: ColorManager.lightColor2,
            //         )
            //       : const Icon(
            //           Icons.pause_circle_outlined,
            //           color: ColorManager.lightColor2,
            //         ),
            // ),
            body: cubit.ayahContent!.isEmpty
                ? const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.lightColor2,
                ))
                : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return SurahContentWidget(
                        index: index,
                        onTap: () {
                          cubit.getTafseer(
                            tafseerId: 1,
                            suraNumber: widget.index,
                            ayahNumber: AppCubit.get(context).ayahContent![index].numberInSurah,).then((value) {
                            return Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  TafseerScreen(
                                      index: widget.index,
                                      surahName: widget.surahName),));
                          });
                        },
                      );
                    },
                    itemCount: cubit.ayahContent!.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox();
                    },
                  ),
                ),
                LowerRow(index: widget.index,),

              ],
            ),
          ),
        );
      },
    );
  }
}
