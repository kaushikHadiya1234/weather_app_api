import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/Screen/Model/weather_model.dart';
import 'package:weather_app/Screen/Provider/weather_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

WeatherProvider? pf;
WeatherProvider? pt;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    pf = Provider.of<WeatherProvider>(context, listen: false);
    pt = Provider.of<WeatherProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff6EF7E6),
        body: FutureBuilder(
          future: pf!.Getdata(
              lat1: '${pt!.ItemList[pt!.index].lat}',
              lon1: '${pt!.ItemList[pt!.index].loat}'),
          builder: (context, snapshot) {
            if(snapshot.hasError)
            {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/n1.png',height: 100,width: 100,),
                    Text("Check your internet Conection",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(height: 3),
                    Text("Please on mobile data",style: TextStyle(fontSize: 16),),
                  ],
                ),
              );
            }else if (snapshot.hasData) {
              WeatherModel weatherModel = snapshot.data!;
              pt!.ChangeImage(weatherModel.main!.temp!);
              return Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.location_on,
                                    size: 3.h,
                                  )),
                              Container(
                                width: 30.w,
                                child: DropdownButton(
                                  dropdownColor:Colors.white60,
                                  items: pt!.l1
                                      .map((e) => DropdownMenuItem(
                                            child: Text("$e"),
                                            value: e,
                                          ))
                                      .toList(),
                                  value: pt!.select,
                                  onChanged: (value) {
                                    pf!.Selectitem(value as String);
                                  },
                                ),
                              ),
                              // Text("Surat",style: TextStyle(fontSize: 3.h),),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.edit_calendar)),
                        ],
                      ),
                    ),
                    Image.asset(
                      '${pt!.SelectImage}',
                      height: 30.h,
                      width: 35.h,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "cloudy",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${weatherModel.main!.temp}°",
                      style: TextStyle(
                          fontSize: 8.h,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff000832)),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "C°",
                          style: TextStyle(
                              fontSize: 3.h,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "|",
                          style: TextStyle(
                              fontSize: 3.h,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "F°",
                          style: TextStyle(
                              fontSize: 3.h,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Image.asset(
                    //       'assets/images/c1.png',
                    //       height: 7.h,
                    //       width: 7.h,
                    //     ),
                    //     Text(
                    //       "${weatherModel.clouds!.all} %",
                    //       style: TextStyle(
                    //           fontSize: 3.h,
                    //           fontWeight: FontWeight.w400,
                    //           color: Color(0xff000AFF)),
                    //     ),
                    //     Image.asset(
                    //       'assets/images/s.png',
                    //       height: 7.h,
                    //       width: 7.h,
                    //     ),
                    //     Text(
                    //       "${weatherModel.wind!.speed} Km/h",
                    //       style: TextStyle(
                    //           fontSize: 3.h,
                    //           fontWeight: FontWeight.w400,
                    //           color: Color(0xff000AFF)),
                    //     ),
                    //   ],
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 10, bottom: 10),
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Today, ${pt!.time.day}-${pt!.time.month}-${pt!.time.year}",
                            style: TextStyle(
                                fontSize: 2.5.h, fontWeight: FontWeight.bold),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 20.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff94F4F4)),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/c1.png',
                                height: 10.h,
                                width: 7.h,
                              ),
                              Text(
                                "${weatherModel.clouds!.all} %",
                                style: TextStyle(
                                    fontSize: 2.8.h,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            height: 20.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff94F4F4)),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/s.png',
                                  height: 10.h,
                                  width: 7.h,
                                ),
                                Text(
                                  "${weatherModel.wind!.speed} Km/h",
                                  style: TextStyle(
                                      fontSize: 2.8.h,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            )),
                        Container(
                          height: 20.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff94F4F4)),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/s1.png',
                                  height: 10.h,
                                  width: 7.h,
                                ),
                                Text(
                                  "${weatherModel.main!.feelsLike}°",
                                  style: TextStyle(
                                      fontSize: 2.8.h,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            )
                        ),

                      ],
                    )
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
