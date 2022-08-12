import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raftlabs_assignment/config/constants/static_data.dart';
import 'package:raftlabs_assignment/presentation/logic/home/home_cubit.dart';
import 'package:raftlabs_assignment/presentation/screens/home/widgets/home_body.dart';
import 'package:raftlabs_assignment/presentation/screens/home/widgets/home_navbar.dart';

import '../../../di/injection.dart';
import '../../logic/connectionCubit/connection_cubit.dart';
import '../../logic/firstModule/first_module_cubit.dart';
import '../../logic/locationCubit/location_cubit_cubit.dart';
import '../../logic/secondModule/second_module_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: const Text(
          "Test App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white.withOpacity(0.95),
      bottomNavigationBar: const HomeNavBarWidget(),
      body: MultiBlocProvider(providers: [
        BlocProvider<FirstModuleCubit>(
          create: ((context) => getIt<FirstModuleCubit>()),
        ),
        BlocProvider<SecondModuleCubit>(
            create: ((context) => getIt<SecondModuleCubit>()..fetchData())),
        BlocProvider<ConnectionCubit>(
          create: ((context) => getIt<ConnectionCubit>()..checkonnection()),
        ),
        BlocProvider<LocationCubitCubit>(
          create: (context) => getIt<LocationCubitCubit>(),
        ),
      ], child: const HomeBodyWidget()),
    );
  }
}
