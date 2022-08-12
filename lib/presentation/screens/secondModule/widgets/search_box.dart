import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raftlabs_assignment/config/extensions/context_extensions.dart';
import 'package:raftlabs_assignment/presentation/logic/secondModule/second_module_cubit.dart';
import 'package:raftlabs_assignment/presentation/shared/alert.dart';

import '../../../shared/helper_widgets.dart';

class SearchBoxWidget extends StatefulWidget {
  const SearchBoxWidget({Key? key}) : super(key: key);

  @override
  State<SearchBoxWidget> createState() => _SearchBoxWidgetState();
}

class _SearchBoxWidgetState extends State<SearchBoxWidget> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.clear();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.1.sh,
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Padding(
                padding: ps8,
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  duration: const Duration(milliseconds: 300),
                  child: Padding(
                    padding: ps8,
                    child: TextField(
                      controller: _textEditingController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      cursorColor: Colors.black,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ),
              )),
          AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: _iconButton(Icons.search, () {
                context
                    .read<SecondModuleCubit>()
                    .searchDescription(_textEditingController.text);
              }),
              crossFadeState: _textEditingController.text.length > 2
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300)),
          _iconButton(Icons.filter_list, () {
            ShowAlert().showBottomSheet(context, filter);
          }),
        ],
      ),
    );
  }

  void filter(String selectedCategory) {
    context.read<SecondModuleCubit>().filterBasedOnCategory(selectedCategory);
    context.pop;
  }

  Widget _iconButton(IconData icon, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }
}
