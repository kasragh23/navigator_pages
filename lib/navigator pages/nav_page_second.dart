import 'package:flutter/material.dart';
import 'package:navigator_pages/bmi_enum.dart';
import 'package:navigator_pages/gender_enum.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({required this.counter, super.key, });

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: _body(context),
    );
  }


    Widget _body(BuildContext context) => Center(

        child: Column(
          children: [
            Text('$counter'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                IconButton.outlined(
                  onPressed: () {
                    Navigator.pop(context);
                  },

                  icon: const Icon(Icons.chevron_left,)
                ),
                const SizedBox(width: 10,),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  icon: const Icon(Icons.chevron_left, color: Colors.red,)
                ),
                const SizedBox(width: 10,),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                    icon: const Icon(Icons.chevron_left, color: Colors.green,)

                )
              ],
            ),
          ],
        ),

    );
}
