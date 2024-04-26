import 'package:flutter/material.dart';

InkWell AvatarWidget ({ required void Function()? onTap,
  required IconData? icon,}){
  return InkWell(
    onTap: onTap,
    child: CircleAvatar(
      backgroundColor: Colors.blue,
      radius: 14,
      child: Icon(icon,color: Colors.white,) ,
    ),
  );
}