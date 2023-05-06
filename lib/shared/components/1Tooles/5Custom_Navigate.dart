import 'package:flutter/material.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

// void navigatePop(context, widget) => Navigator.pop(
//       context,
//       MaterialPageRoute(
//         builder: (context) => widget,
//       ),
//     );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );
void navigatePop(
  context,
  widget,
) =>
    Navigator.pop(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
