import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './style.dart' as style;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';

void main() async {

  runApp(
      MaterialApp(
          // theme: style.theme,
          // initialRoute: '/',
          // routes: {
          //   '/' : (c) => MyApp(),
          //   '/detail' : (c) => Upload()
          // },
          home:MyApp()
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var main_date = '2022.1.2 (목)';
  var main_name = '허성만';
  var main_state = '미출근';
  // var main_middle_state = '출근';
  var main_middle_state = '퇴근';
  var main_middle_text = '서울시 강남구 논현동 111-11';

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return  Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 380,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff61c0bd),
                      Color(0xff008cd6),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/main-logo.svg',
                          width: 80,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 29, 0, 44),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent
                          ),
                          child: Icon(Icons.arrow_back_ios_sharp, size: 20,),
                          onPressed: () {},
                        ),
                        Text('${main_date}', style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                        ),),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent
                          ),
                          child: Icon(Icons.arrow_forward_ios_sharp, size: 20),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10)
                                ),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      width: 70,
                                      height: 70,
                                      child: Image.asset('assets/profile.jpg'),
                                    )
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('${main_name}' ,style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22
                                    ),),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      padding: EdgeInsets.fromLTRB(10, 2.5, 10, 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)
                                        ),
                                        color: Colors.grey,
                                      ),
                                      child: Text('${main_state}' ,style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13
                                      ),),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('안녕하세요, ${main_name}님', style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                              child: Text('현재 ${main_state}\n상태입니다.', style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ), textAlign: TextAlign.end,),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 330,
              left: MediaQuery.of(context).size.width * 0.05,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(97, 192, 189, 0.2),
                      offset: Offset(10.0, 10.0),
                      blurRadius: 30.0                      
                    )
                  ]
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 250,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Container(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/main-check.svg',
                              width: 30,
                            ),
                            Container(
                              margin: EdgeInsets.only(top:10),
                              child: Text('${main_middle_state} 등록', style: TextStyle(
                                  color: Color(0xff2E2E2E),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22
                              ),),
                            ),
                          ],
                        )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right:5),
                          child: Text('${main_middle_text}', style: TextStyle(
                              color: Color(0xff646464).withOpacity(.6),
                              fontWeight: FontWeight.w400,
                              fontSize: 12
                          ),),
                        ),
                        SvgPicture.asset(
                          'assets/main-map.svg',
                          width: 25,
                        ),
                      ],),
                  ],
                ),
              )
          ),
          Positioned(
              top: 600,
              left: MediaQuery.of(context).size.width * 0.05,
              child: main_middle_state == "출근" ? main_btm_map() : main_btm_register()
          )
        ],
      )
    );
  }
}

class main_btm_map extends StatelessWidget {
  const main_btm_map({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 250,
      padding: EdgeInsets.all(20),
      child: Align(
        child: Text('지도 API', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),
      ),
    );
  }
}

class main_btm_register extends StatelessWidget {
  const main_btm_register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(97, 192, 189, 0.2),
                  offset: Offset(10.0, 10.0),
                  blurRadius: 30.0
              )
            ]
          ),
          width: MediaQuery.of(context).size.width * 0.425,
          height: 250,
          padding: EdgeInsets.all(20),
          child: Align(
            child:
            Text('일지 등록', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(97, 192, 189, 0.2),
                    offset: Offset(10.0, 10.0),
                    blurRadius: 30.0
                )
              ]
            ),
            width: MediaQuery.of(context).size.width * 0.425,
            height: 250,
            padding: EdgeInsets.all(20),
            child: Align(
              child:
              Text('인증사진 등록', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),),
          ),
        ],
      ),
    );
  }
}









