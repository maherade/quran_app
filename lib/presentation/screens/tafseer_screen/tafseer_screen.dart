import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/componants/componants.dart';
import 'package:islami_app/presentation/screens/tafseer_screen/widgets/tafseer_content.dart';
import 'package:islami_app/styles/color_manager.dart';

import '../../../business_logic/app_cubit/app_cubit.dart';

class TafseerScreen extends StatelessWidget {
  String surahName;
  int index;

    TafseerScreen({ required this.index, required this.surahName,super.key});

  @override
  Widget build(BuildContext context) {
    print("-*//*-*/-${AppCubit.get(context).tafseerContent}");
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.grey,
        appBar: defaultAppBar(
          title: surahName,
          isSideMenuShawn: false,
          context: context,
        ),
        body: BlocConsumer<AppCubit, AppState>(
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(15),
              height: double.infinity,
              width: double.infinity,
              child: TafseerContent(index: index,)
            ,
            );
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
