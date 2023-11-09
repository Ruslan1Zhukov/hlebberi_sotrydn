import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/pages/qr_scan.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';

class ScaffoldProject extends StatelessWidget {
  const ScaffoldProject({
    Key? key,
    required this.child,
    this.isQRScan = false,
  }) : super(key: key);


  final Widget child;
  final bool isQRScan;

  openScan(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const QRScannerPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorProject.dark_white,
      floatingActionButton: (isQRScan)
          ? SizedBox(
              width: 80,
              height: 80,
              child: FloatingActionButton(
                onPressed: () => openScan(context),
                backgroundColor: ColorProject.orange,
                child: Padding(
                  padding: const EdgeInsets.all(19),
                  child: Image.asset(
                    "assets/icons/icon_qr.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          : null,
      body: SafeArea(
        child: child,
      ),
    );
  }
}
