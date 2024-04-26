import 'package:bmi_test/features/home/presentaion/manager/home%20cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
class HeightWidget extends StatelessWidget {
  const HeightWidget({super.key});

  //int _height=170;
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<HomeCubit,HomeState>(
     listener: (context,index){},
     builder: (context,state) {
       var cubit=HomeCubit.get(context);
       return Padding(padding: EdgeInsets.all(8),
         child: Card(
           elevation: 12,
           shape: const RoundedRectangleBorder(),
           child: Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(cubit.height.toString(),style: Styles.textStyle25,),
                   const SizedBox(width: 5,),
                   Text('CM',style: Styles.textStyle14.copyWith(color: Colors.grey[800]),),

                 ],
               ),
               SizedBox(height: 10,),
               Slider(min: 0,max: 250,thumbColor: Colors.red,
                   value: cubit.height.toDouble(), onChanged:(value){
                     cubit.updateHeight(newHeight: value.toInt());
                   }),
             ],
           ),

         ),
       );
     }
   );
  }
}
