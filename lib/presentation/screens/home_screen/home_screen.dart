import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
 import 'package:islami_app/styles/color_manager.dart';

import '../../../data/models/ads_model/ads_model.dart';

class HomeScreen extends StatefulWidget {

  static bool pinned = true;
  static bool snap = false;
  static bool floating = false;
  static var searchController=TextEditingController();
  static var pageController=PageController();

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    AppCubit.get(context).interstitialAd= AdmobInterstitial(
      adUnitId: AdsModel.getInitAd(),
      listener:(AdmobAdEvent event, Map<String, dynamic>? args) {
        if (event == AdmobAdEvent.closed) {
          AppCubit.get(context).interstitialAd!.load();
        }
      },

    );
    AppCubit.get(context).interstitialAd!.load();
  }

  @override
  void dispose() {
    AppCubit.get(context).interstitialAd!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return BlocConsumer<AppCubit,AppState>(
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
            backgroundColor: ColorManager.white,
            appBar: AppBar(
              toolbarHeight: 0.0,
            ),
            body: cubit.prayModel == null ? const Center(child: CircularProgressIndicator(),) : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    Container(
                      height: MediaQuery.of(context).size.height*.3,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/muslam.jpg'),
                        )
                      ),
                      child: Stack(
                        children: [

                          /// text
                          Positioned(
                            right: MediaQuery.of(context).size.width*.05,
                            child: Text(prayName,style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*.06,
                                color: ColorManager.browenDark
                            ),),
                          ),

                          /// text [time]
                          Positioned(
                            top: MediaQuery.of(context).size.height*.12,
                            right: MediaQuery.of(context).size.width*.02,
                            child:   Text(' الصلاه القادمه في $nextPrayTime',style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*.025,
                                color: ColorManager.browenDark
                            ),)
                          ),

                          /// text

                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              alignment: Alignment.center,
                              decoration:BoxDecoration(
                                  color: ColorManager.browenDark.withOpacity(.9),
                                  borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  topLeft: Radius.circular(15),
                                )
                              ),
                              height: MediaQuery.of(context).size.height*.07,
                              width: double.infinity,
                              child: Text(
                                '${cubit.prayModel!.data!.date!.hijri!.weekday!.ar} ${cubit.prayModel!.data!.date!.hijri!.day} ${cubit.prayModel!.data!.date!.hijri!.month!.ar} ${cubit.prayModel!.data!.date!.hijri!.year}',
                                style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.height*.027,
                              ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      color: ColorManager.darkWhite,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AdmobBanner(
                                adUnitId:
                                AdsModel.getBannerAd(),
                                adSize: AdmobBannerSize
                                    .FULL_BANNER),
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height*.01,),

                          GridView.count(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            childAspectRatio: 1/1.2,
                            crossAxisCount: 3,
                            children: List.generate(cubit.sectionTitles.length, (index) =>

                                GestureDetector(
                                  onTap: (){
                                    cubit.interstitialAd!.show();
                                    Navigator.push(context, MaterialPageRoute(builder: (_){
                                      return cubit.sectionWidget[index];
                                    }));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Material(
                                      elevation: 2,
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: ColorManager.browen.withOpacity(.95),
                                        ),
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image(
                                                image: AssetImage(cubit.sectionImages[index]),
                                                height: MediaQuery.of(context).size.height*.05,
                                                width: MediaQuery.of(context).size.height*.05,
                                              ),

                                              Text(cubit.sectionTitles[index],style: TextStyle(
                                                color: ColorManager.browenDark,
                                                fontSize: MediaQuery.of(context).size.height*.025,
                                              )),
                                            ]
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          )

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        );
      },
    );
  }}
