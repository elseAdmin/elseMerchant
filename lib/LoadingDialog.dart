import 'package:flutter/material.dart';

import 'BallProgressIndicator.dart';
import 'SizeConfig.dart';

class LoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build

    return SimpleDialog(
        children: <Widget>[
          Container(
              height: SizeConfig.blockSizeVertical * 20,
              child: BallProgressIndicator())
        ]);
  }
}
