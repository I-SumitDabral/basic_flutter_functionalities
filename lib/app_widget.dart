import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raftlabs_assignment/config/animations/fadepageroute_transition.dart';
import 'package:raftlabs_assignment/config/constants/static_data.dart';
import 'package:raftlabs_assignment/config/routing/app_routes.dart';
import 'package:raftlabs_assignment/di/injection.dart';
import 'package:raftlabs_assignment/presentation/handler/audio_handler.dart';
import 'package:raftlabs_assignment/presentation/logic/home/home_cubit.dart';
import 'package:raftlabs_assignment/presentation/logic/loading/loading_cubit.dart';

import 'config/routing/app_routing.dart';
import 'presentation/screens/loading/loading_screen.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with WidgetsBindingObserver {
  late final HomeCubit _homeCubit;
  late final LoadingCubit _loadingCubit;
  AudioHandler? _audioHandler;
  @override
  void initState() {
    _homeCubit = getIt<HomeCubit>();
    _loadingCubit = getIt<LoadingCubit>();
    setUpAudioHandler();
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  Future<void> setUpAudioHandler() async {
    _audioHandler = await AudioService.init(
        builder: () => AudioPlayerHandler(), config: StaticData.config);
    _audioHandler?.play();
  }

  @override
  void dispose() {
    _homeCubit.close();
    _loadingCubit.close();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _audioHandler?.play();

        break;
      case AppLifecycleState.inactive:
        _audioHandler?.pause();
        break;
      case AppLifecycleState.paused:
        _audioHandler?.pause();
        break;
      case AppLifecycleState.detached:
        _audioHandler?.pause();
        break;
    }
  }

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 752),
      // builder: (context) =>MultiN
      builder: (BuildContext context, Widget? child) =>
          MultiBlocProvider(providers: [
        BlocProvider<HomeCubit>.value(value: _homeCubit),
        BlocProvider<LoadingCubit>.value(value: _loadingCubit),
      ], child: child!),
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        // theme: ThemeData(
        //   appBarTheme: AppBarTheme(
        //     iconTheme: const IconThemeData(color: Colors.black),
        //     titleTextStyle: TextStyle(
        //       color: Colors.black,
        //       fontSize: 18.sp,
        //       fontWeight: FontWeight.w600,
        //     ),
        //     backgroundColor: Colors.white,
        //     centerTitle: true,
        //   ),
        //   scaffoldBackgroundColor: Colors.white,
        // ),
        builder: (context, child) {
          return LoadingScreen(
            screen: child,
          );
        },
        initialRoute: AppRoutes.initialRoute,
        onGenerateRoute: (RouteSettings settings) {
          final routes = Routes.getRoutes(settings);
          final WidgetBuilder? builder = routes[settings.name];
          return FadePageRouteBuilder(
            builder: builder!,
            settings: settings,
          );
        },
      ),
    );
  }
}
