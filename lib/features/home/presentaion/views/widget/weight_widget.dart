import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/dec_inc_age.dart';
import '../../../manager/home cubit/home_cubit.dart';

class WeightWidget extends StatelessWidget {

  const WeightWidget({super.key} );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
    listener: (context,index){},
     builder: (context,index){
      var cubit=HomeCubit.get(context);
       return Padding(padding:EdgeInsets.all(8),
         child: Card(
           elevation: 12,
           shape: RoundedRectangleBorder(),
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               children: [
                 const Text('Weight (Kg)',style: Styles.textStyle20,textAlign: TextAlign.center,),
                 const SizedBox(height: 10,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     AvatarWidget(onTap: () {
                       cubit.decWeight();
                     }, icon: Icons.remove,),
                     const SizedBox(width: 20,),
                     Text(cubit.counterWeight.toString(),style: Styles.textStyle20,),
                     const SizedBox(width: 20,),
                     AvatarWidget(onTap: () {
                       cubit.IncWeight();

                     }, icon: Icons.add,),

                   ],
                 )
               ],),
           ),
         ),
       );
     },
    );
  }
}


