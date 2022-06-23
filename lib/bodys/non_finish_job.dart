// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ungegat/utility/my_constant.dart';

import 'package:ungegat/widgets/show_text.dart';

class NonFinishJob extends StatefulWidget {
  final List<String> dataUserLogin;
  const NonFinishJob({
    Key? key,
    required this.dataUserLogin,
  }) : super(key: key);

  @override
  State<NonFinishJob> createState() => _NonFinishJobState();
}

class _NonFinishJobState extends State<NonFinishJob> {
  var dataUserLogin = <String>[];
  @override
  void initState() {
    super.initState();
    dataUserLogin = widget.dataUserLogin;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ShowText(
          text: 'ชื่อพนักงาน :',
          textStyle: MyConstant().h2Style(),
        ),
        ShowText(text: dataUserLogin[1]),
      ],
    );
  }
}
