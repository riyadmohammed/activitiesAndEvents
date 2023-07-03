import 'package:activities_and_events/constant/app_colors.dart';
import 'package:flutter/material.dart';

class ActivitiesAndEvent extends StatefulWidget {
  const ActivitiesAndEvent({super.key});

  @override
  State<ActivitiesAndEvent> createState() => _ActivitiesAndEventState();
}

class _ActivitiesAndEventState extends State<ActivitiesAndEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.bgOrange,
        title: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Activities & Events',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            )),
        leading: IconButton(
            onPressed: () {
              // Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),//
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/element_curve_blue.png"),
            fit: BoxFit.contain,
          ),
        ),
        child: Column(children: [],) /* add child content here */,
      ),
    );
  }
}
