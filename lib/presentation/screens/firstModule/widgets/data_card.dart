import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raftlabs_assignment/config/constants/app_images.dart';
import 'package:raftlabs_assignment/config/extensions/string_extensions.dart';
import 'package:raftlabs_assignment/domain/entities/adoptPetData/adopt_pet_data.dart';
import 'package:raftlabs_assignment/presentation/shared/helper_widgets.dart';

class DataCard extends StatelessWidget {
  final AdoptPetData data;
  const DataCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ps8,
      child: Material(
        elevation: 5,
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(5.r)),
            child: ListTile(
              style: ListTileStyle.list,
              title: Text(data.api),
              subtitle: Text(data.description.intelliTrimOfSubTitle),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  categoryWidget(data.category),
                  SizedBox(
                    width: 60.w,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (data.hTTPS == true) imagecard(AppImages.https),
                        if (data.auth.isNotEmpty) imagecard(AppImages.secure),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget imagecard(String url) {
    return Image.asset(
      url,
      height: 20.h,
      width: 20.w,
    );
  }

  Widget categoryWidget(String category) {
    return Container(
      height: 20.h,
      width: 60.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.green.withOpacity(0.8),
      ),
      child: Text(
        category.intelliTrimForcategory,
        style: TextStyle(fontSize: 12.sp, color: Colors.white),
      ),
    );
  }
}
