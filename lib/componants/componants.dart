import 'package:flutter/material.dart';
import 'package:islami_app/styles/color_manager.dart';

AppBar defaultAppBar({required BuildContext context, required String title,isSideMenuShawn = false}) {
  return AppBar(
    iconTheme: const IconThemeData(color: Colors.black),
    backgroundColor: ColorManager.lightColor2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),

      ),
      centerTitle: true,
      title: Text(title,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
        color: Colors.black,
      )),
      leading: isSideMenuShawn?Builder(
        builder: (context) {
          return InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Image.asset("assets/images/menu.png",color: Colors.black.withOpacity(.9),)


              );
        },
      ):null
  );
}