import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final GestureTapCallback onPressed;
  const WelcomeScreen({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      key: ValueKey<int>(0),
      padding: EdgeInsets.fromLTRB(size.width * 0.25, 0, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome, Dear User',
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 50),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 91, 91, 91)),
              onPressed: onPressed,
              child: Center(
                child: Text(
                  'Create',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 30),
                ),
              ))
        ],
      ),
    );
  }
}
