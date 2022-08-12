import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raftlabs_assignment/presentation/logic/connectionCubit/connection_cubit.dart'
    as cubit;

class ConnectionResultWidget extends StatelessWidget {
  const ConnectionResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<cubit.ConnectionCubit, cubit.ConnectionState>(
        builder: ((context, state) => state.when(
            initial: () => const Text("no data"),
            connected: () => const Text("Connected to internet"),
            notConnected: () => const Text("No internet connection found"))));
  }
}
