import 'dart:convert';
import 'package:doctor_app/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppointmentBooking extends StatefulWidget {
  final String doctorId;
  final String userID;
  final String userName;
  final String doctorName;
  final int userPhone;
  AppointmentBooking(this.doctorId, this.userID, this.userName, this.doctorName,
      this.userPhone);

  @override
  _AppointmentBookingState createState() => _AppointmentBookingState(
      doctorId, userID, userName, doctorName, userPhone);
}

class _AppointmentBookingState extends State<AppointmentBooking> {
  final String doctorId;
  final String userID;
  final String userName;
  final String doctorName;
  final int userPhone;
  _AppointmentBookingState(this.doctorId, this.userID, this.userName,
      this.doctorName, this.userPhone);

  bool _mondaySelected;
  bool _tuesdaySelected;
  bool _wednesdaySelected;
  bool _thursdaySelected;
  bool _fridaySelected;
  bool _saturdaySelected;
  bool _sundaySelected;

  Map user;
  Map doctor;

  String doctorDesignation;

  Map monday;
  Map tuesday;
  Map wednesday;
  Map thursday;
  Map friday;
  Map saturday;
  Map sunday;

  String mondayChamber;
  String tuesdayChamber;
  String wednesdayChamber;
  String thursdayChamber;
  String fridayChamber;
  String saturdayChamber;
  String sundayChamber;

  String mondayTime;
  String tuesdayTime;
  String wednesdayTime;
  String thursdayTime;
  String fridayTime;
  String saturdayTime;
  String sundayTime;

  String mondaySlot;
  String tuesdaySlot;
  String wednesdaySlot;
  String thursdaySlot;
  String fridaySlot;
  String saturdaySlot;
  String sundaySlot;

  String mondayNumber;
  String tuesdayNumber;
  String wednesdayNumber;
  String thursdayNumber;
  String fridayNumber;
  String saturdayNumber;
  String sundayNumber;

  int mondaySlotInt;
  int tuesdaySlotInt;
  int wednesdaySlotInt;
  int thursdaySlotInt;
  int fridaySlotInt;
  int saturdaySlotInt;
  int sundaySlotInt;

  String day;
  String time;
  String place;

  @override
  void initState() {
    super.initState();

    print("+51" + "$userPhone");

    /*
    _razorpay = new Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, successHandler);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, failureHandler);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalWalletHandler);*/

    _mondaySelected = false;
    _tuesdaySelected = false;
    _wednesdaySelected = false;
    _thursdaySelected = false;
    _fridaySelected = false;
    _saturdaySelected = false;
    _sundaySelected = false;

    getUserDetails();

    getMonday();
    getTuesday();
    getWednesday();
    getThursday();
    getFriday();
    getSaturday();
    getSunday();

    getDoctorData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void externalWalletHandler() {
    print('External Wallet');
  }

  getDoctorData() async {
    final String url =
        'https://doctor-api.up.railway.app/api/doctor/$doctorId/';
    var response = await http.get(Uri.parse(url));
    if (!mounted) return;
    setState(() {
      var convertJson = json.decode(response.body);
      doctor = convertJson;
      doctorDesignation = doctor['designation'];
      print(doctorDesignation);
    });
  }

  getUserDetails() async {
    final String url = 'https://doctor-api.up.railway.app/api/user/$userID/';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
    });
    if (!mounted) return;
    setState(() {
      var convertJson = json.decode(response.body);
      user = convertJson;
      print(user);
    });
  }

  getMonday() async {
    final String url =
        'https://doctor-api.up.railway.app/api/monday/$doctorId/';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
    });
    if (!mounted) return;
    setState(() {
      var convertJson = json.decode(response.body);
      monday = convertJson;
      mondayChamber = monday['chamber_location'];
      mondayTime = monday['available_time'];
      mondaySlot = monday['slots_available'].toString();
      mondaySlotInt = monday['slots_available'];
    });
    // print(mondaySlotInt);
  }

  getTuesday() async {
    final String url =
        'https://doctor-api.up.railway.app/api/tuesday/$doctorId/';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
    });
    if (!mounted) return;
    setState(() {
      var convertJson = json.decode(response.body);
      tuesday = convertJson;
      tuesdayChamber = tuesday['chamber_location'];
      tuesdayTime = tuesday['available_time'];
      tuesdaySlot = tuesday['slots_available'].toString();
      tuesdaySlotInt = tuesday['slots_available'];
    });
  }

  getWednesday() async {
    final String url =
        'https://doctor-api.up.railway.app/api/wednesday/$doctorId/';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
    });
    if (!mounted) return;
    setState(() {
      var convertJson = json.decode(response.body);
      wednesday = convertJson;
      wednesdayChamber = wednesday['chamber_location'];
      wednesdayTime = wednesday['available_time'];
      wednesdaySlot = wednesday['slots_available'].toString();
      wednesdaySlotInt = wednesday['slots_available'];
    });
  }

  getThursday() async {
    final String url =
        'https://doctor-api.up.railway.app/api/thursday/$doctorId/';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
    });
    if (!mounted) return;
    setState(() {
      var convertJson = json.decode(response.body);
      thursday = convertJson;
      thursdayChamber = thursday['chamber_location'];
      thursdayTime = thursday['available_time'];
      thursdaySlot = thursday['slots_available'].toString();
      thursdaySlotInt = thursday['slots_available'];
    });
  }

  getFriday() async {
    final String url =
        'https://doctor-api.up.railway.app/api/friday/$doctorId/';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
    });
    if (!mounted) return;
    setState(() {
      var convertJson = json.decode(response.body);
      friday = convertJson;
      fridayChamber = friday['chamber_location'];
      fridayTime = friday['available_time'];
      fridaySlot = friday['slots_available'].toString();
      fridaySlotInt = friday['slots_available'];
    });
  }

  getSaturday() async {
    final String url =
        'https://doctor-api.up.railway.app/api/saturday/$doctorId/';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
    });
    if (!mounted) return;
    setState(() {
      var convertJson = json.decode(response.body);
      saturday = convertJson;
      saturdayChamber = saturday['chamber_location'];
      saturdayTime = saturday['available_time'];
      saturdaySlot = saturday['slots_available'].toString();
      saturdaySlotInt = saturday['slots_available'];
    });
  }

  getSunday() async {
    final String url =
        'https://doctor-api.up.railway.app/api/sunday/$doctorId/';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
    });
    if (!mounted) return;
    setState(() {
      var convertJson = json.decode(response.body);
      sunday = convertJson;
      sundayChamber = sunday['chamber_location'];
      sundayTime = sunday['available_time'];
      sundaySlot = sunday['slots_available'].toString();
      sundaySlotInt = sunday['slots_available'];
    });
  }

  decreaseMondaySlot(int mondaySlotValue) async {
    final String url =
        'https://doctor-api.up.railway.app/api/monday/$doctorId/';
    var response = await http.put(
      Uri.parse(url),
      body: {
        'slots_available': mondaySlotValue.toString(),
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('something error');
    }
  }

  decreaseTuesdaySlot(int tuesdaySlotValue) async {
    final String url =
        'https://doctor-api.up.railway.app/api/tuesday/$doctorId/';
    var response = await http.put(
      Uri.parse(url),
      body: {
        'slots_available': tuesdaySlotValue.toString(),
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('something error');
    }
  }

  decreaseWednesdaySlot(int wednesdaySlotValue) async {
    final String url =
        'https://doctor-api.up.railway.app/api/wednesday/$doctorId/';
    var response = await http.put(
      Uri.parse(url),
      body: {
        'slots_available': wednesdaySlotValue.toString(),
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('something error');
    }
  }

  decreaseThursdaySlot(int thursdaySlotValue) async {
    final String url =
        'https://doctor-api.up.railway.app/api/thursday/$doctorId/';
    var response = await http.put(
      Uri.parse(url),
      body: {
        'slots_available': thursdaySlotValue.toString(),
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('something error');
    }
  }

  decreaseFridaySlot(int fridaySlotValue) async {
    final String url =
        'https://doctor-api.up.railway.app/api/friday/$doctorId/';
    var response = await http.put(
      Uri.parse(url),
      body: {
        'slots_available': fridaySlotValue.toString(),
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('something error');
    }
  }

  decreaseSaturdaySlot(int saturdaySlotValue) async {
    final String url =
        'https://doctor-api.up.railway.app/api/saturday/$doctorId/';
    var response = await http.put(
      Uri.parse(url),
      body: {
        'slots_available': saturdaySlotValue.toString(),
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('something error');
    }
  }

  decreaseSundaySlot(int sundaySlotValue) async {
    final String url =
        'https://doctor-api.up.railway.app/api/sunday/$doctorId/';
    var response = await http.put(
      Uri.parse(url),
      body: {
        'slots_available': sundaySlotValue.toString(),
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('something error');
    }
  }

  appointment() async {
    final String url = 'https://doctor-api.up.railway.app/api/appointment/';
    var response = await http.post(Uri.parse(url), body: {
      "username": userName,
      "doctorname": doctorName,
      "place": place,
      "day": day,
      "time": time,
      "user": userID,
      "doctor": doctorId,
    });
    String daySpanish(day) {
      switch (day) {
        case 'Monday':
          {
            return ("Lunes");
          }
          break;

        case 'Tuesday':
          {
            return ("Martes");
          }
          break;

        case 'Wednesday':
          {
            return ("Miercoles");
          }
          break;

        case 'Thursday':
          {
            return ("Jueves");
          }
          break;

        case 'Friday':
          {
            return ("Viernes");
          }
          break;

        case 'Saturday':
          {
            return ("Sabado");
          }
          break;

        case 'Sunday':
          {
            return ("Domingo");
          }
          break;

        default:
          {
            return ("NO");
          }
          break;
      }
    }

    var dia = daySpanish(day);
    if (response.statusCode == 201) {
      showDialog(
        context: (context),
        builder: (_) => AlertDialog(
          title: Text('Éxito'),
          content: Text(
              'Ha reservado con éxito la cita a las $time el dia $dia en $place con el Dr. $doctorName($doctorDesignation).'),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (day == 'Monday') {
                  mondaySlotInt = mondaySlotInt - 1;
                  decreaseMondaySlot(mondaySlotInt);
                } else if (day == 'Tuesday') {
                  tuesdaySlotInt = tuesdaySlotInt - 1;
                  decreaseTuesdaySlot(tuesdaySlotInt);
                } else if (day == 'Wednesday') {
                  wednesdaySlotInt = wednesdaySlotInt - 1;
                  decreaseWednesdaySlot(wednesdaySlotInt);
                } else if (day == 'Thursday') {
                  thursdaySlotInt = thursdaySlotInt - 1;
                  decreaseThursdaySlot(thursdaySlotInt);
                } else if (day == 'Friday') {
                  fridaySlotInt = fridaySlotInt - 1;
                  decreaseFridaySlot(fridaySlotInt);
                } else if (day == 'Saturday') {
                  saturdaySlotInt = saturdaySlotInt - 1;
                  decreaseSaturdaySlot(saturdaySlotInt);
                } else if (day == 'Sunday') {
                  sundaySlotInt = sundaySlotInt - 1;
                  decreaseSundaySlot(sundaySlotInt);
                }

                Navigator.pop(context);
              },
              child: Text('Cerrar'),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Algo salió mal. ¡Intentar otra vez!')));
    }
  }

  appointmentNotBooked() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Fracasado'),
        content: Text("¡Lo sentimos!\No se pudo reservar su cita"),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getMonday();
    getTuesday();
    getWednesday();
    getThursday();
    getFriday();
    getSaturday();
    getSunday();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Clínicas Disponibles',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Palette.scaffoldColor,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          elevation: 0,
        ),
        body: mondayChamber != "" && mondaySlotInt != 0 ||
                tuesdayChamber != "" && tuesdaySlotInt != 0 ||
                wednesdayChamber != "" && wednesdaySlotInt != 0 ||
                thursdayChamber != "" && thursdaySlotInt != 0 ||
                fridayChamber != "" && fridaySlotInt != 0 ||
                saturdayChamber != "" && saturdaySlotInt != 0 ||
                sundayChamber != "" && sundaySlotInt != 0
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                // color: Colors.yellow,
                child: mondayChamber != "" && mondaySlotInt != 0 ||
                        tuesdayChamber != "" && tuesdaySlotInt != 0 ||
                        wednesdayChamber != "" && wednesdaySlotInt != 0 ||
                        thursdayChamber != "" && thursdaySlotInt != 0 ||
                        fridayChamber != "" && fridaySlotInt != 0 ||
                        saturdayChamber != "" && saturdaySlotInt != 0 ||
                        sundayChamber != "" && sundaySlotInt != 0
                    ? Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.75,
                            width: MediaQuery.of(context).size.width,
                            // color: Colors.yellow,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      //!Monday
                                      mondayChamber != "" && mondaySlotInt != 0
                                          ? Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      print('clicked');

                                                      day = 'Monday';
                                                      place = mondayChamber;
                                                      time = mondayTime;

                                                      print(place);
                                                      print(day);
                                                      print(time);

                                                      _mondaySelected = true;
                                                      _tuesdaySelected = false;
                                                      _wednesdaySelected =
                                                          false;
                                                      _thursdaySelected = false;
                                                      _fridaySelected = false;
                                                      _saturdaySelected = false;
                                                      _sundaySelected = false;
                                                    });
                                                  },
                                                  child: Container(
                                                    // padding: EdgeInsets.only(left: 30),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.1,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                    decoration: BoxDecoration(
                                                      // color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: _mondaySelected !=
                                                              false
                                                          ? Border.all(
                                                              color:
                                                                  Colors.green,
                                                              width: 3)
                                                          : Border.all(),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "LUN |",
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              mondayChamber !=
                                                                      null
                                                                  ? mondayChamber
                                                                  : '',
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            ),
                                                            Text(mondayTime !=
                                                                    null
                                                                ? mondayTime
                                                                : "")
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Text(
                                                          "|",
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Cupo Disponible',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                            Text(mondaySlot !=
                                                                    null
                                                                ? mondaySlot
                                                                : "")
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Offstage(),

                                      //! Tuesday
                                      tuesdayChamber != "" &&
                                              tuesdaySlotInt != 0
                                          ? Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      print('clicked');

                                                      day = 'Tuesday';
                                                      place = tuesdayChamber;
                                                      time = tuesdayTime;

                                                      print(place);
                                                      print(day);
                                                      print(time);

                                                      _mondaySelected = false;
                                                      _tuesdaySelected = true;
                                                      _wednesdaySelected =
                                                          false;
                                                      _thursdaySelected = false;
                                                      _fridaySelected = false;
                                                      _saturdaySelected = false;
                                                      _sundaySelected = false;
                                                    });
                                                  },
                                                  child: Container(
                                                    // padding: EdgeInsets.only(left: 30),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.1,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                    decoration: BoxDecoration(
                                                      // color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border:
                                                          _tuesdaySelected !=
                                                                  false
                                                              ? Border.all(
                                                                  color: Colors
                                                                      .green,
                                                                  width: 3)
                                                              : Border.all(),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "MAR |",
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              tuesdayChamber !=
                                                                      null
                                                                  ? tuesdayChamber
                                                                  : '',
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            ),
                                                            Text(tuesdayTime !=
                                                                    null
                                                                ? tuesdayTime
                                                                : "")
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Text(
                                                          "|",
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Cupo Disponible',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                            Text(tuesdaySlot !=
                                                                    null
                                                                ? tuesdaySlot
                                                                : "")
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Offstage(),

                                      //! Wednesday
                                      wednesdayChamber != "" &&
                                              wednesdaySlotInt != 0
                                          ? Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      print('clicked');

                                                      day = 'Wednesday';
                                                      place = wednesdayChamber;
                                                      time = wednesdayTime;

                                                      print(place);
                                                      print(day);
                                                      print(time);

                                                      _mondaySelected = false;
                                                      _tuesdaySelected = false;
                                                      _wednesdaySelected = true;
                                                      _thursdaySelected = false;
                                                      _fridaySelected = false;
                                                      _saturdaySelected = false;
                                                      _sundaySelected = false;
                                                    });
                                                  },
                                                  child: Container(
                                                    // padding: EdgeInsets.only(left: 30),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.1,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                    decoration: BoxDecoration(
                                                      // color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border:
                                                          _wednesdaySelected ==
                                                                  false
                                                              ? Border.all()
                                                              : Border.all(
                                                                  color: Colors
                                                                      .green,
                                                                  width: 3),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "MIE |",
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              wednesdayChamber !=
                                                                      null
                                                                  ? wednesdayChamber
                                                                  : '',
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            ),
                                                            Text(wednesdayTime !=
                                                                    null
                                                                ? wednesdayTime
                                                                : "")
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Text(
                                                          "|",
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Cupo Disponible',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                            Text(wednesdaySlot !=
                                                                    null
                                                                ? wednesdaySlot
                                                                : "")
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Offstage(),

                                      //! Thursday
                                      thursdayChamber != "" &&
                                              thursdaySlotInt != 0
                                          ? Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      print('clicked');

                                                      day = 'Thursday';
                                                      place = thursdayChamber;
                                                      time = thursdayTime;

                                                      print(place);
                                                      print(day);
                                                      print(time);

                                                      _mondaySelected = false;
                                                      _tuesdaySelected = false;
                                                      _wednesdaySelected =
                                                          false;
                                                      _thursdaySelected = true;
                                                      _fridaySelected = false;
                                                      _saturdaySelected = false;
                                                      _sundaySelected = false;
                                                    });
                                                  },
                                                  child: Container(
                                                    // padding: EdgeInsets.only(left: 30),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.1,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                    decoration: BoxDecoration(
                                                      // color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border:
                                                          _thursdaySelected ==
                                                                  false
                                                              ? Border.all()
                                                              : Border.all(
                                                                  color: Colors
                                                                      .green,
                                                                  width: 3),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "JUE |",
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              thursdayChamber !=
                                                                      null
                                                                  ? thursdayChamber
                                                                  : '',
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            ),
                                                            Text(thursdayTime !=
                                                                    null
                                                                ? thursdayTime
                                                                : "")
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Text(
                                                          "|",
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Cupo Disponible',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                            Text(thursdaySlot !=
                                                                    null
                                                                ? thursdaySlot
                                                                : "")
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Offstage(),

                                      //! Friday
                                      fridayChamber != "" && fridaySlotInt != 0
                                          ? Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      print('clicked');

                                                      day = 'Friday';
                                                      place = fridayChamber;
                                                      time = fridayTime;

                                                      print(place);
                                                      print(day);
                                                      print(time);

                                                      _mondaySelected = false;
                                                      _tuesdaySelected = false;
                                                      _wednesdaySelected =
                                                          false;
                                                      _thursdaySelected = false;
                                                      _fridaySelected = true;
                                                      _saturdaySelected = false;
                                                      _sundaySelected = false;
                                                    });
                                                  },
                                                  child: Container(
                                                    // padding: EdgeInsets.only(left: 30),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.1,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                    decoration: BoxDecoration(
                                                      // color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: _fridaySelected ==
                                                              false
                                                          ? Border.all()
                                                          : Border.all(
                                                              color:
                                                                  Colors.green,
                                                              width: 3),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "VIE |",
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              fridayChamber !=
                                                                      null
                                                                  ? fridayChamber
                                                                  : '',
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            ),
                                                            Text(fridayTime !=
                                                                    null
                                                                ? fridayTime
                                                                : "")
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Text(
                                                          "|",
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Cupo Disponible',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                            Text(fridaySlot !=
                                                                    null
                                                                ? fridaySlot
                                                                : "")
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Offstage(),

                                      //! Saturday
                                      saturdayChamber != "" &&
                                              saturdaySlotInt != 0
                                          ? Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      print('clicked');

                                                      day = 'Saturday';
                                                      place = saturdayChamber;
                                                      time = saturdayTime;

                                                      print(place);
                                                      print(day);
                                                      print(time);

                                                      _mondaySelected = false;
                                                      _tuesdaySelected = false;
                                                      _wednesdaySelected =
                                                          false;
                                                      _thursdaySelected = false;
                                                      _fridaySelected = false;
                                                      _saturdaySelected = true;
                                                      _sundaySelected = false;
                                                    });
                                                  },
                                                  child: Container(
                                                    // padding: EdgeInsets.only(left: 30),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.1,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                    decoration: BoxDecoration(
                                                      // color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border:
                                                          _saturdaySelected ==
                                                                  false
                                                              ? Border.all()
                                                              : Border.all(
                                                                  color: Colors
                                                                      .green,
                                                                  width: 3),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "SAB |",
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              saturdayChamber !=
                                                                      null
                                                                  ? saturdayChamber
                                                                  : '',
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            ),
                                                            Text(saturdayTime !=
                                                                    null
                                                                ? saturdayTime
                                                                : "")
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Text(
                                                          "|",
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Cupo Disponible',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                            Text(saturdaySlot !=
                                                                    null
                                                                ? saturdaySlot
                                                                : "")
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Offstage(),

                                      //! Sunday
                                      sundayChamber != "" && sundaySlotInt != 0
                                          ? Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      print('clicked');

                                                      day = 'Sunday';
                                                      place = sundayChamber;
                                                      time = sundayTime;

                                                      print(place);
                                                      print(day);
                                                      print(time);

                                                      _mondaySelected = false;
                                                      _tuesdaySelected = false;
                                                      _wednesdaySelected =
                                                          false;
                                                      _thursdaySelected = false;
                                                      _fridaySelected = false;
                                                      _saturdaySelected = false;
                                                      _sundaySelected = true;
                                                    });
                                                  },
                                                  child: Container(
                                                    // padding: EdgeInsets.only(left: 30),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.1,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                    decoration: BoxDecoration(
                                                      // color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: _sundaySelected ==
                                                              false
                                                          ? Border.all()
                                                          : Border.all(
                                                              color:
                                                                  Colors.green,
                                                              width: 3),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "DOM |",
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              sundayChamber !=
                                                                      null
                                                                  ? sundayChamber
                                                                  : '',
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            ),
                                                            Text(sundayTime !=
                                                                    null
                                                                ? sundayTime
                                                                : "")
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Text(
                                                          "|",
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Cupo Disponible',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                            Text(sundaySlot !=
                                                                    null
                                                                ? sundaySlot
                                                                : "")
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Offstage(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 50,
                            width: 100,
                            // alignment: Alignment.bottomCenter,
                            // color: Colors.red,
                            child: ElevatedButton(
                              onPressed: _mondaySelected ||
                                      _tuesdaySelected ||
                                      _wednesdaySelected ||
                                      _thursdaySelected ||
                                      _fridaySelected ||
                                      _saturdaySelected ||
                                      _sundaySelected
                                  ? () {
                                      print('clicked on book');
                                      appointment();
                                    }
                                  : null,
                              child: Text('Reservar'),
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              )
            : Center(
                child: Text("No hay clínicas disponibles"),
              ),
      ),
    );
  }
}
