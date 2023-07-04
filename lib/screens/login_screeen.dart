import 'package:flutter/material.dart';
import 'package:todo/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2014/08/12/20/40/moon-416973_1280.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(30),
              ),
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    "Manage",
                    style: TextStyle(color: Colors.black, fontSize: 60),
                  ),
                  const Text(
                    "your",
                    style: TextStyle(color: Colors.black, fontSize: 60),
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "tasks",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Get started",
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        ),
                        icon: const Icon(
                          Icons.arrow_circle_right_rounded,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
