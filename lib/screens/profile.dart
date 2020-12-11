import 'package:flutter/material.dart';
import 'package:testapp/model/user.dart';
import 'package:testapp/screens/form_screen.dart';
import 'package:testapp/widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  static const id = 'ProfileScreen';
  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context).settings.arguments;
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile Screen'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(FormScreen.id);
              }),
        ),
        body: SafeArea(
          child: Container(
            height: mediaQuery.height,
            width: mediaQuery.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: mediaQuery.height * 0.04,
                ),
                CircleAvatar(
                  radius: 60,
                  child: user.imgUrl.length < 9
                      ? Center(
                          child: Text(user.username[0].toUpperCase()),
                        )
                      : null,
                  backgroundColor: Colors.purple,
                  backgroundImage: user.imgUrl.length < 9
                      ? null
                      : NetworkImage(
                          user.imgUrl,
                        ),
                ),
                SizedBox(
                  height: mediaQuery.height * 0.04,
                ),
                CustomText(
                  label: 'Name',
                  text: user.username,
                ),
                CustomText(
                  label: 'Age',
                  text: user.age,
                ),
                CustomText(
                  label: 'Email',
                  text: user.email,
                )
              ],
            ),
          ),
        ));
  }
}
