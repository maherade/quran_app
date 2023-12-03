import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/componants/componants.dart';
import 'package:islami_app/data/models/ads_model/ads_model.dart';
import 'package:islami_app/presentation/screens/tafseer_screen/widgets/tafseer_content.dart';
import 'package:islami_app/styles/color_manager.dart';

import '../../../business_logic/app_cubit/app_cubit.dart';

class TafseerScreen extends StatelessWidget {
  String surahName;
  int index;

    TafseerScreen({ required this.index, required this.surahName,super.key});

  @override
  Widget build(BuildContext context) {
    print("-*//*-*/-${AppCubit.get(context).tafseerContent}");
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.grey,
        appBar: defaultAppBar(
          title: surahName,
          isSideMenuShawn: false,
          context: context,
        ),
        body: BlocConsumer<AppCubit, AppState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    child: TafseerContent(index: index,)),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AdmobBanner(
                        adUnitId:
                        AdsModel.getBannerAd(),
                        adSize: AdmobBannerSize
                            .FULL_BANNER),
                  ),
                ),

              ],
            );
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
