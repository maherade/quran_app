import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/presentation/screens/prayer_times/widgets/countries_bottom_sheet.dart';
import 'package:islami_app/styles/color_manager.dart';

import '../../../data/models/ads_model/ads_model.dart';

class PrayerTimes extends StatefulWidget {
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
  State<PrayerTimes> createState() => _PrayerTimesState();
}

class _PrayerTimesState extends State<PrayerTimes> {
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
            body: cubit.prayModel !=null?
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/back.jpg'),
                      opacity: .9
                  )
              ),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*.04),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*.32,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        /// row [city - country]
                        GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                context: context,
                                builder: (context){
                                  return  const CountriesBottomSheet();
                                }
                            );
                          },
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Positioned(
                              top: MediaQuery.of(context).size.height*.07,
                              // left: MediaQuery.of(context).size.height*.04,
                              child: Container(
                                margin: EdgeInsets.fromLTRB( MediaQuery.of(context).size.height*.02,MediaQuery.of(context).size.height*.02, 0, 0),
                                width: MediaQuery.of(context).size.height*.17,
                                padding: EdgeInsets.symmetric(
                                    vertical: MediaQuery.of(context).size.height*.01,
                                    horizontal: MediaQuery.of(context).size.height*.02
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: ColorManager.darkGrey.withOpacity(.5)
                                ),
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.location_pin,
                                      color: ColorManager.white,
                                      size: 17,
                                    ),

                                    Text(
                                      cubit.countryList[cubit.indexValue],
                                      style: const TextStyle(
                                          color: ColorManager.white,
                                          fontSize: 12
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        /// text
                        Positioned(
                          top: MediaQuery.of(context).size.height*.04,
                          // left: MediaQuery.of(context).size.width*.4,
                          child: Text(prayName,style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height*.065,
                              color: ColorManager.primaryColor
                          ),),
                        ),
                        /// text [time]
                        Positioned(
                          top: MediaQuery.of(context).size.height*.13,
                          // left: MediaQuery.of(context).size.width*.42,
                          child:  Text('${DateTime.now().hour}:${DateTime.now().minute}',style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height*.05,
                              color: ColorManager.darkGrey
                          ),),
                        ),
                        /// text
                        Positioned(
                          top: MediaQuery.of(context).size.height*.22,
                          // left: MediaQuery.of(context).size.width*.32,
                          child:  Text(' الصلاه القادمه في $nextPrayTime',style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height*.025,
                              color: ColorManager.darkGrey
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
                        color: ColorManager.darkGrey.withOpacity(.95),

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
                                  color: ColorManager.lightColor,
                                  fontSize: MediaQuery.of(context).size.height*.027
                              ),
                            ),
                          ),

                          /// Listview
                          SizedBox(
                            height: MediaQuery.of(context).size.height*.5,
                            child: ListView.separated(
                                padding: EdgeInsets.zero,
                                itemBuilder: (context,index){
                                  return  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      /// Image
                                      Image(
                                        image: AssetImage('assets/images/${PrayerTimes.prayTimesImages[index]}.png'),
                                        height: MediaQuery.of(context).size.height*.05,
                                        width: MediaQuery.of(context).size.height*.03,
                                      ),

                                      SizedBox(width: MediaQuery.of(context).size.height*.01,),

                                      /// Text
                                      Text(
                                        PrayerTimes.prayTimesName[index],
                                        style: TextStyle(
                                            color: ColorManager.lightColor,
                                            fontSize: MediaQuery.of(context).size.height*.03
                                        ),
                                      ),


                                      const Spacer(),

                                      /// Time
                                      Text(
                                        prayTimesList[index],
                                        style: TextStyle(
                                            color: ColorManager.lightColor,
                                            fontSize: MediaQuery.of(context).size.height*.03
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (context,index){
                                  return const SizedBox(height: 10,);
                                },
                                itemCount: PrayerTimes.prayTimesName.length
                            ),
                          ),
                          AdmobBanner(
                              adUnitId:
                              AdsModel.getBannerAd(),
                              adSize: AdmobBannerSize
                                  .FULL_BANNER),
                        ],
                      ),

                    ),
                  )
                ],
              ),
            ):
            const Center(child: CircularProgressIndicator(),)

          );
        },
    );
  }
}
