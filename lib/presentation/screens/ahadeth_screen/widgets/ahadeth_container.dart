import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/styles/color_manager.dart';

class AhadethContainer extends StatelessWidget {
  int index;
   AhadethContainer({  required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Container(
          padding: const EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height * .25,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManager.darkGrey,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .05,
                decoration: const BoxDecoration(
                  color: ColorManager.darkGrey,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      " الحديث رقم ${cubit.ahadethItems[index].number}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: ColorManager.lightColor,
                      fontSize: 15),

                    ),
                  ),
                ),

              ),
              SizedBox(height: 10,),
              const Divider(
                height: 1,
                thickness: 1,
                color: ColorManager.lightColor,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .01,
              ),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Text(
                    cubit.ahadethItems[index].arab!,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(
                        color: ColorManager.lightColor,
                        fontSize: MediaQuery.sizeOf(context).height * .028
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
  }

