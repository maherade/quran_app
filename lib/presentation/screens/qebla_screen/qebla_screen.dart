import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/componants/componants.dart';
import 'package:islami_app/styles/color_manager.dart';

class QeblaScreen extends StatelessWidget {
  const QeblaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grey,
      appBar: defaultAppBar(
        title: "القبلة",
        isSideMenuShawn: false,
        context: context,
      ),
      body: BlocConsumer<AppCubit, AppState>(builder: (context, state) {
        return StreamBuilder<CompassEvent>(
          stream: FlutterCompass.events,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error reading heading: ${snapshot.error}');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            double? direction = snapshot.data!.heading;
            if (direction == null) {
              return const Center(
                child: Text("Device does not have sensors !"),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                elevation: 4.0,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: ColorManager.darkBlueColor,
                    shape: BoxShape.circle,
                  ),
                  child: Transform.rotate(
                    angle: (direction * (math.pi / 180) * -1),
                    child: Image.asset('assets/images/compass.png',

                    height:  MediaQuery.sizeOf(context).height*.8,
                    width: MediaQuery.sizeOf(context).width*.95,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }, listener: (context, state) {

      },),
    );
  }
}
