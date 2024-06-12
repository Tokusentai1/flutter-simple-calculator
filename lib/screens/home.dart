import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to Flutter Calculator App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Lottie.asset(
              'assets/animation/intro.json',
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 18,
            ),
            const CircularProgressIndicator(
              strokeWidth: 15,
              color: Colors.white,
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
