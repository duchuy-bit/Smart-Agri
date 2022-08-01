import 'dart:convert';

class DataSetFields{
  static final String date = 'date';
  static final String time = 'time';
  static final String temperature = 'temperature';
  static final String humidity = 'humidity';
  static final String light = 'light';

  static List<String> getFields()=>[date, time, temperature, humidity, light];
}

class DataSet{
  final String? date ;
  final String? time ;
  final num? temperature ;
  final num? humidity ;
  final num? light ;

  const DataSet({required this.date,required this.time,
    required this.temperature, required this.humidity,required this.light});

  DataSet copy({
    String? date ,
    String? time ,
    num? temperature ,
    num? humidity ,
    num? light ,
  })=> DataSet(
      date: date?? this.date,
      time: time?? this.time,
      temperature: temperature?? this.temperature,
      humidity: humidity?? this.humidity,
      light: light?? this.light,
  );

  static DataSet fromJson(Map<String,dynamic> json) =>
      DataSet(
        date: json[DataSetFields.date.toString()],
        time: json[DataSetFields.time.toString()],
        temperature: double.tryParse(json[DataSetFields.temperature].toString()),
        humidity: double.tryParse(json[DataSetFields.humidity].toString()),
        light: double.tryParse(json[DataSetFields.light].toString()),
      );

  Map<String, dynamic> toJson()=>{
    DataSetFields.date: date.toString(),
    DataSetFields.time: time.toString(),
    DataSetFields.temperature: temperature,
    DataSetFields.humidity: humidity,
    DataSetFields.light: light,
  };
}