import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/presentation/screens/audio_screen/audio_screen.dart';
import 'package:islami_app/presentation/screens/surah_details_screen/surah_details_screen.dart';
import 'package:islami_app/styles/color_manager.dart';

class LowerRow extends StatelessWidget {
  int index;

  LowerRow({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
        listener: (context,state){

        },
        builder: (context,state){
          return Container(
            height: MediaQuery.sizeOf(context).height * .08,
            width: double.infinity,
            color: ColorManager.darkGrey.withOpacity(.8),
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
                        .copyWith(
                        color: ColorManager.lightColor,
                        fontSize: MediaQuery.of(context).size.height*.027
                    ),
                  ),
                ),
                const VerticalDivider(
                  thickness: 1,
                  color: ColorManager.lightColor,
                ),
                InkWell(
                  onTap: () {
                    print('Ok');
                    AppCubit.get(context).getAudio();
                    // Navigator.push(context, MaterialPageRoute(
                    //   builder: (context) {
                    //     return AudioScreen(
                    //       index: AppCubit.get(context).surahNames![index - 1].number,
                    //       surahName:
                    //       "${AppCubit.get(context).surahNames![index - 1].name}",
                    //     );
                    //   },
                    // ));

                  },
                  child: Text(
                    "استماع",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(
                        color:ColorManager.lightColor,
                        fontSize: MediaQuery.of(context).size.height*.027
                    ),
                  ),
                ),
              ],
            ),
          );
        },
    );
  }
}
