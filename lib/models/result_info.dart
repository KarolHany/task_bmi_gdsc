class Result {
  final String gender;
  final bool ismale;
  final double HEIGHT;
  final int WEIGHT;
  final int AGE;
  double res;

  Result(
      {required this.gender,
      required this.ismale,
      required this.HEIGHT,
      required this.WEIGHT,
      required this.AGE,
      required this.res});
 String check(double res) {
    if (res < 18.5) {
      
     return"Underweight";
    } else if (res >= 18.5 && res < 24.9) {
    
     return"Normal";
    } else if (res >= 24.9 && res < 29.9) {
     
     return"Overweight";
    } else {
  
     return"Obese";
    }
  }

  String resultText(String text) {
    if (text == "Underweight") {
      return"Underweight BMI range : \n less than 18.5 kg/m2";
    } else if (text == "Normal") {
      return"Normal BMI range : \n 18.5 - 24.9 kg/m2";
    } else if (text == "Overweight") {
     return"Normal BMI range : \n 24.9 - 29.9 kg/m2";
    } else {
     return"Obese BMI range : \n greter than 29.9 kg/m2";
    }
  }

  String statement(double res) {
    if (res < 18.5) {
      return "you have a Underweight body , \n you should eat  more calories";
    } else if (res >= 18.5 && res < 24.9) {
      return "you have a Normal body , \n good job";
    } else if (res >= 24.9 && res < 29.9) {
      return "you have a Overweight body , \n you should doing exersice";
    } else {
      return "you have a fat body , \n you should do diet";
    }
  }
}
