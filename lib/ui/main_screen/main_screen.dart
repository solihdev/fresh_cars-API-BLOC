import 'package:flutter/material.dart';
import 'package:fresh_cars/ui/cars_screen/cars_screen_consumer.dart';
import 'package:fresh_cars/ui/cars_screen/cars_screen_local.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Main Screen",style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CarsScreenWithConsumer()));
              },
              child: const Text("Cars Screen with Consumer"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CarsScreenWithBlockProvider()));
              },
              child: const Text("Cars Screen with Local Provider"),
            ),
          ],
        ),
      ),
    );
  }
}
