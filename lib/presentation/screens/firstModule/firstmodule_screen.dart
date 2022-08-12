import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:raftlabs_assignment/presentation/logic/firstModule/first_module_cubit.dart';
import 'package:raftlabs_assignment/presentation/screens/firstModule/widgets/intital_widget.dart';

import 'widgets/datafetched_widget.dart';

class FirstModuleScreen extends StatelessWidget {
  const FirstModuleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<FirstModuleCubit, FirstModuleState>(
        builder: (context, state) => state.when(
          initial: () => const InitialWidget(),
          fetched: (data) => DataFetchedWidget(data: data),
          error: (error) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(error.message), const InitialWidget()],
          ),
          scrolled: (data) => DataFetchedWidget(data: data),
        ),
      ),
    );
  }
}
