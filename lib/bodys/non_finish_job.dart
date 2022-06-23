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
    readDataJob();
  }

  Future<void> readDataJob() async {
    String idOfficer = dataUserLogin[0];
    String path =
        'https://www.androidthai.in.th/egat/getUserWhereidofficer_toy1.php?isAdd=true&idOfficer=$idOfficer';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        showtitle(head: 'ชื่อพนักงาน :', value: dataUserLogin[1]),
        showtitle(head: 'ตำแหน่ง :', value: dataUserLogin[2]),
      ],
    );
  }

  Card showtitle({required String head, required String value}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ShowText(
                text: head,
                textStyle: MyConstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 2,
              child: ShowText(text: value),
            ),
          ],
        ),
      ),
    );
  }
}
