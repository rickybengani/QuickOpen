import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Submit extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  String url;
  String email;

  Submit(this.formKey, this.email);

  Future<List> _senddata() async {
    formKey.currentState.save();
    try {
      var server = 'http://10.0.2.2:8080/sendData.php';
      var response = await http.post(server, body: {
        'email': email,
        'url': url,
      });
      formKey.currentState.reset();
      print('Response status: ${response.statusCode}');
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'URL:',
                ),
                onSaved: (input) {
                  url = input;
                },
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: _senddata,
                    child: Text('Send'),
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }

  // void post() async {
  //   var result = await http.post("http://10.0.2.2:8080/sendData.php",
  //       body: {"email": _email, "url": _url});
  //   print(result.body);
  // }

  // void _submit() {
  //   formKey.currentState.save();
  //   post();
  //   print(_email);
  //   print(_url);
  // }
}
