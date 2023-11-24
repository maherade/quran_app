import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/componants/componants.dart';
import 'package:islami_app/presentation/screens/azkar_alsabah/widgets/azkar_content.dart';
import 'package:islami_app/styles/color_manager.dart';
import 'package:islami_app/widgets/side_menu.dart';

class AzkarAlsabahScreen extends StatelessWidget {
  const AzkarAlsabahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("0.0.0.0${AppCubit.get(context).azkarModel}");
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorManager.grey,
      appBar: defaultAppBar(
        title: "أذكار الصباح",
        isSideMenuShawn: false,
        context: context,
      ),
      drawer: const SideMenu(),
      body: BlocConsumer<AppCubit, AppState>(
        builder: (context, state) {
          return const Padding(
            padding: EdgeInsets.all(10),
            child: AzkarAlsabahContent(),
          );
        },
        listener: (context, state) {},
      ),
    ));
  }
}
