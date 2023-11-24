import 'package:flutter/material.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/presentation/screens/audio_screen/audio_screen.dart';
import 'package:islami_app/presentation/screens/surah_details_screen/surah_details_screen.dart';
import 'package:islami_app/styles/color_manager.dart';

class LowerRow extends StatelessWidget {
  int index;

  LowerRow({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .07,
      width: double.infinity,
      color: ColorManager.lightColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReadingScreen(
                        surahName:
                            "${AppCubit.get(context).surahNames![index].name}",
                        index: AppCubit.get(context).surahNames![index].number,
                      ),
                    ));
            },
            child: Text(
              "قراءة",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.black),
            ),
          ),
          const VerticalDivider(
            thickness: 1,
          ),
          InkWell(
            onTap: () {
              AppCubit.get(context).getAudio();
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return AudioScreen(
                      index: AppCubit.get(context).surahNames![index - 1].number,
                      surahName:
                      "${AppCubit.get(context).surahNames![index - 1].name}",
                    );
                  },
                ));

            },
            child: Text(
              "استماع",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
