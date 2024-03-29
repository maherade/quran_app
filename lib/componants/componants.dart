import 'package:flutter/material.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/styles/color_manager.dart';

AppBar defaultAppBar({required BuildContext context, required String title,isSideMenuShawn = false}) {
  return AppBar(
    iconTheme: const IconThemeData(color: Colors.black),
    backgroundColor: ColorManager.darkGrey,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),

      ),
      centerTitle: true,
      title: Text(title,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
        color: ColorManager.white,
        fontSize: MediaQuery.of(context).size.height*.03,
      )),
      leading:IconButton(onPressed: (){
        Navigator.pop(context);
        AppCubit.get(context).player.stop();
        AppCubit.get(context).test='';
      }, icon: const Icon(Icons.arrow_back_ios,color: ColorManager.white,size: 15,))
  );
}