import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(supportedLocales: const [
      Locale("en", "US"),
      Locale("ur", "UR"),
    ], path: "assets/resources",saveLocale: true,child: const MyApp(),)
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Easy Localizations"),
          centerTitle: true,
        ),
        body: Center(
          child: Text("about".tr()),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () {
              setState(() {
                context.setLocale(Locale("en", "US"));
              });
            }, child: Text("English")),

            ElevatedButton(onPressed: () {
              setState(() {
                context.setLocale(Locale("ur", "UR"));
              });
            }, child: Text("Urdu"))
          ],
        )
      ),
    );
  }
}
