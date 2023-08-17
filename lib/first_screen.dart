import 'package:bmi_calculator_with_cubit/second_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_colors.dart';
import 'app_cubit/app_cubit.dart';
import 'app_cubit/app_states.dart';


class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {



    return BlocBuilder<AppCubit, AppStates>(
      builder: (BuildContext context, dynamic state){

        AppCubit cubit = BlocProvider.of<AppCubit>(context);

        return Scaffold(
          backgroundColor: darkGrey,

          appBar: AppBar(
            backgroundColor: darkGrey,
            centerTitle: true,
            title: const Text("BMI CALCULATOR"),
          ),

          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(


              children: [
                const SizedBox(height: 20,),

                // MALE / FEMALE
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // MALE
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          cubit.changeGender(true);
                        },
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: cubit.isMale!=null && (cubit.isMale!) ? pink : lightGrey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male,
                                color: Colors.white,
                                size: 70,
                              ),

                              SizedBox(height: 15,),

                              Text(
                                "MALE",
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),


                    const SizedBox(width: 10,),

                    // FE-MALE
                    Expanded(
                      child: GestureDetector(
                        onTap: (){


                          cubit.changeGender(false);


                        },
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: cubit.isMale!=null && (cubit.isMale! == false) ? pink : lightGrey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.female,
                                color: Colors.white,
                                size: 70,
                              ),

                              SizedBox(height: 15,),

                              Text(
                                "FEMALE",
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),


                  ],
                ),




                const SizedBox(height: 15,),

                // HEIGHT SLIDER
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: lightGrey,
                      borderRadius: BorderRadius.circular(20)
                  ),

                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      // HEIGHT
                      const Text(
                        "HEIGHT",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      const SizedBox(height: 10,),

                      // HEIGHT VALUE
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            (cubit.currentHeight.ceil()).toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30
                            ),
                          ),

                          const Text(
                            "cm",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),

                      // HEIGHT SLIDER
                      Slider(
                          min: 50,
                          max: 250,
                          value: cubit.currentHeight,
                          activeColor: Colors.pink,
                          onChanged: (double newValue){

                            cubit.changeHeight(newValue);

                          }
                      )


                    ],
                  ),
                ),
                const SizedBox(height: 15,),

                // WEIGHT - AGE
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                            color: lightGrey,
                            borderRadius: BorderRadius.circular(20)
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "WIGHT",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              cubit.currentWeight.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  backgroundColor: pink ,
                                  child: const Icon(CupertinoIcons.minus),
                                  onPressed: (){
                                    if(cubit.currentWeight>20){


                                      cubit.changeWeight(cubit.currentWeight -1 );



                                    }

                                  },

                                ),
                                const SizedBox(width: 10,),

                                FloatingActionButton(
                                  backgroundColor:pink ,
                                  child: const Icon(CupertinoIcons.plus),
                                  onPressed: (){


                                    cubit.changeWeight(cubit.currentWeight +1 );


                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 10,),
                    Expanded(
                      child: Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                            color: lightGrey,
                            borderRadius: BorderRadius.circular(20)
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "AGE",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              cubit.currentAge.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  backgroundColor: pink ,
                                  child: const Icon(CupertinoIcons.minus),
                                  onPressed: (){
                                    if(cubit.currentAge>9){


                                      cubit.changeWeight(cubit.currentAge -1 );


                                    }

                                  },

                                ),
                                const SizedBox(width: 10,),

                                FloatingActionButton(
                                  backgroundColor: pink ,
                                  child: const Icon(CupertinoIcons.plus),
                                  onPressed: (){


                                    cubit.changeWeight(cubit.currentAge +1 );


                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),


              ],
            ),
          ),


          bottomSheet: GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const SecondScreen()));
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: pink,
              ),


              child: const Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),


            ),
          ),
        );
      },
    );

  }
}





