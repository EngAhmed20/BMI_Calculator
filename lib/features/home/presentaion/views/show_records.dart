import 'package:bmi_test/features/home/presentaion/views/widget/data_list_view.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/home cubit/home_cubit.dart';
class ShowRecords extends StatelessWidget {
  const ShowRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,index){},
      builder: (context,state){
        var cubit=HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body:ConditionalBuilder(condition: state is! getDataLoading, builder:(context){
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    ListView.separated(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                        itemBuilder:(context,index){
                          return ShowRecors(context,cubit.alldata[index]);
                        },
                        separatorBuilder: (context,index)=>SizedBox(height: 5,),
                        itemCount: cubit.alldata.length),
                  ],
                ),
              ),
            );
          }, fallback: (context)=>Center(child:CircularProgressIndicator())),
        );
      }
    );
  }
}
