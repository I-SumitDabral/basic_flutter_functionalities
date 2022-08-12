import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raftlabs_assignment/config/constants/static_data.dart';
import 'package:raftlabs_assignment/config/extensions/context_extensions.dart';
import 'package:raftlabs_assignment/presentation/logic/secondModule/second_module_cubit.dart';

class CustomBottomSheetWidget extends StatefulWidget {
  final Function(String) onPressed;
  const CustomBottomSheetWidget({Key? key, required this.onPressed})
      : super(key: key);

  @override
  State<CustomBottomSheetWidget> createState() =>
      _CustomBottomSheetWidgetState();
}

class _CustomBottomSheetWidgetState extends State<CustomBottomSheetWidget> {
  int takeLength = 10;
  String selectedCategory = StaticData.categoryList.first;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          topRight: Radius.circular(15.r),
        )),
        child: Column(
          children: [
            const Text('Filter using categories'),
            Wrap(
              children: StaticData.categoryList
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedCategory = e;
                            });
                          },
                          child: Chip(
                              label: Text(
                                e,
                              ),
                              backgroundColor: selectedCategory == e
                                  ? Colors.green
                                  : Colors.grey.shade400),
                        ),
                      ))
                  .take(takeLength)
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      widget.onPressed(selectedCategory);
                    },
                    child: const Text('Filter')),
                if (StaticData.categoryList.length > takeLength)
                  TextButton(
                      onPressed: () {
                        setState(() {
                          if (StaticData.categoryList.length > takeLength) {
                            takeLength += 10;
                          }
                        });
                      },
                      child: const Text('view more...')),
                if (takeLength > 10)
                  TextButton(
                      onPressed: () {
                        setState(() {
                          if (takeLength > 10) {
                            takeLength -= 10;
                          }
                        });
                      },
                      child: const Text('view less...')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
