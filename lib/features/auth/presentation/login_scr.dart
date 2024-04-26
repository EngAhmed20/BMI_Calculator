import 'package:bmi_test/core/utils/toast.dart';
import 'package:bmi_test/features/home/presentaion/views/home_view.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/utils/cache_helper.dart';
import '../../../core/utils/styles.dart';
import '../../../core/utils/widgets/shimmer_widget.dart';
import 'manager/login_cubit/login_cubit.dart';

class LoginScr extends StatelessWidget {
  const LoginScr({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>LoginCubit(),
    child: BlocConsumer<LoginCubit,LoginState>(
      listener: (context,state){
        if(state is LoginSucess)
          {
            CacheHelper.saveData(key: 'uId', value:state.uId).then((value){
              MyToast(msg: 'Login successfully',state: ToastStates.SUCCESS).showToast();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeView()));

            });
          }
        if (state is LoginErorr)
          {
            MyToast(msg: state.error,state: ToastStates.ERROR).showToast();
          }
      },
      builder: (context,state){
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShimmerWidget(label: 'Login To calculate your BMI',secColor: Colors.grey,baseColor: Colors.red,),
                const SizedBox(height: 40,),
                ConditionalBuilder(
                    condition: state is! LoginLoading,
                    builder: (context) => Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width*0.5,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(
                          onPressed: () {
                            LoginCubit.get(context).signInAnonymous();
                          },
                          child: const Text('Login anonymous ',style: Styles.textStyle19,)),
                    ),
                    fallback: (context) =>
                        Center(child: CircularProgressIndicator())),

              ],
            ),
          ),

        );
    }
      ),
    );
  }
}
