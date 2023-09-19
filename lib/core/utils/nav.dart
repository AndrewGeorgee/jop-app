import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Go {
  final BuildContext context;
  Go(this.context);

  Future push({
    required Widget page,
    bool withoutRoot = true,
    bool withoutPageTransition = false,
  }) async {
    PageRoute route = withoutPageTransition
        ? MaterialPageRoute(
            builder: (context) => page, maintainState: !withoutRoot)
        : CupertinoPageRoute(
            builder: (context) => page, maintainState: !withoutRoot);
    return Navigator.of(context, rootNavigator: withoutRoot).push(route);
  }

  Future<bool> back() => Navigator.maybePop(context);
}