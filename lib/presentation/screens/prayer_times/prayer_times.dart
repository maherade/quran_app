import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/styles/color_manager.dart';
import 'package:islami_app/widgets/side_menu.dart';

class PrayerTimes extends StatelessWidget {
  const PrayerTimes({super.key});

  static List<String> prayTimesName=[
    'الفجر',
    'الشروق',
    'الظهر',
    'العصر',
    'المغرب',
    'العشاء',
  ];

  static List<String> prayTimesImages=[
    'fajr',
    'sunrise',
    'dhuhr',
    'asr',
    'maghrib',
    'isha',
  ];

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppState>(
        listener: (context,state){

        },
        builder: (context,state){
          var cubit=AppCubit.get(context);
          List<String> prayTimesList=[];
          String prayName='';
          String nextPrayTime='';

          if(cubit.prayModel !=null){

            prayTimesList =[
              '${cubit.prayModel!.data!.timings!.fajr}',
              '${cubit.prayModel!.data!.timings!.sunrise}',
              '${cubit.prayModel!.data!.timings!.dhuhr}',
              '${cubit.prayModel!.data!.timings!.asr}',
              '${cubit.prayModel!.data!.timings!.maghrib}',
              '${cubit.prayModel!.data!.timings!.isha}',
            ];

            var format = DateFormat("hh:mm");
            var now = format.parse('${DateTime.now().hour}:${DateTime.now().minute}');
            var fajr = format.parse('${cubit.prayModel!.data!.timings!.fajr}');
            var dhuhr = format.parse('${cubit.prayModel!.data!.timings!.dhuhr}');
            var asr = format.parse('${cubit.prayModel!.data!.timings!.asr}');
            var maghrib = format.parse('${cubit.prayModel!.data!.timings!.maghrib}');
            var isha = format.parse('${cubit.prayModel!.data!.timings!.isha}');

            if(dhuhr.difference(now).isNegative && now.difference(asr).isNegative){
              prayName='الظهر';
              nextPrayTime='${cubit.prayModel!.data!.timings!.asr}';
            }
            else if(asr.difference(now).isNegative && now.difference(maghrib).isNegative){
              prayName='العصر';
              nextPrayTime='${cubit.prayModel!.data!.timings!.maghrib}';
            }
            else if(maghrib.difference(now).isNegative && now.difference(isha).isNegative){
              prayName='المغرب';
              nextPrayTime='${cubit.prayModel!.data!.timings!.isha}';
            }
            else if(isha.difference(now).isNegative ){
              prayName='العشاء';
              nextPrayTime='${cubit.prayModel!.data!.timings!.fajr}';
            }
            else{
              prayName='الفجر';
              nextPrayTime='${cubit.prayModel!.data!.timings!.dhuhr}';
            }

          }

          return Scaffold(

            appBar: AppBar(
              toolbarHeight: 0.0,
              elevation: 0.0,
            ),

            body: cubit.prayModel !=null?
            SafeArea(
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/back.jpg'),
                        opacity: .9
                    )
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*.32,
                      width: double.infinity,

                      child: Stack(
                        children: [

                          /// row [city - country]
                          Positioned(
                            top: MediaQuery.of(context).size.height*.03,
                            left: MediaQuery.of(context).size.height*.04,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height*.005,
                                  horizontal: MediaQuery.of(context).size.height*.02
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: ColorManager.darkGrey.withOpacity(.5)
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: ColorManager.white,
                                    size: 17,
                                  ),

                                  Text(
                                    'القاهره,مصر',
                                    style: TextStyle(
                                        color: ColorManager.white,
                                        fontSize: 14
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),

                          /// text
                          Positioned(
                            top: MediaQuery.of(context).size.height*.09,
                            left: MediaQuery.of(context).size.width*.4,
                            child: Text(prayName,style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*.07,
                                color: ColorManager.primaryColor
                            ),),
                          ),

                          /// text [time]
                          Positioned(
                            top: MediaQuery.of(context).size.height*.17,
                            left: MediaQuery.of(context).size.width*.40,
                            child:  Text('${DateTime.now().hour}:${DateTime.now().minute}',style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*.07,
                                color: ColorManager.white
                            ),),
                          ),

                          /// text
                          Positioned(
                            top: MediaQuery.of(context).size.height*.25,
                            left: MediaQuery.of(context).size.width*.32,
                            child:  Text(' الصلاه القادمه في $nextPrayTime',style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*.025,
                                color: ColorManager.white
                            ),),
                          ),
                        ],
                      ),
                    ),


                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.height*.03
                        ),
                        width: double.infinity,
                        decoration:  BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: ColorManager.white.withOpacity(.95),

                        ),
                        child: Column(
                          children: [


                            SizedBox(height: MediaQuery.of(context).size.height*.02,),

                            /// text
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text(
                                '${cubit.prayModel!.data!.date!.hijri!.weekday!.ar} ${cubit.prayModel!.data!.date!.hijri!.day} ${cubit.prayModel!.data!.date!.hijri!.month!.ar} ${cubit.prayModel!.data!.date!.hijri!.year}',
                                style: TextStyle(
                                    color: ColorManager.black,
                                    fontSize: MediaQuery.of(context).size.height*.03
                                ),
                              ),
                            ),

                            SizedBox(height: MediaQuery.of(context).size.height*.03,),

                            /// Listview
                            SizedBox(
                              height: MediaQuery.of(context).size.height*.5,
                              child: ListView.separated(
                                  itemBuilder: (context,index){
                                    return  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [

                                        /// Image
                                        Image(
                                          image: AssetImage('assets/images/${prayTimesImages[index]}.png'),
                                          height: MediaQuery.of(context).size.height*.05,
                                          width: MediaQuery.of(context).size.height*.03,
                                        ),

                                        SizedBox(width: MediaQuery.of(context).size.height*.01,),

                                        /// Text
                                        Text(
                                          prayTimesName[index],
                                          style: TextStyle(
                                              color: ColorManager.black,
                                              fontSize: MediaQuery.of(context).size.height*.035
                                          ),
                                        ),


                                        const Spacer(),

                                        /// Time
                                        Text(
                                          prayTimesList[index],
                                          style: TextStyle(
                                              color: ColorManager.black,
                                              fontSize: MediaQuery.of(context).size.height*.035
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context,index){
                                    return const SizedBox(height: 20,);
                                  },
                                  itemCount: prayTimesName.length
                              ),
                            ),
                          ],
                        ),

                      ),
                    )
                  ],
                ),
              ),
            ):
            const Center(child: CircularProgressIndicator(),)

          );
        },
    );
  }
}
