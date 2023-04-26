import 'package:flutter/material.dart';
import 'package:sample/screen/animations/animated_container.dart';
import 'package:sample/screen/animations/animated_crossFade.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool startAnimation = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.deepPurple,
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(
                width: width,
                action: const AnimatedContainerScreen(),
                title: "Animated Container"),
            ButtonWidget(
                width: width,
                action: const AnimatedCrossFadeScreen(),
                title: "Animated CrossFade"),
          ],
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.width,
    required this.action,
    required this.title,
  });

  final double width;
  final Widget action;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 50,
        width: width / 1.5,
        child: ElevatedButton.icon(
            icon: const Icon(
              Icons.ac_unit,
              color: Colors.deepOrange,
            ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => action));
            },
            label: Text(
              title,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
