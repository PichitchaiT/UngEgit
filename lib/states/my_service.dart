import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ungegat/bodys/finish_job.dart';
import 'package:ungegat/bodys/non_finish_job.dart';
import 'package:ungegat/utility/my_constant.dart';
import 'package:ungegat/utility/my_dialog.dart';
import 'package:ungegat/widgets/show_icon_button.dart';
import 'package:ungegat/widgets/show_progress.dart';
import 'package:ungegat/widgets/show_text.dart';

class MyService extends StatefulWidget {
  const MyService({Key? key}) : super(key: key);

  @override
  State<MyService> createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  var titles = <String>['Non Finish', 'Finish'];
  var iconDatas = <IconData>[Icons.remove, Icons.done];
  var widgets = <Widget>[
    // const NonFinishJob(),
    // const FinishJob(),
  ];

  var bottonNavigators = <BottomNavigationBarItem>[];
  int indexBodys = 0;

  @override
  void initState() {
    createNavBar();
    ProcessFindUserLogin();
  }

  Future<void> ProcessFindUserLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var dataLogins = preferences.getStringList('data');
    print('dataLogins ==> $dataLogins');
    widgets.add(NonFinishJob(dataUserLogin: dataLogins!));
    widgets.add(FinishJob(idOfficer: dataLogins[0],));
    setState(() {});
  }

  void createNavBar() {
    for (var i = 0; i < titles.length; i++) {
      bottonNavigators.add(BottomNavigationBarItem(
        label: titles[i],
        icon: Icon(
          iconDatas[i],
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 160, 213, 248),
      appBar: newAppBar(context),
      body: widgets.isEmpty ? const ShowProgress() : widgets[indexBodys],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBodys,
        items: bottonNavigators,
        onTap: (value) {
          setState(() {
            indexBodys = value;
          });
        },
      ),
    );
  }

  AppBar newAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: ShowText(
        text: titles[indexBodys],
        textStyle: MyConstant().h2Style(),
      ),
      elevation: 0,
      foregroundColor: MyConstant.dark,
      backgroundColor: Color.fromARGB(255, 83, 183, 201),
      actions: [
        ShowIconButton(
            iconData: Icons.exit_to_app,
            pressFunc: () {
              MyDialog(context: context).normalDialog(
                  pressFunc: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    preferences.clear().then((value) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/authen', (route) => false);
                    });
                  },
                  lable: 'SignOut',
                  title: 'Sign Out?',
                  subtitle: 'Pleasw Confirm SignOut');
            })
      ],
    );
  }
}
