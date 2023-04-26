import 'package:flutter/material.dart';

class AnimatedCrossFadeScreen extends StatefulWidget {
  const AnimatedCrossFadeScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedCrossFadeScreen> createState() =>
      _AnimatedCrossFadeScreenState();
}

class _AnimatedCrossFadeScreenState extends State<AnimatedCrossFadeScreen> {
  bool isFollowed = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated CrossFade"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
                firstChild: const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/user.jpg"),
                ),
                secondChild: const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/user_image.jpg"),
                ),
                crossFadeState: isFollowed
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(seconds: 1)),
            const SizedBox(height: 100),
            SizedBox(
              height: 50,
              width: width / 2,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: isFollowed
                          ? Colors.deepOrangeAccent
                          : Colors.deepPurple),
                  onPressed: () {
                    setState(() {
                      isFollowed = !isFollowed;
                    });
                  },
                  child: Text(
                    isFollowed ? "Unfollow" : "Follow",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
