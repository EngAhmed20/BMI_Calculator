
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../../core/utils/widgets/shimmer_widget.dart';
import '../../../../auth/presentation/login_scr.dart';
class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height:300,
            child: AspectRatio(
              aspectRatio: 1/2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image:const  AssetImage('assets/images/logo.png',),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          AnimatedBuilder(
            animation: slidingAnimation,
            builder: (BuildContext context, _) {
              return SlideTransition(position: slidingAnimation,
                  child:ShimmerWidget(label: 'A sound mind in a sound body',fontSize: 20,textAlign: TextAlign.center,));
            },

          ),


        ],
      ),
    );
  }
  void initSlidingAnimation() {
    animationController=AnimationController(vsync: this,duration:const Duration(seconds: 1));
    slidingAnimation=Tween<Offset>(begin:const Offset(0, 5) ,end:Offset.zero ).animate(animationController);
    animationController.forward();
  }
  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacement(context,PageTransition(
          child: LoginScr(), type:PageTransitionType.fade
      ) );
    });
  }
}

