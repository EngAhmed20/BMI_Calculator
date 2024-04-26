import 'package:bmi_test/features/home/presentaion/manager/home%20cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';

class GenderWidget extends StatelessWidget {

  const GenderWidget({super.key});
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,index){},
      builder: (context,state){
        var cubit=HomeCubit.get(context);
        return  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ChoiceChip3D(
                  border: Border.all(color: Colors.grey),
                  style: cubit.gender=='Male'?cubit.Selected:cubit.unSelected,
                  onSelected: (){
                    cubit.setGender(num: 1);
                   // widget.onChange(_gender);

                  }, onUnSelected: (){
                cubit.setGender(num: 0);
              }, child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.asset('assets/images/man.png',width: 40,),
                  ),
                  SizedBox(height: 5,),
                  const Text('Male',style:Styles.textStyle16,),
                ],
              )),
              const SizedBox(width: 20,),
              ChoiceChip3D(
                  border: Border.all(color: Colors.grey),
                  style: cubit.gender=='Female'?cubit.Selected:cubit.unSelected,
                  onSelected: (){
                   cubit.setGender(num: 2);
                    //widget.onChange(_gender);
                  },selected: cubit.gender=="Male", onUnSelected: (){
                cubit.setGender(num:0);

              }, child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.asset('assets/images/woman.png',width: 40,),
                  ),
                  SizedBox(height: 5,),
                  const Text('Woman',style:Styles.textStyle16,),
                ],
              )),

            ],
          ),
        );
      }
    );
  }
}
