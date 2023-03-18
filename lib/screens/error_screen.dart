import 'package:flutter/material.dart';

class ErrorMovieScreen extends StatelessWidget {
  const ErrorMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/image/error_image.jpg"),
        ),
      ),
    );
  }
}
