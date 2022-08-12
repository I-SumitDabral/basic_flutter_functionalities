import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raftlabs_assignment/domain/entities/adoptPetData/adopt_pet_data.dart';
import 'package:raftlabs_assignment/presentation/logic/firstModule/first_module_cubit.dart';
import 'package:raftlabs_assignment/presentation/shared/helper_widgets.dart';

import 'data_card.dart';

class DataFetchedWidget extends StatelessWidget {
  final List<AdoptPetData> data;
  const DataFetchedWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: ((context, index) {
        return DataCard(
          data: data[index],
        );
      }),
      itemCount: data.length > 20 ? 20 : data.length,
    );
  }
}
