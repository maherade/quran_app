import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
import 'package:islami_app/utiles/local/cash_helper.dart';
import 'package:islami_app/utiles/remote/audio_dio_helper.dart';
import 'business_logic/localization_cubit/app_localization.dart';
import 'business_logic/localization_cubit/localization_cubit.dart';
import 'business_logic/localization_cubit/localization_states.dart';
import 'presentation/screens/splash_screen/splash_screen.dart';
import 'utiles/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  await DioHelper.dioInit();
  await AudioDioHelper.dioInit();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState(){
    FlutterNativeSplash.remove();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
            AppCubit()
              ..getSurah()

        ),
        BlocProvider(
            create: (BuildContext context) =>
            LocalizationCubit()
              ..fetchLocalization()),

      ],
      child: BlocConsumer<LocalizationCubit, LocalizationStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // appBarTheme: const AppBarTheme(
              //   systemOverlayStyle: SystemUiOverlayStyle(
              //     statusBarIconBrightness: Brightness.dark,
              //     statusBarColor: ColorManager.white,
              //   ),
              // ),
            ),
            home: const SplashScreen(),
            localizationsDelegates:   const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale("en", ""),
              Locale("ar", ""),
            ],
            locale: LocalizationCubit.get(context).appLocal,
            localeResolutionCallback: (currentLang, supportLang) {
              if (currentLang != null) {
                for (Locale locale in supportLang) {
                  if (locale.languageCode == currentLang.languageCode) {
                    return currentLang;
                  }
                }
              }
              return supportLang.first;
            },
          );
        },
      ),
    );
  }
}

