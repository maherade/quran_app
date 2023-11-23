import 'package:flutter/material.dart';
import 'package:islami_app/styles/color_manager.dart';

class SideMenuCard extends StatelessWidget {
  String title;
  String image;
  Function()? onTap;
   SideMenuCard({required this.onTap, required this.title, required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.sizeOf(context).height*.1,
        width: MediaQuery.sizeOf(context).width * .6,
          decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.4),
                  spreadRadius: 1,
                  blurRadius: 1,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Image.asset(
                  image,
                  width: MediaQuery.sizeOf(context).width * .11,
                  height: MediaQuery.sizeOf(context).height * .11,
                ),
              ],
            ),
          )),
    );
  }
}
