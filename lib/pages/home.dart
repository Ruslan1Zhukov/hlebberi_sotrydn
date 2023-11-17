import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/theme/scaffold.dart';
import 'package:hlebberi_sotrydn/widgets/header.dart';
import 'package:hlebberi_sotrydn/widgets/slider.dart';
import 'package:hlebberi_sotrydn/widgets/smena.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldProject(
      isQRScan: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: HeaderWidget(isNeedSettings: true),
              ),
              SizedBox(height: 32),
              SmenaWidget(),
              SizedBox(height: 32),
              SliderWidget(),
            ],
          ),
        ),
      ),
    );
  }
}