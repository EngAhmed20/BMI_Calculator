import 'package:flutter/material.dart';

class custom_button extends StatelessWidget {
  custom_button({
    super.key,required this.onTap,required this.title,this.leading,this.splashColor
  });
  final void Function() onTap;
  final Widget title;
  final Widget? leading;
  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 200,
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),),
        child:ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          onTap: onTap,
          title: title,
          leading: leading,
          splashColor: splashColor,
        ),

      ),
    );
  }
}
