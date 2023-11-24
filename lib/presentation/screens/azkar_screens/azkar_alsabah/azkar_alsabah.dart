import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/componants/componants.dart';
import 'package:islami_app/presentation/screens/azkar_screens/widgets/azkar_content.dart';
import 'package:islami_app/styles/color_manager.dart';
import 'package:islami_app/widgets/side_menu.dart';

class AzkarAlsabah extends StatelessWidget {

  const AzkarAlsabah({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: ColorManager.grey,
          appBar: defaultAppBar(
            title: "أذكار الصباح",
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
                            return AzkarContent( index: index,azkarTitle: 'أذكار الصباح',azkars: cubit.azkarMorning,);
                          },
                          separatorBuilder: (context,index){
                            return const SizedBox(height: 25,);
                          },
                          itemCount: cubit.azkarMorning.length
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.02,),

                  ],
                ),
              );
        },
        listener: (context, state) {},
      ),
    ));
  }
}
