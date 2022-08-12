import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raftlabs_assignment/domain/entities/adoptPetData/adopt_pet_data.dart';
import 'package:raftlabs_assignment/presentation/screens/firstModule/widgets/datafetched_widget.dart';
import 'package:raftlabs_assignment/presentation/screens/secondModule/widgets/search_box.dart';

class DataRetrivedWidget extends StatelessWidget {
  final List<AdoptPetData> data;
  const DataRetrivedWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const SearchBoxWidget(),
        DataFetchedWidget(data: data),
      ],
    );
  }
}
