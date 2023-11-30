import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/componants/componants.dart';
import 'package:islami_app/styles/color_manager.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TasbeehScreen extends StatefulWidget {
  const TasbeehScreen({super.key});

  @override
  State<TasbeehScreen> createState() => _TasbeehScreenState();
}

class _TasbeehScreenState extends State<TasbeehScreen> {
  @override
  void initState() {
    AppCubit.get(context).counter = 0;
    AppCubit.get(context).currentIndex = 0;
    AppCubit.get(context).sets = 0;
    AppCubit.get(context).percentage = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: ColorManager.grey,
          appBar: defaultAppBar(
            title: "السبحة الإلكترونية",
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: ColorManager.browen,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          cubit.tasbehList[cubit.currentIndex],
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(color: ColorManager.browenDark),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .1,
                  ),
                  GestureDetector(
                    onTap: () {
                      cubit.resetCounter();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * .07,
                          width: MediaQuery.sizeOf(context).width * .15,
                          decoration: const BoxDecoration(
                            color: ColorManager.browen,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "${cubit.sets}",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  color: ColorManager.browenDark,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     cubit.sebhaCounter();
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  //     child: Container(
                  //       height: MediaQuery.sizeOf(context).height * .3,
                  //       width: double.infinity,
                  //       decoration: const BoxDecoration(
                  //         color: ColorManager.browen,
                  //         // borderRadius: BorderRadius.circular(30),
                  //         shape: BoxShape.circle,
                  //       ),
                  //       child: Center(
                  //         child: Text(
                  //           '${cubit.counter}/33',
                  //           style: Theme.of(context)
                  //               .textTheme
                  //               .headlineLarge!
                  //               .copyWith(
                  //                 color: ColorManager.browenDark,
                  //                 fontSize: 40,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {
                      cubit.sebhaCounter();
                    },
                    child: CircularPercentIndicator(
                      radius: MediaQuery.sizeOf(context).width * .3,
                      animation: false,
                      animationDuration: 1200,
                      lineWidth: 15.0,
                      percent: cubit.percentage,
                      center: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: Container(
                      // height: MediaQuery.sizeOf(context).height * .6,
                      // width: MediaQuery.sizeOf(context).width * .73,
                      decoration: const BoxDecoration(
                        color: ColorManager.browen,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${cubit.counter}/33',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                            color: ColorManager.browenDark,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),),),
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: ColorManager.browen,
                      progressColor: ColorManager.browenDark,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      cubit.resetCounter();
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * .05,
                        width: MediaQuery.sizeOf(context).width * .2,
                        decoration: const BoxDecoration(
                          color: ColorManager.browen,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.refresh_outlined,
                          color: ColorManager.browenDark,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
