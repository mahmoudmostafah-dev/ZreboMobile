import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'pages/home/home_screen.dart';
import 'router.dart';
import 'shared/languages/LanguageName.dart';
import 'shared/languages/translation.dart';
import 'shared/network/remote/dio_helper.dart';
import 'shared/storage_names.dart';
import 'shared/styles/theme.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();

  // await AppDatabase.instance;
  await DioHelper.init();

  await GetStorage.init();
  //
  // runApp(
  //   const MyApp(),
  // );
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //useInheritedMediaQuery: true,
      // builder: DevicePreview.appBuilder,

      // initialRoute: GetStorage().read(StorageNames.tokenBox) == null
      //     ? LoginScreen.routeName
      //     : HomeScreen.routeName,
      initialRoute: HomeScreen.routeName,

      getPages: AppRouter.pages,

      themeMode: //ThemeMode.light,

          GetStorage().read<bool>(StorageNames.isDarkBox) == false ||
                  GetStorage().read<bool>(StorageNames.isDarkBox) == null
              ? ThemeMode.light
              : ThemeMode.dark,

      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,

      //Locale
      translations: MyTranslation(),
      locale: Locale(
          GetStorage().read<String>(StorageNames.langBox) ?? LanguageName.ar),
      fallbackLocale: Locale(LanguageName.ar),

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale(LanguageName.ar),
        Locale(LanguageName.en),
      ],

      localeResolutionCallback: (currentLang, supportLang) {
        if (currentLang != null) {
          for (Locale locale in supportLang) {
            if (locale.languageCode == currentLang.languageCode) {
              GetStorage().write("lang", currentLang.languageCode);

              return currentLang;
            }
          }
        }
        return supportLang.first;
      },
    );
  }
}
