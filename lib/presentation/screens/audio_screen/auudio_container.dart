import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/styles/color_manager.dart';

class AudioContainer extends StatefulWidget {
  int index;

  AudioContainer({required this.index, super.key});

  @override
  State<AudioContainer> createState() => _AudioContainerState();
}

class _AudioContainerState extends State<AudioContainer> {
  @override
  Widget build(BuildContext context) {
    print("******************************${AppCubit.get(context).audioContent}" );
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
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
              Container(
                height: MediaQuery.of(context).size.height * .05,
                decoration: const BoxDecoration(
                  color: ColorManager.lightColor2,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          //    cubit.changePlay(
                          //        cubit.audioModel!.data!.surahs![widget.index].ayahs![widget.index].audio!,);
                          },
                          icon:const Icon(
                                  Icons.play_arrow,
                                  color: Colors.black,
                                ),

                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .25,
                    ),
                    Text(
                      "{${cubit.ayahContent![widget.index].numberInSurah}}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.black),
                    ),
                  ],
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
                    cubit.ayahContent![widget.index].text!,
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
