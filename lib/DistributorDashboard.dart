import 'package:flutter/material.dart';
import 'package:order_stack/components/colorValues.dart';

class DistributorDashboard extends StatefulWidget {
  @override
  _DistributorDashboardState createState() => _DistributorDashboardState();
}

class _DistributorDashboardState extends State<DistributorDashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorValues.THEME_COLOR),
      appBar: AppBar(
          backgroundColor: Color(ColorValues.THEME_COLOR),
          elevation: 0,
          leading: Builder(
            builder: (context) =>
                IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/images/drawer.png'),
                    color: Color(ColorValues.WHITE),
                    size: 50,
                  ),
                  onPressed: () {
                  },
                ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // GestureDetector(
              //     onTap: () => Scaffold.of(context).openDrawer(),
              //     child: Expanded(flex:2,child: Image(image: AssetImage('assets/images/Menu.png'),height: 15.7,width: 26,))),
              Expanded(
                flex: 10,
                child: Text(
                  "Welcome to HomeLabz!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(ColorValues.WHITE_COLOR),
                    fontFamily: "Regular",
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () {
                   // print(imageName);
                    //call Profile Screen\
                   // callProfileScreen();
                  },
                  child: Image(
                    image: AssetImage('assets/images/profile.png'),
                    height: 44,
                    width: 44,
                  ),
                ),
              ),
            ],)
      ),
      body:
      // SingleChildScrollView(
      //   child:
      Stack(children: [
        Positioned(
          top: MediaQuery
              .of(context)
              .size
              .height * 0.125,
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height,
            decoration: BoxDecoration(
                color: Color(ColorValues.WHITE_COLOR),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0))),
          ),
        ),
        // Positioned(
        //   left: 5,
        //   top: 5,
        //   width: MediaQuery.of(context).size.width,
        //   height: 100,
        //   child: Container(
        //       alignment: Alignment.center,
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //       ),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           //Expanded(flex:2,child: Image(image: AssetImage('assets/images/Menu.png'),height: 15.7,width: 26,)),
        //           Expanded(
        //             flex: 10,
        //             child: Text(
        //               "Welcome to HomeLabz!",
        //               textAlign: TextAlign.center,
        //               style: TextStyle(
        //                 color: Color(ColorValues.WHITE_COLOR),
        //                 fontFamily: "Regular",
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 18.0,
        //               ),
        //             ),
        //           ),
        //           Expanded(
        //             flex: 2,
        //             child: GestureDetector(
        //               onTap: () {},
        //               child: Image(
        //                 image: AssetImage('assets/images/profile.png'),
        //                 height: 44,
        //                 width: 44,
        //               ),
        //             ),
        //           ),
        //         ],
        //       )),
        // ),
        Positioned(
          top: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.only(
                    top: 9, bottom: 25, left: 50, right: 50),
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.25,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.9,
                decoration: BoxDecoration(
                    color: Color(ColorValues.WHITE_COLOR),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 7.0,
                        spreadRadius: 0.0,
                      )
                    ]),
                child: Image.asset('assets/images/homeScreenLogo.png'),
              ),
            ],
          ),
        ),
        Positioned(
          top: -80,
          left: 0,
          right: 0,
          child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.44,
                  left: 25,
                  right: 25),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    
                                  },
                                  child: Container(
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.17,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Color(ColorValues.THEME_COLOR),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                  'assets/images/Appointment.png'),
                                              height: 40,
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(
                                              "Make an\nAppointment ",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: "Regular",
                                                color: Color(
                                                    ColorValues.WHITE_COLOR),
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
//                    SizedBox(width: 20.0),
                          Expanded(
                            flex: 1,
                            child: Column(children: [
                              GestureDetector(
                                onTap: () {
                                },
                                child: Container(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.17,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Color(ColorValues.THEME_COLOR),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          Image(
                                            image:
                                            AssetImage(
                                                'assets/images/call.png'),
                                            height: 40,
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          Text(
                                            "Call for\nAppointment",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: "Regular",
                                              color: Color(
                                                  ColorValues.WHITE_COLOR),
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                          )
                        ],
                      ),
                    ),
//                SizedBox(height: 25.0),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.17,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Color(ColorValues.THEME_COLOR),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                  'assets/images/vault.png'),
                                              height: 50,
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(
                                              "Vault",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: "Regular",
                                                color: Color(
                                                    ColorValues.WHITE_COLOR),
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
//                    SizedBox(width: 20.0),
                          Expanded(
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                  },
                                  child: Container(
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.17,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Color(ColorValues.THEME_COLOR),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                  'assets/images/history.png'),
                                              height: 40,
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(
                                              "History",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: "Regular",
                                                color: Color(
                                                    ColorValues.WHITE_COLOR),
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])),
        ),
      ]),
    );
  }
   _bottomSheet1(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return FittedBox(
            child:
            Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              decoration: BoxDecoration(
                  color: Color(ColorValues.WHITE_COLOR),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 38),
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(ColorValues.THEME_COLOR),
                        fontFamily: "Regular",
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 50),
                    child: Image(
                      image: AssetImage("assets/images/RegisterIcon.png"),
                      height: 65,
                      width: 65,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      "Enter Your Mobile Number",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(ColorValues.BLACK_COLOR),
                        fontFamily: "Black",
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Center(
                        child: Text(
                          "We will send you one time\npassword(OTP)",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(ColorValues.BLACK_TEXT_COL),
                            fontFamily: "Regular",
                          ),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Text("hdjj")
//                      child: TextFormField(
//                        textAlign: TextAlign.center,
//                        keyboardType: TextInputType.phone,
//                        controller: mobile,
//                        validator: (mobile) {
//                            return mobile.isEmpty ? ConstantMsg.NAME_VALIDATION : null;
//                          },
//                        decoration: InputDecoration(
//                          hintText: "Enter Mobile Number",
//                          hintStyle: TextStyle(
//                            color: Color(0xffBDBDBD),
//                            fontSize: 12.0,
//                            fontFamily: "Regular",
//                          ),
//                        ),
//                      )
                  ),
                  GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                      height: 35,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.53,
                      margin: EdgeInsets.symmetric(vertical: 25),
                      decoration: BoxDecoration(
                        color: Color(ColorValues.THEME_COLOR),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                            "SEND",
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 14,
                              fontFamily: "Bold",
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}