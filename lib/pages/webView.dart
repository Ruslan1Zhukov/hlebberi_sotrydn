import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late FlutterSoundRecorder _recorder;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _initRecorder();
    _requestPermissions();
  }

  Future<void> _initRecorder() async {
    _recorder = FlutterSoundRecorder();
  }

  Future<void> _requestPermissions() async {
    final Map<Permission, PermissionStatus> statuses = await [
      Permission.microphone,
    ].request();
    if (statuses[Permission.microphone] != PermissionStatus.granted) {
      // Handle permissions not granted
    }
  }

  Future<void> _startRecording() async {
    try {
      await _recorder.startRecorder(toFile: 'audio.wav');
      setState(() {
        _isRecording = true;
      });
    } catch (e) {
      // Handle recording start error
    }
  }

  Future<void> _stopRecording() async {
    try {
      await _recorder.stopRecorder();
      setState(() {
        _isRecording = false;
      });
    } catch (e) {
      // Handle recording stop error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (_) {
          // You can execute JavaScript code here if needed
        },
        javascriptChannels: <JavascriptChannel>{
          JavascriptChannel(
            name: 'audioRecorder',
            onMessageReceived: (JavascriptMessage message) {
              if (message.message == 'start') {
                _startRecording();
              } else if (message.message == 'stop') {
                _stopRecording();
              }
            },
          ),
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}