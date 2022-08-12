import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raftlabs_assignment/config/constants/app_strings.dart';
import 'package:raftlabs_assignment/presentation/logic/firstModule/first_module_cubit.dart';

class InitialWidget extends StatelessWidget {
  const InitialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text(AppStrings.fetchData),
        onPressed: () => context.read<FirstModuleCubit>().fetchData(),
      ),
    );
  }
}
