// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/api/qr.dart';
import 'package:hlebberi_sotrydn/helpers/toast.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:hlebberi_sotrydn/redux/thunk/smena.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:hlebberi_sotrydn/theme/scaffold.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<StatefulWidget> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? _scanData;
  QRViewController? _controller;
  bool _isProcess = false;

  /// Обработка распознанного кода
  Future _onQrScan(Barcode scanData) async {
    if (_isProcess) return;
    _changeProcess(true);
    final qrCode = scanData.code ?? '';
    if (qrCode.isEmpty) {
      _changeProcess(false);
      return debugPrint("Код пустой");
    }
    final response = await ApiQR.login(code: qrCode);
    response.makeResult(
      onData: (data) async {
        if (data.status) {
          toast(context, "Вы вошли в смену", ToastType.success);
          await store.dispatch(loginInSmena());
          Navigator.of(context).pop();
        } else {
          final error = data.message.isNotEmpty ? data.message : "Ошибка сети";
          await toast(context, error, ToastType.error);
          _changeProcess(false);
        }
      },
      onError: () async {
        await toast(context, "Ошибка сети", ToastType.error);
        _changeProcess(false);
      },
    );
  }

  _changeProcess(bool process) {
    setState(() {
      _isProcess = process;
    });
  }

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
                    key: _qrKey,
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
                if (_scanData != null)
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
    _controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _controller!.pauseCamera();
    }
    _controller!.resumeCamera();
  }

  void _onQRViewCreated(QRViewController controller) {
    _controller = controller;
    controller.scannedDataStream.listen(_onQrScan);
  }
}
