import 'package:bmi_test/constants.dart';
import 'package:bmi_test/core/utils/cache_helper.dart';
import 'package:bmi_test/features/home/presentaion/views/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observe.dart';
import 'features/home/manager/home cubit/home_cubit.dart';
import 'features/splash/presentaion/views/splash_view.dart';
import 'firebase_options.dart';
Future <void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  Widget widget;
  uId=CacheHelper.getData(key:'uId');
  if(uId !=null)
    {
      widget=HomeView();
    }
  else widget= SplashView();

  runApp( MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
   MyApp({super.key, required this.startWidget});
   final Widget startWidget;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return HomeCubit()..getData(); },
      child: MaterialApp(
        theme: ThemeData(
          //appBarTheme: AppBarTheme(color: Colors.blue),
          useMaterial3: true,
        ),
        home:startWidget,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


