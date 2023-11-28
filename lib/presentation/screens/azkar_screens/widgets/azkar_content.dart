import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/data/models/azkar/azkar_model/azkar_model.dart';
import 'package:islami_app/styles/color_manager.dart';

class AzkarContent extends StatelessWidget {
  int index;
  String azkarTitle='';
  List<Azkar> azkars=[];

  AzkarContent({required this.index,required this.azkarTitle, super.key,required this.azkars});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(8),

          decoration: BoxDecoration(
            color: ColorManager.darkGrey,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5
                  ),
                  child: Text(
                    azkarTitle,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(
                        color: ColorManager.lightColor,
                        fontSize: 15
                    ),

                  ),
                ),
              ),
              const SizedBox(height: 5,),
              const Divider(
                height: 1,
                thickness: 1,
                color: ColorManager.lightColor,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .01,
              ),
              Text(
                azkars[index].content!,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(
                    color: ColorManager.lightColor,
                    fontSize: MediaQuery.sizeOf(context).height * .025
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
