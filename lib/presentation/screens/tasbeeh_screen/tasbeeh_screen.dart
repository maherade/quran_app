import 'dart:ui';

import 'package:animated_flip_counter/animated_flip_counter.dart';
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
  void initState() {
    AppCubit.get(context).counter=0;
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
                        child: AnimatedFlipCounter(
                          duration: const Duration(milliseconds: 300),
                          value: cubit.counter,
                          curve: Curves.elasticOut,
                          wholeDigits: 1,
                          textStyle: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            locale: const Locale("en", "US"),
                            shadows: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(.3),
                                offset: const Offset(7, 2),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          cubit.sebhaCounter();
                        },
                        child: Container(
                            height: MediaQuery.sizeOf(context).height * .15,
                            width: MediaQuery.sizeOf(context).width * .3,
                            decoration: BoxDecoration(
                              color: ColorManager.darkGreen,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "سبح",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                      color: ColorManager.white,
                                    ),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * .04,
                      ),
                      InkWell(
                        onTap: () {
                          cubit.resetCounter();
                        },
                        child: Container(
                            alignment: Alignment.bottomCenter,
                            height: MediaQuery.sizeOf(context).height * .05,
                            width: MediaQuery.sizeOf(context).width * .1,
                            decoration: BoxDecoration(
                              color: ColorManager.darkGreen,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                                child: Icon(
                              Icons.replay_rounded,
                              color: ColorManager.white,
                            ))),
                      ),
                    ],
                  ),
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
