import 'package:flutter/material.dart';
import 'package:flutter_app_practicle/model/demo_class.dart';
import 'package:flutter_app_practicle/network/api_service.dart';
import 'package:mvc_pattern/mvc_pattern.dart';



  class HomeController extends ControllerMVC {
  List<DemoData> demoList = <DemoData>[];
  GlobalKey<ScaffoldState> scaffoldKey;


  HomeController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }




  void listenForData() async {
    final Stream<DemoData> stream = await getData();
    stream.listen((DemoData _food) {
      setState(() => demoList.add(_food));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }

}
