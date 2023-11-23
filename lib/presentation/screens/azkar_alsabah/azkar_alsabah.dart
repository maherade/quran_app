import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/componants/componants.dart';
import 'package:islami_app/styles/color_manager.dart';
import 'package:islami_app/widgets/side_menu.dart';

class AzkarAlsabah extends StatelessWidget {
  String dekr;

  AzkarAlsabah({required this.dekr, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorManager.grey,
      appBar: defaultAppBar(
        title: "أذكار الصباح",
        isSideMenuShawn: true, context: context,
      ),
      drawer: const SideMenu(),
      body: BlocConsumer<AppCubit, AppState>(
        builder: (context, state) {

          return Padding(padding: EdgeInsets.all(10),


          );
        },
        listener: (context, state) {},
      ),
    ));
  }
}
