import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/componants/componants.dart';
import 'package:islami_app/presentation/screens/ahadeth_screen/widgets/ahadeth_container.dart';
import 'package:islami_app/styles/color_manager.dart';

import '../../../data/models/ads_model/ads_model.dart';

class AhadethScreen extends StatelessWidget {
  const AhadethScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorManager.grey,
      appBar: defaultAppBar(
        title: "أحاديث",
        isSideMenuShawn: false,
        context: context,
      ),
          body: BlocConsumer<AppCubit, AppState>(builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [


                  Expanded(
                    child: ListView.separated(itemBuilder: (context, index) {
                      return Column(
                        children: [
                          AhadethContainer(
                            index: index,
                          ),
                        ],
                      );
                    }, separatorBuilder: (context, index) {
                      return SizedBox(
                        height: MediaQuery.sizeOf(context).height * .03,
                      );
                    }, itemCount: AppCubit.get(context).ahadethItems.length),
                  ),
                  AdmobBanner(
                      adUnitId: AdsModel.getBannerAd(),
                      adSize: AdmobBannerSize.FULL_BANNER),
                ],
              ),
            );
          }, listener: (context, state) {

          },),
    ));
  }
}
