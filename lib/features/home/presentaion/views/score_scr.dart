
import 'package:bmi_test/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/utils/widgets/shimmer_widget.dart';
import '../../manager/home cubit/home_cubit.dart';

class ScoreScr extends StatelessWidget {

   ScoreScr({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,index){},
      builder: (context,state){
        var cubit =HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:ShimmerWidget(label: 'BMI Score',),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Your Score",
                  style: Styles.textStyle25.copyWith(fontFamily:appConst.KGTSectraFine),
                ),
                const SizedBox(
                  height: 10,
                ),
                PrettyGauge(
                  gaugeSize: 300,
                  minValue: 0,
                  maxValue: 40,
                  segments: [
                    GaugeSegment('UnderWeight', 18.5, Colors.red),
                    GaugeSegment('Normal', 6.4, Colors.green),
                    GaugeSegment('OverWeight', 5, Colors.orange),
                    GaugeSegment('Obesity', 10.1, Colors.pink),
                  ],
                  valueWidget: Text(
                    cubit.bmiScore.toStringAsFixed(1),
                    style:  Styles.textStyle30,
                  ),
                  currentValue: cubit.bmiScore.toDouble(),
                  needleColor: cubit.bmiStatusColor!,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  cubit.bmiStatus!,
                  style: TextStyle(fontSize: 20, color: cubit.bmiStatusColor!),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  cubit.bmiInterpretation,
                  style: Styles.textStyle16.copyWith(fontFamily: appConst.KGTSectraFine),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Re-calculate")),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Share.share(
                              "Your BMI is ${cubit.bmiScore.toStringAsFixed(1)} at age ${cubit.counterAge}");
                        },
                        child: const Text("Share")),
                  ],
                )



              ],
            ),
          ),
        );
      }
    );
  }
}
