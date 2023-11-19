import 'package:flutter/material.dart';
import 'package:islami_app/styles/color_manager.dart';

AppBar defaultAppBar({required String title,isSideMenuShawn = false}) {
  return AppBar(
    iconTheme: const IconThemeData(color: Colors.black),
    backgroundColor: ColorManager.primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),

      ),
      centerTitle: true,
      title: Text(title,style: const TextStyle(fontSize: 25,color: Colors.black),),
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