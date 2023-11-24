import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/componants/componants.dart';
import 'package:islami_app/styles/color_manager.dart';

class TasbeehScreen extends StatefulWidget {
  const TasbeehScreen({super.key});

  @override
  State<TasbeehScreen> createState() => _TasbeehScreenState();
}

class _TasbeehScreenState extends State<TasbeehScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorManager.grey,
            appBar: defaultAppBar(
              title: "التسبيح",
              isSideMenuShawn: false,
              context: context,
            ),
            body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      cubit.tasbehList[cubit.currentIndex],
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: ColorManager.darkGreen),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .15,
                    ),
                    Container(
                        height: MediaQuery.sizeOf(context).height * .2,
                        width: MediaQuery.sizeOf(context).width * .4,
                        decoration: BoxDecoration(
                          color: ColorManager.darkGreen,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          //+97
                            child: Text(
                          "${cubit.counter}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                            color: ColorManager.white,
                            fontSize: 40
                          ),
                        ))),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .15,
                    ),
                    InkWell(
                      onTap: (){
                        cubit.sebhaCounter();
                      },
                      child: Container(
                          height: MediaQuery.sizeOf(context).height * .15,
                          width: MediaQuery.sizeOf(context).width * .3,
                          decoration: BoxDecoration(
                            color: ColorManager.darkGreen,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                              child: Text(
                               "سبح",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                    color: ColorManager.white,
                                ),
                              ))),
                    ),


                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
