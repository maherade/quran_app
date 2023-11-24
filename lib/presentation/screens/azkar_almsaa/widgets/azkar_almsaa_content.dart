import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/styles/color_manager.dart';

class AzkarAlmsaaContent extends StatelessWidget {
  // int? index;
   const AzkarAlmsaaContent({ super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
   },
  builder: (context, state) {
    var cubit = AppCubit.get(context);
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * .7,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.lightColor2,
        borderRadius: BorderRadius.circular(15),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              cubit.azkarModel!.category!,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.black,
              fontSize: 20
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Text(
              cubit.azkarModel!.content!,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.black),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Text(
              cubit.azkarModel!.reference??"الشرح",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.black,
                  fontSize: 20
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),

            Text(
              cubit.azkarModel!.description!,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.black,),
              textAlign:  TextAlign.start,
            ),

          ],
        ),
      ),
    );
  },
);

  }
}
