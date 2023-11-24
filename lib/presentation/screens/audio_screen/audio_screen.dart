import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/componants/componants.dart';
import 'package:islami_app/presentation/screens/audio_screen/auudio_container.dart';

import '../../../styles/color_manager.dart';
import '../../../widgets/lower_row.dart';

class AudioScreen extends StatefulWidget {
  String surahName;
  int index;

  AudioScreen({required this.index, required this.surahName, super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.grey,
        appBar: defaultAppBar(
          title: widget.surahName,
          isSideMenuShawn: true,
          context: context,
        ),
        body: BlocConsumer<AppCubit, AppState>(
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            return Container(
              padding: const EdgeInsets.all(15),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return AudioContainer(index: index,);
                      },
                      itemCount:cubit.ayahContent!.length,
                      separatorBuilder: (context, index) => SizedBox(
                        height: MediaQuery.sizeOf(context).height * .02,
                      ),
                    ),
                  ),
                  LowerRow(index: widget.index,),
                ],
              ),
            );
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
