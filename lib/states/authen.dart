import 'package:flutter/material.dart';
import 'package:ungegat/utility/my_constant.dart';
import 'package:ungegat/widgets/show_from.dart';
import 'package:ungegat/widgets/show_image.dart';
import 'package:ungegat/widgets/show_text.dart';

class Authen extends StatelessWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              newLogo(boxConstraints),
              newTitel(),
              formUser(boxConstraints),
              Container(
                margin: const EdgeInsets.only(top: 16),
                height: 40,
                width: boxConstraints.maxWidth * 0.6,
                child: ShowFrom(
                  hint: 'Password',
                  iconData: Icons.lock_clock_outlined, 
                  changefung: (String string) {  }, )
            ,
              )],
          ),
        );
      }),
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

  ShowText newTitel() {
    return ShowText(
      text: 'Login :',
      textStyle: MyConstant().h1Style(),
    );
  }

  SizedBox newLogo(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxWidth * 0.40,
      child: ShowImage(),
    );
  }
}
