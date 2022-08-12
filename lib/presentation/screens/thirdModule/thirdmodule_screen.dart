import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:raftlabs_assignment/presentation/screens/thirdModule/widgets/connection_result.dart';
import 'package:raftlabs_assignment/presentation/screens/thirdModule/widgets/greeting_widget.dart';

import 'widgets/button_widget.dart';

class ThirdModuleScreen extends StatelessWidget {
  const ThirdModuleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:const  [
         GreetingWidget(), ConnectionResultWidget(), ButtonWidget()],
    );
  }
}
