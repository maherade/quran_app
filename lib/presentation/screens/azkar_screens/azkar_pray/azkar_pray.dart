import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/componants/componants.dart';
import 'package:islami_app/presentation/screens/azkar_screens/widgets/azkar_content.dart';
import 'package:islami_app/styles/color_manager.dart';
import 'package:islami_app/widgets/side_menu.dart';

import '../../../../data/models/ads_model/ads_model.dart';

class AzkarPray extends StatelessWidget {

  const AzkarPray({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: ColorManager.grey,
          appBar: defaultAppBar(
            title: "أذكار بعد الصلاه",
            isSideMenuShawn: false, context: context,
          ),
          drawer: const SideMenu(),
          body: BlocConsumer<AppCubit, AppState>(
            builder: (context, state) {
              var cubit=AppCubit.get(context);
              return  Container(
                padding: EdgeInsets.symmetric(
                    horizontal:MediaQuery.of(context).size.height*.01
                ),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*.02,),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context,index){
                            return AzkarContent( index: index,azkarTitle: 'أذكار بعد الصلاه',azkars: cubit.azkarDooa,);
                          },
                          separatorBuilder: (context,index){
                            return const SizedBox(height: 25,);
                          },
                          itemCount: cubit.azkarDooa.length
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.02,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AdmobBanner(
                          adUnitId:
                          AdsModel.getBannerAd(),
                          adSize: AdmobBannerSize
                              .FULL_BANNER),
                    ),
                  ],
                ),
              );
            },
            listener: (context, state) {},
          ),
        ));
  }
}
