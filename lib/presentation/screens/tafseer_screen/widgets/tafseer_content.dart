import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/styles/color_manager.dart';

class TafseerContent extends StatefulWidget {
  int index;

  TafseerContent({required this.index, super.key});

  @override
  State<TafseerContent> createState() => _TafseerContentState();
}

class _TafseerContentState extends State<TafseerContent> {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManager.darkGrey,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    cubit.tafseerModel!.text!,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(
                        color: ColorManager.lightColor,
                      fontSize: MediaQuery.of(context).size.height*.035,
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
