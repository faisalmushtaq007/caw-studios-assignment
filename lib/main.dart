
import 'package:caw_studios_assessment/providers/post_provider.dart';
import 'package:caw_studios_assessment/providers/theme_provider.dart';
import 'package:caw_studios_assessment/screens/auth/signin_page.dart';
import 'package:caw_studios_assessment/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future<void> main() async{
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: Colors.white,
   statusBarIconBrightness: Brightness.dark,
));
      await initialization(null);
  runApp(MultiProvider(providers: [
         ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider()),
         ChangeNotifierProvider<PostProvider>(
          create: (context) => PostProvider()),
  ], child: MyApp(),));

}


Future initialization(BuildContext? context) async {
  // load resources
  await Future.delayed(Duration(seconds: 3), () {
    FlutterNativeSplash.remove();
  });
}


class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        return MaterialApp(
           debugShowCheckedModeBanner: false,
          title: 'Caw Studios',
           themeMode: value.themeMode,
            darkTheme: Helper.darkTheme.copyWith(
                textTheme: GoogleFonts.poppinsTextTheme(
                  Theme.of(context).textTheme,
                ),
                unselectedWidgetColor: Colors.grey.shade300,
                hintColor: Colors.grey.shade600),
            theme: Helper.lightTheme.copyWith(
              textTheme: GoogleFonts.poppinsTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
            home: SignInPage(),
        );
      }
    );
  }
}

