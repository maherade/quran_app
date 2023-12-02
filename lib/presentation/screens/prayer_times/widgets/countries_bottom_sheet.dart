import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/styles/color_manager.dart';

class CountriesBottomSheet extends StatelessWidget {
  const CountriesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(builder: (context, state) {
      var cubit = AppCubit.get(context);
      return Container(
        height: MediaQuery.of(context).size.height*.6,
        width: double.infinity,
        child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*.02,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorManager.textColor,
                ),
                height: MediaQuery.of(context).size.height*.006,
                width: MediaQuery.of(context).size.width*.2,

              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15
                  ),
                  child: ListView.separated(
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            cubit.changeCountry(context, index);
                          },
                          child: Text(cubit.countryList[index],style: TextStyle(
                              color: ColorManager.white,
                              fontSize: MediaQuery.of(context).size.height*.025
                          ),),
                        );
                      },
                      separatorBuilder: (context,index){
                        return const SizedBox(height: 10,);
                      },
                      itemCount: cubit.countryList.length
                  ),
                ),
              )
            ]
        ),
      );
    }, listener: (context, state) {

    },);
  }
}
