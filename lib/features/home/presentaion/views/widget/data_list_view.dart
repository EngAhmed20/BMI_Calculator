import 'package:bmi_test/features/home/presentaion/manager/models/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/home cubit/home_cubit.dart';

Widget ShowRecors(context,DataModel model)=>Card(
  elevation: 10,
  child: Column(
    children: [
      Text('${model.dateTime}'),
      custom_row(text1: 'Age',text2:'${model.age}',),
      custom_row(text1: 'height',text2:'${model.height}',),
      custom_row(text1: 'weight',text2:'${model.weight}',),
      custom_row(text1: 'BMI',text2:'${model.bmi!.toStringAsFixed(1)}/40',),
      custom_row(text1: 'BMI Status',text2:'${model.BMIstatus}',),


    ],
  ),
);

class custom_row extends StatelessWidget {
   custom_row({
    super.key,required this.text1,required this.text2,
  });
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('${text1} :'),
        Text('${text2}'),
      ],
    );
  }
}