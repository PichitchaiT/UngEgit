// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ungegat/utility/my_constant.dart';
import 'package:ungegat/widgets/show_image.dart';
import 'package:ungegat/widgets/show_text.dart';
import 'package:ungegat/widgets/show_textbutton.dart';

class MyDialog {
  final BuildContext context;
  MyDialog({
    required this.context,
  });
  Future<void> normalDialog({
    required String title,
    required String subtitle,
    String? lable,
    Function()? pressFunc,
    String? lable2,
    Function()? pressFunc2,
  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: ListTile(
          leading: const SizedBox(
            width: 80,
            child: ShowImage(),
          ),
          title: ShowText(
            text: title,
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowText(text: subtitle),
        ),
        actions: [
          pressFunc == null
              ? ShowTextButton(
                  lable: 'OK',
                  pressFunc: () {
                    Navigator.pop(context);
                  })
              : ShowTextButton(
                  lable: lable!,
                  pressFunc: pressFunc,
                ),
          pressFunc2 == null
              ? const SizedBox()
              : ShowTextButton(
                  lable: lable2!,
                  pressFunc: pressFunc2,
                ),
        ],
      ),
    );
  }
}
