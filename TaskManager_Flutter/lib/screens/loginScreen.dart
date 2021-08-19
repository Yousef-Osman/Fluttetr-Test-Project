import 'package:flutter/material.dart';
import 'package:task_manager/models/loginModel.dart';
import 'package:task_manager/services/HttpService.dart';

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginModel _loginModel = LoginModel();
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value.isEmpty || value == null) {
                    return 'Username is required';
                  }
                  return null;
                },
                onSaved: (value) {
                  _loginModel.username = value;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value.isEmpty || value == null) {
                    return 'Password is required';
                  }
                  return null;
                },
                onSaved: (value) {
                  _loginModel.password = value;
                },
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    _formKey.currentState.save();

                    httpService.logIn(_loginModel);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Processing Data'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  label: Text('Submit'),
                  icon: Icon(Icons.save),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Colors.teal,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    onSurface: Colors.grey, //for displead
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(30),
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
