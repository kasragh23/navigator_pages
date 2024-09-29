import 'package:flutter/material.dart';

import 'nav_page_second.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

@override
Widget build(BuildContext context) {

  return Scaffold(
      appBar: AppBar(

        title: const Text('Flutter Demo Project'),
      ),
      body:  Center(

          child: Column(

            // wireframe for each widget.
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            IconButton(
                onPressed: () => _navigateToSecondPage(context),
                icon: const Icon(Icons.arrow_forward_ios_outlined))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),

  );
}
  Future<void> _navigateToSecondPage(BuildContext context) async{
    final result = await Navigator.push<bool?>(
      context,
      MaterialPageRoute(builder: (_) => SecondPage(counter: _counter,))
    );

    if(result != null){
      setState(() {
        if(result){

            _counter = 1;
        }
        if(!result){
            _counter = -1;
        }

      });

    }

  }
}