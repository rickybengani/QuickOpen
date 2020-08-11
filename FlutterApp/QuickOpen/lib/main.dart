import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './submit.dart';

import 'package:http/http.dart' as http;
import 'dart:async';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);

void main() {
  runApp(
    MaterialApp(
      title: 'Quick Open: Sign In',
      home: SignInDemo(),
    ),
  );
}

class SignInDemo extends StatefulWidget {
  SignInDemo({Key key}) : super(key: key);
  @override
  _SignInDemoState createState() => _SignInDemoState();
}

class _SignInDemoState extends State<SignInDemo> {
  GoogleSignInAccount _currentUser;
  final formKey = GlobalKey<FormState>();
  // String _url;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quick Open'),
      ),
      body: Center(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    if (_currentUser != null) {
      // Need a new page here (when signed in)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Submit(formKey, _currentUser.email),
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: _currentUser,
            ),
            title: Text(_currentUser.displayName ?? ''),
            subtitle: Text(_currentUser.email ?? ''),
          ),
          RaisedButton(
            onPressed: _handleSignOut,
            child: Text('SIGN OUT'),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text('You are not signed in.'),
          RaisedButton(
            onPressed: _handleSignIn,
            child: Text('SIGN IN'),
          ),
        ],
      );
    }
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() async {
    _googleSignIn.disconnect();
  }
}
