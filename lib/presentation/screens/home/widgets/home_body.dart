import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raftlabs_assignment/data/core/client/location_client.dart';
import 'package:raftlabs_assignment/presentation/logic/firstModule/first_module_cubit.dart';
import 'package:raftlabs_assignment/presentation/logic/locationCubit/location_cubit_cubit.dart';
import 'package:raftlabs_assignment/presentation/screens/firstModule/firstmodule_screen.dart';
import 'package:raftlabs_assignment/presentation/screens/secondModule/secondmodule_screen.dart';
import 'package:raftlabs_assignment/presentation/screens/thirdModule/thirdmodule_screen.dart';

import '../../../../di/injection.dart';
import '../../../logic/connectionCubit/connection_cubit.dart';
import '../../../logic/home/home_cubit.dart';
import '../../../logic/secondModule/second_module_cubit.dart';
import '../../fourthModule/fourth_module_screen.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.index) {
          case 0:
            return const FirstModuleScreen();
          case 1:
            return const SecondModuleScreen();
          case 2:
            return const ThirdModuleScreen();
          default:
            return const FourthModuleScreen();
        }
      },
    );
  }
}
