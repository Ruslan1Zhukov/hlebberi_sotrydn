import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:hlebberi_sotrydn/theme/scaffold.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<StatefulWidget> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenMin = min(screenWidth, screenHeight);
    var scanArea = screenMin * 0.8;
    return ScaffoldProject(
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                      borderColor: Colors.red,
                      borderRadius: 10,
                      borderLength: 30,
                      borderWidth: 10,
                      cutOutSize: scanArea,
                    ),
                    onPermissionSet: (ctrl, p) =>
                        _onPermissionSet(context, ctrl, p),
                  ),
                ),
                if (result != null)
                  const Expanded(
                    flex: 1,
                    child: Center(
                      child: Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 24.0,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: ColorProject.orange,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(Icons.close),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Нет доступа к камере')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }
}
