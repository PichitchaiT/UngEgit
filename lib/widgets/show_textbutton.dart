// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ungegat/utility/my_constant.dart';
import 'package:ungegat/widgets/show_text.dart';

class ShowTextButton extends StatelessWidget {
  final String lable;
  final Function() pressFunc;
  const ShowTextButton({
    Key? key,
    required this.lable,
    required this.pressFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: pressFunc,
        child: ShowText(
          text: lable,
          textStyle: MyConstant().h3ActiveStyle(),
        ));
  }
}
