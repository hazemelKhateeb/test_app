import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text, label;

  const CustomText({Key key, this.text, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                label,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: mediaQuery.height * 0.025,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: mediaQuery.height * 0.07,
              width: mediaQuery.width * 0.77,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  child: Text(
                    text,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: mediaQuery.height * 0.03,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
