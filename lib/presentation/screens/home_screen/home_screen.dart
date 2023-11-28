import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/componants/componants.dart';
import 'package:islami_app/presentation/screens/quran_screen/quran_screen.dart';
import 'package:islami_app/styles/color_manager.dart';

class HomeScreen extends StatelessWidget {

  static bool pinned = true;
  static bool snap = false;
  static bool floating = false;
  static var searchController=TextEditingController();
  static var pageController=PageController();

  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
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

            body: CustomScrollView(
              slivers: [

                SliverAppBar(
                  titleSpacing: 0.0,
                  expandedHeight: size.height*.44,
                  pinned: pinned,
                  snap: snap,
                  floating: floating,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding:EdgeInsets.zero,
                    title: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/back.jpg'),
                              opacity: .9
                          )
                      ),
                      child: Stack(
                        children: [

                          /// row [city - country]
                          Positioned(
                            top: MediaQuery.of(context).size.height*.25,
                            left: MediaQuery.of(context).size.height*.02,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: MediaQuery.of(context).size.height*.01
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: ColorManager.darkGrey.withOpacity(.5)
                              ),
                              child:  Text(
                                'القاهره,مصر',
                                style: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: MediaQuery.of(context).size.height*.01,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),

                          /// text
                          Positioned(
                            top: MediaQuery.of(context).size.height*.28,
                            left: MediaQuery.of(context).size.width*.27,
                            child: Text('$prayName',style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*.04,
                                color: ColorManager.primaryColor
                            ),),
                          ),

                          /// text [time]
                          Positioned(
                            top: MediaQuery.of(context).size.height*.35,
                            left: MediaQuery.of(context).size.width*.27,
                            child:  Text('${DateTime.now().hour}:${DateTime.now().minute}',style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*.03,
                                color: ColorManager.white
                            ),),
                          ),

                          /// text
                          Positioned(
                            top: MediaQuery.of(context).size.height*.415,
                            left: MediaQuery.of(context).size.width*.23,
                            child:  Text('الصلاه القادمه في $nextPrayTime',style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*.014,
                                color: ColorManager.white
                            ),),
                          ),
                        ],
                      ),
                    ),
                    ),
                  centerTitle: true,
                ),

                SliverToBoxAdapter(
                  child: Container(
                    color: ColorManager.darkGrey,
                    child: Column(
                      children: [

                        GridView.count(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          childAspectRatio: 1/1,
                            crossAxisCount: 2,
                            children: List.generate(cubit.sectionTitles.length, (index) =>

                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (_){
                                      return cubit.sectionWidget[index];
                                    }));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Material(
                                      elevation: 10,
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: ColorManager.white.withOpacity(.5),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image(
                                                image: AssetImage(cubit.sectionImages[index]),
                                                height: MediaQuery.of(context).size.height*.1,
                                                width: MediaQuery.of(context).size.height*.1,
                                              ),

                                              Text(cubit.sectionTitles[index],style: TextStyle(
                                                color: ColorManager.darkGreen,
                                                fontSize: MediaQuery.of(context).size.height*.03,
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
                )
              ],
            )
        );
      },
    );
  }}
