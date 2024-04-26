class DataModel
{
  String? gender;
  int? weight;
  int? height;
  int? age;
  String? dateTime;
  double? bmi;
  String? BMIstatus;



  DataModel({this.gender,
    this.weight,
    this.height,
    this.age,
    this.bmi,
    this.dateTime,
    this.BMIstatus,
  });
  DataModel.fromJson(Map<String,dynamic>json)
  {
    dateTime = json['dateTime'];
    weight = json['weight'];
    height = json['height'];
    age = json['age'];
    dateTime = json['dateTime'];
    bmi = json['bmi'];
    gender = json['gender'];
    BMIstatus = json['BMIstatus'];




  }
  Map<String,dynamic >toMap()
  {
    return
      {
        'dateTime':dateTime,
        'weight':weight,
        'height':height,
        'dateTime':dateTime,
        'bmi':bmi,
        'age':age,
        'gender':gender,
        'BMIstatus':BMIstatus,

      };
  }

}