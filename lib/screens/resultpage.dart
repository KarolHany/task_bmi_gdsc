import 'package:flutter/material.dart';

import 'package:task_bmi_gdsc/models/result_info.dart';
import 'package:task_bmi_gdsc/screens/homepage.dart';

class ResultPage extends StatelessWidget {
  Result finalresult;
  ResultPage({required this.finalresult});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff180839),
      appBar: AppBar(
        backgroundColor: Color(0xff180839),
        title: Text(
          "BMI CALCULATER",
          style: TextStyle(
            fontFamily: "Caveat",
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Your Result",
              style: TextStyle(
                  fontFamily: "Caveat",
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Expanded(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff70638e)),
                    height: 380,
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${finalresult.gender}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontFamily: "Caveat"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${finalresult.check(finalresult.res)}",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 35,
                              fontFamily: "Caveat"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${finalresult.res.round()}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontFamily: "Caveat"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${finalresult.resultText(finalresult.check(finalresult.res))}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "Caveat"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${finalresult.statement(finalresult.res)}",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 53, 227, 59),
                              fontSize: 25,
                              fontFamily: "Caveat"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 60,
              color: Color(0xfffdb096),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text(
                  "RE-CALCULATE",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
