import 'package:flutter/material.dart';
import 'package:ungegat/utility/my_constant.dart';
import 'package:ungegat/widgets/show_button.dart';
import 'package:ungegat/widgets/show_from.dart';
import 'package:ungegat/widgets/show_image.dart';
import 'package:ungegat/widgets/show_text.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool redEye = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusScopeNode());
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                newLogo(boxConstraints),
                newTitel(boxConstraints),
                formUser(boxConstraints),
                formPassword(boxConstraints),
                buttonLogin(boxConstraints),
              ],
            ),
          ),
        );
      }),
    );
  }

  Container buttonLogin(BoxConstraints boxConstraints) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: boxConstraints.maxWidth * 0.6,
      child: ShowButtom(
        label: 'Login',
        pressFunc: () {},
      ),
    );
  }

  Container formPassword(BoxConstraints boxConstraints) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      height: 40,
      width: boxConstraints.maxWidth * 0.6,
      child: ShowFrom(
        redEyeFunc: () {
          setState(() {
            redEye = !redEye;
          });
        },
        obSecu: redEye,
        hint: 'Password',
        iconData: Icons.lock_clock_outlined,
        changefung: (String string) {},
      ),
    );
  }

  Container formUser(BoxConstraints boxConstraints) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: boxConstraints.maxWidth * 0.55,
      height: 40,
      child: ShowFrom(
        hint: 'User :',
        iconData: Icons.person_outline,
        changefung: (String string) {},
      ),
    );
  }

  SizedBox newTitel(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxWidth * 0.6,
      child: Row(
        children: [
          ShowText(
            text: 'Login :',
            textStyle: MyConstant().h1Style(),
          ),
        ],
      ),
    );
  }

  SizedBox newLogo(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxWidth * 0.6,
      child: Row(
        children: [
          SizedBox(
            width: boxConstraints.maxWidth * 0.25,
            child: ShowImage(),
          ),
        ],
      ),
    );
  }
}
