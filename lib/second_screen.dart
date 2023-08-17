import 'package:flutter/material.dart';

import 'app_cubit/app_cubit.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit();
    return const Scaffold(
      body: Center(
          child: Text("Second Screen")
      ),
    );
  }
}

