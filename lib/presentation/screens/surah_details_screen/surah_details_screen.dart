import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/componants/componants.dart';
import 'package:islami_app/presentation/screens/surah_details_screen/widgets/surah_content_widget.dart';
import 'package:islami_app/presentation/screens/tafseer_screen/tafseer_screen.dart';
import 'package:islami_app/styles/color_manager.dart';
import '../../../business_logic/app_cubit/app_cubit.dart';
import '../../../data/models/ads_model/ads_model.dart';

class ReadingScreen extends StatefulWidget {
  String surahName;
  int index;

  ReadingScreen({required this.index, required this.surahName, super.key});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {

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
    AppCubit.get(context).player.pause();
    AppCubit.get(context).interstitialAd!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return WillPopScope(
          onWillPop: () => cubit.pausePlayer(context),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: ColorManager.darkGrey,
              appBar: defaultAppBar(
                title: widget.surahName,
                isSideMenuShawn: true,
                context: context,
              ),

              body: cubit.ayahContent!.isEmpty
                  ? const Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.browenDark,
                  ))
                  : Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return SurahContentWidget(
                          index: index,
                          onTap: () {
                            cubit.getTafseer(
                              tafseerId: 1,
                              suraNumber: widget.index,
                              ayahNumber: AppCubit.get(context).ayahContent![index].numberInSurah,).then((value) {
                              return Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                    TafseerScreen(
                                        index: widget.index,
                                        surahName: widget.surahName),));
                            });
                          },
                        );
                      },
                      itemCount: cubit.ayahContent!.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox();
                      },
                    ),
                  ),
                  AdmobBanner(
                      adUnitId: AdsModel.getBannerAd(),
                      adSize: AdmobBannerSize.BANNER),

                  Container(
                    margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: ColorManager.browenDark,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: MediaQuery.sizeOf(context).height * .12,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: ColorManager.browen,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: IconButton(
                                onPressed: (){
                                  AppCubit.get(context).test==''?
                                 cubit.audioPlayerFunction(url: '${cubit.audioModel!.audioFiles![widget.index-1].audioUrl}').then((value) {
                                       setState(() {
                                         cubit.test='1';
                                       });
                                      }) :
                                      cubit.test=='0'?
                                      cubit.player.resume().then((value) {
                                        setState(() {
                                          cubit.test='1';
                                        });
                                      }):
                                      cubit.player.pause().then((value) {
                                        setState(() {
                                          cubit.test='0';
                                        });
                                      });

                                  print('///////////////////////////');
                                  print(cubit.test);
                                  print('///////////////////////////');
                            },
                              icon:  Icon(
                                cubit.test=='0'|| cubit.test==''? Icons.play_arrow_sharp:Icons.stop,
                                color: ColorManager.browenDark,
                              ),
                            ),
                          ),

                        ],
                      )
                  )
                  // LowerRow(index: widget.index,),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
