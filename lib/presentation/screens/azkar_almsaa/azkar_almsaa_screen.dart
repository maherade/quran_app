import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/componants/componants.dart';
import 'package:islami_app/presentation/screens/azkar_almsaa/widgets/azkar_almsaa_content.dart';
import 'package:islami_app/styles/color_manager.dart';
import 'package:islami_app/widgets/side_menu.dart';

import '../../../business_logic/app_cubit/app_cubit.dart';

class AzkarAlmsaaScreen extends StatelessWidget {
  const AzkarAlmsaaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    print("1.1.1.1${AppCubit.get(context).azkarModel}");
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorManager.grey,
      appBar: defaultAppBar(
        title: "أذكار المساء",
        isSideMenuShawn: false,
        context: context,
      ),
      drawer: const SideMenu(),
      body: BlocConsumer<AppCubit, AppState>(
        builder: (context, state) {
          return const Padding(
            padding: EdgeInsets.all(10),
            child: AzkarAlmsaaContent(),
          );
        },
        listener: (context, state) {},
      ),
    ));
  }
}
