import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static const String id = 'details_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 10, 10, 10),
              child: Text(
                'Let\'s Make Your Best Trip Ever.',
                textAlign: TextAlign.left,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 10, 10, 10),
              child: Text(
                'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.normal),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.white.withOpacity(0.2)),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'CONTINUE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
