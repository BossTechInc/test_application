
import 'package:flutter/material.dart';

class NotificationBadge extends StatelessWidget {

 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.amber,
        shape: BoxShape.circle,
      ),
    );
  }
}