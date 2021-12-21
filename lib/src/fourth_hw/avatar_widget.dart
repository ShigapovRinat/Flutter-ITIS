import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String username;
  final String userImage;
  final EdgeInsetsGeometry padding;
  final bool isLarge;
  final bool isShowingUsernameLabel;

  const AvatarWidget(
      {required this.username,
      required this.userImage,
      this.padding = const EdgeInsets.all(8.0),
      this.isLarge = false,
      this.isShowingUsernameLabel = false});

  static const _whiteBorderDecoration = BoxDecoration(
    shape: BoxShape.circle,
    border: Border.fromBorderSide(BorderSide(color: Colors.white, width: 3.0)),
  );

  static const _greyBoxShadowDecoration = BoxDecoration(
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(color: Colors.grey, blurRadius: 1.0, spreadRadius: 1.0)
    ],
  );

  @override
  Widget build(BuildContext context) {
    final radius = isLarge ? 28.0 : 14.0;
    final avatar = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: radius * 2 + 9.0,
          width: radius * 2 + 9.0,
          decoration: null,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                decoration: _whiteBorderDecoration,
                child: Container(
                  decoration: _greyBoxShadowDecoration,
                  child: CircleAvatar(
                    radius: radius,
                    backgroundImage: AssetImage(userImage),
                  ),
                ),
              )
            ],
          ),
        ),
        if (isShowingUsernameLabel)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
          ),
      ],
    );

    return Padding(
      padding: padding,
      child: avatar,
    );
  }
}
