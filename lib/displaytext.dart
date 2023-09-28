import 'package:flutter/material.dart';

import 'appdata_text.dart';

class DisplayText extends StatelessWidget {
  final AppDataText appData;
  const DisplayText({Key? key, required this.appData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.indigo.shade900,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 200.0,
                    child: Text(
                      appData. text,
                      textAlign: TextAlign.center,

                    ),
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
