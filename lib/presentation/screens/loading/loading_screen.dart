import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raftlabs_assignment/presentation/logic/loading/loading_cubit.dart';
import 'package:raftlabs_assignment/presentation/screens/loading/widgets/loading_lottie.dart';

class LoadingScreen extends StatelessWidget {
  final Widget? screen;
  const LoadingScreen({Key? key, this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingCubit, bool>(
      builder: (context, state) {
        return Stack(
          children: [
            screen ?? const SizedBox.shrink(),
            if (state)
              Container(
                  decoration:
                      BoxDecoration(color: Colors.black45.withOpacity(0.5)),
                  alignment: Alignment.center,
                  child: const LoadingLottieWidget()),
          ],
        );
      },
    );
  }
}
