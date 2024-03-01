import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:audioplayers/audioplayers.dart';

class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  _WebViewPageState createState() {
    return _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage> {
  final picker = ImagePicker();
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  Future<void> _pickImage() async {
    // Далее ты можешь обработать выбранное изображение
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
        onWebResourceError: (error) {
          debugPrint(error.description);
        },
        javascriptChannels: <JavascriptChannel>{
          JavascriptChannel(
            name: 'audioRecorder',
            onMessageReceived: (JavascriptMessage message) {
              // Здесь можно вызвать функцию для записи аудио
              // Например: startRecording();
            },
          ),
          JavascriptChannel(
            name: 'imagePicker',
            onMessageReceived: (JavascriptMessage message) {
              _pickImage();
            },
          ),
        },
      ),
    );
  }
}
