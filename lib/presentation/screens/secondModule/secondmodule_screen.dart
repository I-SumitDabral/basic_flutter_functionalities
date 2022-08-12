import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/secondModule/second_module_cubit.dart';
import 'widgets/datafetched_widget.dart';

class SecondModuleScreen extends StatefulWidget {
  const SecondModuleScreen({Key? key}) : super(key: key);

  @override
  State<SecondModuleScreen> createState() => _SecondModuleScreenState();
}

class _SecondModuleScreenState extends State<SecondModuleScreen> {
  @override
  void initState() {
    context.read<SecondModuleCubit>().fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SecondModuleCubit, SecondModuleState>(
          builder: ((context, SecondModuleState state) => state.when(
                initial: () => Container(
                  color: Colors.green,
                ),
                fetched: (value) => DataRetrivedWidget(data: value),
                error: (error) => Center(
                  child: Text(error.message),
                ),
              ))),
    );
  }
}
