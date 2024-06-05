import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Шаг 1/4', style: TextStyle(fontSize: 16)),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    width: 300,
                    height: 600,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage('assets/avatar.png'),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Иван Иванов', style: TextStyle(fontWeight: FontWeight.bold)),
                                  Text('Пекарь'),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        // Ваше содержание экрана, например, график и зарплата
                        Expanded(
                          child: Center(
                            child: Text('Содержимое экрана'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Отсканируй QR - отметься на работе'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Действие при нажатии на кнопку "Далее"
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                child: const Text('Далее'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}