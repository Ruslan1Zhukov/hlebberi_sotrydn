import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/helpers/info.dart';
import 'package:hlebberi_sotrydn/widgets/video_player.dart';

class _InfoData {
  final int id;
  final String count;
  final String path;
  final String title;

  _InfoData({
    required this.id,
    required this.count,
    required this.path,
    required this.title,
  });
}

final _list = [
  _InfoData(
    id: 0,
    count: "1",
    path: 'assets/videos/info1.mov',
    title: "Отсканируй QR - отметься на работе",
  ),
  _InfoData(
    id: 1,
    count: "2",
    path: 'assets/videos/info2.mov',
    title: "Добавь фото и оставь отзыв в профиле",
  ),
  _InfoData(
    id: 2,
    count: "3",
    path: 'assets/videos/info3.mov',
    title: "Узнай свой доход за смену",
  ),
  _InfoData(
    id: 3,
    count: "4",
    path: 'assets/videos/info4.mov',
    title: "Узнай свой доход за месяц",
  ),
];


class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  _InfoData _currentData = _list[0];

  _onNext() async {
    final currentIndex = _currentData.id;
    final nextIndex = _nextIndex(currentIndex);
    if (nextIndex == null) {
      await saveInfoData();
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/home',
        (Route<dynamic> route) => false,
      );
      return;
    }
    setState(() {
      _currentData = _list[nextIndex];
    });
  }

  int? _nextIndex(int currentIndex) {
    if (currentIndex == 3) return null;
    return currentIndex + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _InfoWidget(
          data: _currentData,
          onNextCallback: _onNext,
        ),
      ),
    );
  }
}

class _InfoWidget extends StatelessWidget {
  const _InfoWidget({
    required this.data,
    required this.onNextCallback,
  });

  final _InfoData data;
  final Function() onNextCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Шаг ${data.count}/4',
                style: const TextStyle(fontSize: 16),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    "/home",
                        (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        ),
        VideoPlayerWidget(videoPath: data.path),
        const SizedBox(height: 15),
        Text(data.title),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: onNextCallback,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding:
            const EdgeInsets.symmetric(horizontal: 150, vertical: 20),
          ),
          child: const Text('Далее'),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}