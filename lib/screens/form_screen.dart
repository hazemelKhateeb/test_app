import 'package:flutter/material.dart';
import 'package:testapp/model/user.dart';
import 'package:testapp/screens/profile.dart';

class FormScreen extends StatelessWidget {
  static const id = 'FormScreen';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String username, age, email, imgUrl;

  String validate(String val) {
    if (val.isEmpty) {
      return 'that is cannot be empty';
    }
    return null;
  }

  final inputDecoration = InputDecoration(
      labelText: 'Username',
      labelStyle: const TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Screen'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: inputDecoration,
                    keyboardType: TextInputType.text,
                    validator: validate,
                    onSaved: (val) {
                      username = val;
                    },
                  ),
                  TextFormField(
                    decoration: inputDecoration.copyWith(labelText: 'Age'),
                    keyboardType: TextInputType.number,
                    validator: validate,
                    onSaved: (val) {
                      age = val;
                    },
                  ),
                  TextFormField(
                    decoration: inputDecoration.copyWith(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'that is should not be empty';
                      } else if (!val.contains('@')) {
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      email = val;
                    },
                  ),
                  TextFormField(
                    decoration: inputDecoration.copyWith(
                        labelText: 'Profile Image Link'),
                    keyboardType: TextInputType.text,
                    validator: validate,
                    onSaved: (val) {
                      imgUrl = val;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  ButtonTheme(
                    buttonColor: Colors.black54,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    minWidth: MediaQuery.of(context).size.width * 0.7,
                    child: RaisedButton(
                      textColor: Colors.white,
                      child: Text(
                        'Next',
                        style: const TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          FocusScope.of(context).unfocus();
                          formKey.currentState.save();
                          Navigator.of(context).pushReplacementNamed(
                              ProfileScreen.id,
                              arguments: User(
                                  username: username.trim(),
                                  email: email.trim(),
                                  age: age.trim(),
                                  imgUrl: imgUrl.trim()));
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
