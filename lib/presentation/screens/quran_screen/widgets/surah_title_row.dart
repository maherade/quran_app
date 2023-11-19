import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/styles/color_manager.dart';

class SurahTitleRow extends StatelessWidget {
  int index;
  Function()? onTap;

  SurahTitleRow({required this.onTap,required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: ColorManager.lightColor2,
                )
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cubit.surahModel!.data![index].name!,
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "عدد الآيات ",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Text(
                        "(${cubit.surahModel!.data![index].numberOfAyahs!})",
                        style: const TextStyle(color: Colors.black, fontSize: 12),
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
