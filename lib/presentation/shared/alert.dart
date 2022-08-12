import 'package:flutter/material.dart';

import 'custom_bottom_sheet.dart';

class ShowAlert {
  void showBottomSheet(BuildContext context, Function(String) onPressed) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return CustomBottomSheetWidget(onPressed: onPressed);
        });
  }
}
