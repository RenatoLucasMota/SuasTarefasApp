import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class CustomBottomSheet {
  final BuildContext context;

  CustomBottomSheet({this.context});

  Future<String> showAsBottomSheet() async {
    final result = await showSlidingBottomSheet(context, builder: (context) {
      return SlidingSheetDialog(
        elevation: 8,
        cornerRadius: 30,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [1],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        builder: (context, state) {
          return Material(
            color: Color.fromARGB(255, 40, 40, 40),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[],
              ),
            ),
          );
        },
      );
    });
    return result;
  }
}
