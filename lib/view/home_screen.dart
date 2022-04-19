import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_practicle/controller/home_controller.dart';
import 'package:flutter_app_practicle/model/demo_class.dart';
import 'package:flutter_app_practicle/view/news_screen.dart';
import 'package:intl/intl.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends StateMVC<HomeScreen> {
  _HomeScreenState() : super(HomeController()) {
    _con = controller;
  }

  PageController pageController = PageController();
  HomeController _con;
  Uint8List _imageFile;

  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    _con.listenForData();
    super.initState();
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        body: _con.demoList.isEmpty
            ? Container(
          height: MediaQuery.of(context).size.height,
              child: Center(
                child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                  ),
              ),
            )
            : Stack(
                children: [
                  Positioned.fill(
                    child: PageView.builder(
                      reverse: false,
                      controller: pageController,
                      itemBuilder: (ctx, i) {



                        if (i % 1 == 0 && i % 3 != 0 && i % 2!= 0) {
                          return Card(
                            child: listItemWidget(_con.demoList[i]),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.green)),
                          );
                        } else if (i % 2 == 0 && i % 4 != 0) {
                          return Card(
                            child: listItemWidget(_con.demoList[i]),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.blue)),
                          );
                        } else if (i % 3 == 0 && i!=0) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black)),
                            child: Container(
                                height: 200,
                                child: Image.asset('assets/images/planet.jpg')),
                          );
                        }


                        else {
                          return Card(
                            child: listItemWidget(_con.demoList[i]),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.red)),
                          );
                        }
                      },
                      itemCount: _con.demoList.length,
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 30,
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: _con.demoList.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Colors.grey.withOpacity(0.4),
                        expansionFactor: 2,
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: Colors.grey.withOpacity(0.4),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 1,
                      right: 20,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                currentPage--;
                                pageController.previousPage(
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.decelerate);
                              });
                            },
                            padding: EdgeInsets.all(0),
                            icon: Icon(Icons.arrow_back_ios_rounded),
                          ),
                          (currentPage == _con.demoList.length - 1)
                              ? MaterialButton(
                                  onPressed: () {},
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    'Get Started!',
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      currentPage++;
                                      pageController.nextPage(
                                          duration: Duration(milliseconds: 400),
                                          curve: Curves.decelerate);
                                    });
                                  },
                                  padding: EdgeInsets.all(0),
                                  icon: Icon(Icons.arrow_forward_ios_outlined),
                                ),
                        ],
                      )),
                ],
              ),
      ),
    );
  }

  listItemWidget(DemoData demoList) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          CachedNetworkImage(
            height: 300,
            width: double.infinity,
            fit: BoxFit.fill,
            imageUrl: demoList.thumbImage,
            placeholder: (context, url) => CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ),
            errorWidget: (context, url, error) => Image.network(
              'http://192.249.121.94/~mobile/restaurant_demo/images/image_default.png',
              height: 150,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      Flexible(child: Container()),
                      Container(
                        width: 35,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(4)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.remove_red_eye,
                              color: Colors.white,
                              size: 15,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "0",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 2,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 300,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  transform: Matrix4.translationValues(0, -14, 0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 15),
                                            child: Row(
                                              children: [
                                                Icon(Icons.circle),
                                                Text(demoList.categoryName),
                                              ],
                                            ),
                                          ),
                                          Flexible(child: Container()),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  _takeScreenshotandShare();
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                        padding: EdgeInsets.all(2),
                                                        decoration: BoxDecoration(
                                                            color: Colors.blue,
                                                            shape: BoxShape.circle),
                                                        child: Icon(
                                                          Icons.share,
                                                          color: Colors.white,
                                                        )),
                                                    SizedBox(
                                                      height: 2,
                                                    ),
                                                    Text("Share")
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                      padding: EdgeInsets.all(2),
                                                      decoration: BoxDecoration(
                                                          color: Colors.blue,
                                                          shape: BoxShape.circle),
                                                      child: Icon(
                                                        Icons.unarchive_rounded,
                                                        color: Colors.white,
                                                      )),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text("Narrate")
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Text(getDate(demoList.createdAt)),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  demoList.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  demoList.shortDescription,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewsWebPage(
                              url: demoList.url,
                            )),
                  );
                },
                child: Container(
                  height: 40,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Swipe to Read full"),
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 2,
              )
            ],
          )
        ],
      ),
    );
  }

  getDate(String createdAt) {
    DateTime parseDate =
        new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(createdAt);
    DateTime tempDate =
        new DateFormat("yyyy-MM-dd hh:mm").parse(parseDate.toString());
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('dd MMM yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);
    print(outputDate);
    return outputDate;
  }

  _takeScreenshotandShare() async {
    _imageFile = null;
    screenshotController
        .capture(delay: Duration(milliseconds: 10), pixelRatio: 2.0)
        .then((Uint8List image) async {
      setState(() {
        _imageFile = image;
      });
      final directory = (await getApplicationDocumentsDirectory()).path;
      File imgFile = new File('$directory/screenshot.png');
      imgFile.writeAsBytes(_imageFile);
      print("File Saved to Gallery");
      await Share.file('Anupam', 'screenshot.png', _imageFile, 'image/png');
    }).catchError((onError) {
      print(onError);
    });
  }
}
