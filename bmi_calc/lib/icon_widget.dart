import 'package:flutter/material.dart';

import 'constants.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  final String iconLabel;
  IconWidget({@required this.icon, this.iconLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          iconLabel,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}