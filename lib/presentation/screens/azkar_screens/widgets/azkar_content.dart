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
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height * .25,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManager.lightColor2,
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
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .03
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .01,
              ),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Text(
                    azkars[index].content!,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.black),
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
