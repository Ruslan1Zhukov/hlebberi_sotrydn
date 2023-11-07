import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/test_data.dart';
import 'package:hlebberi_sotrydn/theme/scaffold.dart';
import 'package:hlebberi_sotrydn/widgets/header.dart';
import 'package:hlebberi_sotrydn/widgets/slider.dart';
import 'package:hlebberi_sotrydn/widgets/smena.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldProject(
      isQRScan: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderWidget(),
              const SizedBox(height: 32),
              SmenaWidget(smena: testSmena,),
              const SizedBox(height: 32),
              const SliderWidget(),
            ],
          ),
        ),
      ),
    );
  }
}