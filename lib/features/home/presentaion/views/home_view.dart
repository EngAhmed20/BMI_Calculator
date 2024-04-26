import 'dart:math';

import 'package:bmi_test/features/auth/presentation/login_scr.dart';
import 'package:bmi_test/features/home/presentaion/manager/home%20cubit/home_cubit.dart';
import 'package:bmi_test/features/home/presentaion/views/score_scr.dart';
import 'package:bmi_test/features/home/presentaion/views/show_records.dart';
import 'package:bmi_test/features/home/presentaion/views/widget/age_widget.dart';
import 'package:bmi_test/features/home/presentaion/views/widget/gender_widget.dart';
import 'package:bmi_test/features/home/presentaion/views/widget/height_widget.dart';
import 'package:bmi_test/features/home/presentaion/views/widget/weight_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/shimmer_widget.dart';
import 'package:intl/intl.dart';


class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<HomeCubit,HomeState>(
        builder: (context,state){
          var cubit=HomeCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          title: ShimmerWidget(),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          child: Card(
            elevation: 12,
            shape:  const RoundedRectangleBorder(),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                GenderWidget(),
                const SizedBox(height: 20,),
                HeightWidget(),
                const SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AgeWidget(),
                    WeightWidget(),

                  ],
                ),
                const  SizedBox(height: 30),
                SwipeableButtonView(
                    isFinished: cubit.finshed,
                    onFinish: ()async{
                      DateTime now = DateTime.now();
                      String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
                      cubit.uploadData(gender: cubit.gender,
                          age: cubit.counterAge,
                          weight: cubit.counterWeight,
                          height: cubit.height,
                          bmi: cubit.bmiScore,
                          dateTime: formattedDate, BMIstatus:cubit.bmiStatus);
                      await Navigator.push(context,PageTransition(
                          child: ScoreScr(), type:PageTransitionType.fade
                      ) );
                      cubit.changeSwipeableButton();
                    },
                    onWaitingProcess: (){
                      cubit.calculateBMI(weight: cubit.counterWeight, height: cubit.height);
                      cubit.setBmiInterpretation();
                      Future.delayed(Duration(seconds: 1),(){
                       cubit.changeSwipeableButton();
                      });
                    },
                    activeColor: Colors.blue,
                    buttonWidget:const Icon(
                        Icons.arrow_forward_ios_outlined
                    ),
                    buttonText: 'Calculate'),
                const SizedBox(height: 20,),
                custom_button(title: Text('show Records'),splashColor: Colors.blue,
                leading: Icon(Icons.read_more),
                  onTap: (){
                  Navigator.push(context,PageTransition(
                      child:ShowRecords(), type:PageTransitionType.fade
                  ) );
                  },
                ),
                const SizedBox(height: 10,),
                custom_button(title: Text('Sign Out'),splashColor: Colors.red,
                  leading: const Icon(Icons.logout,color: Colors.redAccent,),
                  onTap: (){
                  cubit.SignOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScr()));

                  },
                ),


              ],
            ),
          ),
        ),
      );
    }, listener:(context,state){});
  }
}

