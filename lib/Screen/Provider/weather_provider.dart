import 'package:flutter/material.dart';
import 'package:weather_app/Screen/Model/weather_model.dart';
import 'package:weather_app/utils/api_helper.dart';

class WeatherProvider extends ChangeNotifier {
  Future<WeatherModel> Getdata({required String? lat1, required String? lon1}) {
    return Apihelper.apihelper.Apihelperdata(lat: lat1, lon: lon1);
  }

  List l1 = [
    'Surat',
    'Ahmedabad',
    'Delhi',
    'Ladakh',
    'Rajkot',
  ];

  String select = 'Surat';
  int index = 0;

  void Selectitem(String value) {
    select = value;
    index = l1.indexOf(select);
    notifyListeners();
  }

  List<Data> ItemList = [
    Data(lat: '21.1702', loat: '72.8311'),
    Data(lat: '23.0225', loat: '72.5714'),
    Data(lat: '28.7041', loat: '77.1025'),
    Data(lat: '34.2268', loat: '77.5619'),
    Data(lat: '22.3039', loat: '70.8022'),
  ];

  DateTime time = DateTime.now();

  void Changedate(DateTime d) {
    d = time;
    notifyListeners();
  }

  String? SelectImage = "assets/images/c.png";

  void ChangeImage(double temp) {
    if (temp > 35) {
      SelectImage = "assets/images/c4.png";
    } else if (temp > 30 && temp <= 35) {
      SelectImage = "assets/images/c.png";
    } else if (temp > 25 && temp <= 30) {
      SelectImage = "assets/images/c2.png";
    } else if (temp > 20 && temp <= 25) {
      SelectImage = "assets/images/c5.png";
    } else if (temp <= 20) {
      SelectImage = "assets/images/c3.png";
    }
  }

}
