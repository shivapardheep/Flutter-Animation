import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  bool startAnimation = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Containers"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                10,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: AnimatedContainer(
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurpleAccent,
                    ),
                    transform: Matrix4.translationValues(
                        startAnimation ? 0 : 500, startAnimation ? 0 : 500, 0),
                    duration: Duration(milliseconds: (index * 300)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: SizedBox(
                      width: width / 1.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Title ${index + 1}",
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Icon(Icons.ac_unit, color: Colors.white54),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
