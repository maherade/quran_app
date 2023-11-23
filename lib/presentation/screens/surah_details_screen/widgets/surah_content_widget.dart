import 'package:flutter/material.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';

class SurahContentWidget extends StatelessWidget {
  int index;
  Function() onTap;
    SurahContentWidget({required this.onTap, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            '${AppCubit.get(context).ayahContent![index].text!.split("\n").join()} ${{
            AppCubit.get(context).ayahContent![index].numberInSurah}}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
