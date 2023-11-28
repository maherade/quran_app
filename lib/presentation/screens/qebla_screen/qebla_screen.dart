import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/componants/componants.dart';
import 'package:islami_app/presentation/screens/qebla_screen/widgets/location_error_widget.dart';
import 'package:islami_app/presentation/screens/qebla_screen/widgets/qeblah_indicator.dart';
import 'package:islami_app/presentation/screens/qebla_screen/widgets/qiblah_compass.dart';
import 'package:islami_app/styles/color_manager.dart';

class QeblaScreen extends StatefulWidget {
  const QeblaScreen({super.key});

  @override
  State<QeblaScreen> createState() => _QeblaScreenState();
}

class _QeblaScreenState extends State<QeblaScreen> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

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
        return FutureBuilder(
          future: _deviceSupport,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) return const LoadingIndicator();
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );
            }
            if (snapshot.data !=null) {
                return QiblahCompass();
              } else {
              return const LocationErrorWidget(
                error: "No cublas Found",
              );
            }
          },
        );
      }, listener: (context, state) {

      },),
    );
  }
}
