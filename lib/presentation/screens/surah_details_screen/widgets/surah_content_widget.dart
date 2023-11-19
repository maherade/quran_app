import 'package:flutter/material.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';

class SurahContentWidget extends StatelessWidget {
  int index;
    SurahContentWidget({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(children: [
        Center(
          child: Text(
            '${AppCubit.get(context).ayahContent![index].text} ${{
              index+1}}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black),
          ),
        ),
      ]),
    );
  }
}
