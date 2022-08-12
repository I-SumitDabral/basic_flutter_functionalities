import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raftlabs_assignment/config/constants/app_strings.dart';

import '../../../../config/constants/static_data.dart';
import '../../../logic/home/home_cubit.dart';

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bottomNavBar;
  }

  Widget get bottomNavBar => BlocBuilder<HomeCubit, HomeState>(
      builder: ((context, HomeState state) => BottomNavigationBar(
          selectedItemColor: Colors.green,
          currentIndex: state.index,
          type: BottomNavigationBarType.shifting,
          onTap: (index) => context.read<HomeCubit>().changePage(index),
          items: getItemList)));

  BottomNavigationBarItem getWidget(
    String text,
  ) =>
      BottomNavigationBarItem(
          activeIcon: Icon(
            getIcon(text),
            color: Colors.green,
          ),
          icon: Icon(
            getIcon(text),
            color: Colors.black,
          ),
          label: text);

  IconData getIcon(String text) {
    switch (text) {
      case AppStrings.firstModule:
        return Icons.abc;
      case AppStrings.secondModule:
        return Icons.adb;
      case AppStrings.thirdModule:
        return Icons.vape_free;
      default:
        return Icons.zoom_in;
    }
  }

  List<BottomNavigationBarItem> get getItemList =>
      StaticData.navBarDataList.map((element) => getWidget(element)).toList();
}
