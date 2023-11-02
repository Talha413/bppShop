import 'package:bpp_shop/Demo/image_2.dart';
import 'package:bpp_shop/Demo/image_demo.dart';
import 'package:bpp_shop/On_Boarding/on_boarding_page.dart';
import 'package:bpp_shop/screens/sign_in_page.dart';
import 'package:bpp_shop/screens/sign_up_page_2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'ThemeChange/theme_provider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  //await GetStorage.init();
  runApp( EasyLocalization(child: const MyApp(),
      supportedLocales: [
      Locale("en", ""),
      Locale("bn", ""),
    ],
    path: 'assets/translations',

  ));
}

// class MyApp extends HookConsumerWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context ,WidgetRef ref) {
//     //final appThemeState =ref.watch(appThemeStateNotifier);
//     final themeHelper =ref.watch(helperThemeStateNotifier);
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         //theme: appThemeState.isDarkModeEnabled? AppTheme.darkTheme :AppTheme.lightTheme,
//         theme: AppTheme.lightTheme,
//         darkTheme: AppTheme.darkTheme,
//         themeMode: themeHelper.themeMode(),
//         //themeMode:appThemeState.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light ,
//         //themeMode: ThemeMode.system,
//         home:OnBoardingPage());
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: ( context,_){
          final  themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
              title: 'Flutter Demo',
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: themeProvider.themeMode,
              home: OnBoardingPage()
          );
        }
    );
  }
}

