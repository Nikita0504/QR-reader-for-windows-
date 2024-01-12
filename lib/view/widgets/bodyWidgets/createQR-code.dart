import 'package:flutter/material.dart';

class CreateQR extends StatelessWidget {
  final GestureTapCallback onPressed;
  const CreateQR({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
        key: ValueKey<int>(1),
        padding: EdgeInsets.fromLTRB(150, 0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create QR Code',
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 50),
            ),
            Container(
              width: size.width * 0.6,
              height: size.height * 0.125,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 63, 63, 63),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(30),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 91, 91, 91)),
                onPressed: onPressed,
                child: Center(
                  child: Text(
                    'Let’s Go',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 30),
                  ),
                ))
          ],
        ));
  }
}
