import 'dart:convert';

import 'package:doctor_app/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MondayScreen extends StatefulWidget {
  final String doctorId;
  MondayScreen(this.doctorId);

  @override
  _MondayScreenState createState() => _MondayScreenState(doctorId);
}

class _MondayScreenState extends State<MondayScreen> {
  final String doctorId;
  _MondayScreenState(this.doctorId);

  Map data;
  String chamberLocation = "";

  final _formKey = GlobalKey<FormState>();

  String clinicText;

  String _chosenValue;

  final _clinic = TextEditingController();
  final _timeController = TextEditingController();

  TimeOfDay time;

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? initialTime,
    );
    if (newTime == null) return;
    setState(() {
      time = newTime;
      _timeController.text = newTime.format(context);
    });
  }

  sendData() async {
    // final String url = 'https://doctor-api.up.railway.app/api/monday/$doctorId/';
    final String url =
        'https://doctor-api.up.railway.app/api/monday/$doctorId/';
    var response = await http.put(Uri.parse(url), body: {
      "monday_id": doctorId,
      "chamber_location": clinicText,
      "available_time": _timeController.text,
      "slots_available": _chosenValue,
      "monday_name": doctorId
    });

    if (response.statusCode == 200) {
      print(response.body);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Clinica del lunes cargado")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Something Went Wrong")));
    }
  }

  updateChamber() async {
    // final String url = 'https://doctor-api.up.railway.app/api/chamber/$doctorId/';
    final String url =
        'https://doctor-api.up.railway.app/api/chamber/$doctorId/';
    try {
      var response = await http.put(Uri.parse(url), body: {
        "chamber_id": doctorId,
        "name": doctorId,
        "sunday_chamber": doctorId,
        "monday_chamber": doctorId,
        "tuesday_chamber": doctorId,
        "wednesday_chamber": doctorId,
        "thursday_chamber": doctorId,
        "friday_chamber": doctorId,
        "saturday_chamber": doctorId
      });

      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    // final String url = 'https://doctor-api.up.railway.app/api/monday/$doctorId/';
    final String url =
        'https://doctor-api.up.railway.app/api/monday/$doctorId/';
    var response = await http.get(Uri.parse(url));
    if (!mounted) return;
    setState(() {
      var convertJson = json.decode(response.body);
      data = convertJson;
      chamberLocation = data['chamber_location'];
      print(data);
      print(chamberLocation);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "LUNES",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Palette.scaffoldColor,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // color: Colors.red,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //! Clinic Location
                      chamberLocation == ""
                          ? TextFormField(
                              decoration: InputDecoration(
                                label: Text("Ubicación de la clínica"),
                                alignLabelWithHint: true,
                                border: OutlineInputBorder(),
                              ),
                              textCapitalization: TextCapitalization.words,
                              controller: _clinic,
                              validator: clinicValidate,
                              onSaved: (value) {
                                clinicText = value;
                              },
                            )
                          : TextFormField(
                              decoration: InputDecoration(
                                label: Text("Ubicación de la clínica"),
                                alignLabelWithHint: true,
                                border: OutlineInputBorder(),
                              ),
                              textCapitalization: TextCapitalization.words,
                              controller: _clinic
                                ..text = data['chamber_location'],
                              validator: clinicValidate,
                              onSaved: (value) {
                                clinicText = value;
                              },
                            ),
                      SizedBox(
                        height: 20,
                      ),

                      //! Slots Available
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          label: Text("Elija cantidad de pacientes"),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => value == null
                            ? 'El campo no debe estar vacío'
                            : null,
                        isExpanded: true,
                        value: _chosenValue,
                        items: [
                          '0',
                          '1',
                          '2',
                          '3',
                          '4',
                          '5',
                          '6',
                          '7',
                          '8',
                          '9',
                          '10',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String value) {
                          setState(() {
                            _chosenValue = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),

                      //! Available Time
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            // color: Colors.red,
                            child: TextFormField(
                              decoration: InputDecoration(
                                label: Text("Tiempo disponible"),
                                alignLabelWithHint: true,
                                border: OutlineInputBorder(),
                              ),
                              enabled: false,
                              controller: _timeController,
                            ),
                          ),
                          SizedBox(width: 10),
                          IconButton(
                              icon: Icon(Icons.access_time),
                              onPressed: () {
                                pickTime(context);
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    sendData();

                    Future.delayed(Duration(seconds: 1), () {
                      updateChamber();
                    });
                  }
                  print(clinicText);
                  print(_chosenValue);
                  print(_timeController.text);

                  FocusScope.of(context).unfocus();
                },
                child: Text("Guardar"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String clinicValidate(String clinic) {
    if (clinic.isEmpty) {
      return "La clínica no debe estar vacía.";
    } else {
      return null;
    }
  }

  String timeValidate(String time) {
    if (time.isEmpty) {
      return "Time must not be empty";
    } else {
      return null;
    }
  }
}
