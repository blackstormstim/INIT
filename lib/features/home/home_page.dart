import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_view_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(title: Text("Emotion AI")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    value: vm.stressLevel,
                    strokeWidth: 15,
                    backgroundColor: Colors.grey[800],
                    valueColor:
                        AlwaysStoppedAnimation(vm.stressColor),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "${(vm.stressLevel * 100).toInt()}%",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(vm.stressText),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: vm.isRunning ? vm.stop : vm.start,
            child: Text(vm.isRunning ? "STOP" : "START"),
          )
        ],
      ),
    );
  }
}
