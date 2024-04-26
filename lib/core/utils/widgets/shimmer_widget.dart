import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({this.fontSize=30,this.label='BMI Calculator',this.baseColor=Colors.purple,this.secColor=Colors.red, this.textAlign=TextAlign.start

  });
  final double fontSize;
  final String label;
  final Color baseColor;
  final Color secColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 2),
      baseColor:baseColor ,
      highlightColor:secColor ,
      child: Text(label,style: TextStyle(fontSize:fontSize),textAlign:textAlign ,),

    );
  }
}
