import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/widgets/diagramZp.dart';
import 'package:hlebberi_sotrydn/widgets/legend.dart';


class ZpPage extends StatelessWidget {
  const ZpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Зарплата за",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Январь",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              Text(
                "23 000",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          DiagramZpWidget(zp: null,),
          SizedBox(height: 10),
          LegendWidgetZp(),
        ],
      ),
    );
  }
}
