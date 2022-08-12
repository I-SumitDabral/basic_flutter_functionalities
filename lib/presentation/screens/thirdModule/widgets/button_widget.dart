import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raftlabs_assignment/presentation/logic/locationCubit/location_cubit_cubit.dart';
import 'package:raftlabs_assignment/presentation/logic/secondModule/second_module_cubit.dart';
import 'package:raftlabs_assignment/presentation/shared/helper_widgets.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<LocationCubitCubit, LocationCubitState>(
            builder: ((context, state) => state.when(
                initial: () => const SizedBox.shrink(),
                fetched: (data) => Text("You are ${data.round()} KM away"),
                error: (type) => Text(type.toString())))),
        verticalSpaceLarge,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            elevatedButton("Fetch Location", () {
              context.read<LocationCubitCubit>().fetchLocation();
            }),
            elevatedButton("Clear Data", () {
              context.read<LocationCubitCubit>().clearLocalData().then(
                  (value) => context.read<SecondModuleCubit>()..fetchData());
            }),
          ],
        ),
      ],
    );
  }

  Widget elevatedButton(String text, VoidCallback onPressed) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}
