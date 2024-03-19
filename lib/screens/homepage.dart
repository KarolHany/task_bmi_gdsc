import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_bmi_gdsc/models/result_info.dart';
import 'package:task_bmi_gdsc/provider/counters.dart';

import 'resultpage.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  late Result res;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Counters>(context);
    return Scaffold(
      backgroundColor: Color(0xff180839),
      appBar: AppBar(
        backgroundColor: Color(0xff180839),
        title: Text(
          "BMI CALCULATER",
          style: TextStyle(color: Colors.white, fontFamily: "Caveat"),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(children: [
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  Provider.of<Counters>(context, listen: false).setMale();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: provider.isMale
                          ? Color(0xfffdb096)
                          : Color(0xff70638e)),
                  height: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.male,
                        size: 70,
                        color: Colors.white,
                      ),
                      Text(
                        "MALE",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ],
                  ),
                ),
              )),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  Provider.of<Counters>(context, listen: false).setFemale();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: provider.isMale
                          ? Color(0xff70638e)
                          : Color(0xfffdb096)),
                  height: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.female,
                        size: 70,
                        color: Colors.white,
                      ),
                      Text(
                        "FEMALE",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ))
            ]),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff70638e)),
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: TextStyle(color: Colors.white38, fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "${provider.sliderValue.round()}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "cm",
                        style: TextStyle(color: Colors.white38, fontSize: 20),
                      ),
                    ],
                  ),
                  Slider(
                    thumbColor: Color(0xfffdb096),
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
                    min: 80,
                    max: 250,
                    value: provider.sliderValue,
                    onChanged: (value) {
                      provider.sliderValue = value;
                    },
                  )
                ],
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff70638e),
                  ),
                  height: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: TextStyle(fontSize: 20, color: Colors.white38),
                      ),
                      Text(
                        "${provider.WEIGHT}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: provider.decrementCounterWeight,
                            child: Icon(Icons.remove),
                            mini: true,
                            backgroundColor: Color(0xfffdb096),
                          ),
                          FloatingActionButton(
                            onPressed: provider.incrementCounterWeight,
                            child: Icon(Icons.add),
                            mini: true,
                            backgroundColor: Color(0xfffdb096),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff70638e),
                  ),
                  height: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: TextStyle(fontSize: 20, color: Colors.white38),
                      ),
                      Text(
                        "${provider.AGE}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: provider.decrementCounterAge,
                            child: Icon(Icons.remove),
                            mini: true,
                            backgroundColor: Color(0xfffdb096),
                          ),
                          FloatingActionButton(
                            onPressed: provider.incrementCounterAge,
                            child: Icon(Icons.add),
                            mini: true,
                            backgroundColor: Color(0xfffdb096),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          )),
          Container(
            width: double.infinity,
            height: 60,
            color: Color(0XFFfdb096),
            child: MaterialButton(
              onPressed: () {
                double result =
                    provider.WEIGHT / pow(provider.sliderValue / 100, 2);
                res = Result(
                    gender: provider.genderKind,
                    ismale: provider.isMaleBool,
                    HEIGHT: provider.sliderValue,
                    WEIGHT: provider.WEIGHT,
                    AGE: provider.AGE,
                    res: result);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            finalresult: res,
                          )),
                );
              },
              child: Text(
                "CALCULATE",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
