import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Latihan",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: const Text("Latihan"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(7),
                    height: 50,
                    width: 50,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Universitas Teknokrat Indonesia",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(12),
                height: 50,
                color: Colors.grey,
              ),
              Container(
                padding: const EdgeInsets.all(14),
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Text("Data${index + 1} "),
                      ],
                    );
                  },
                ),
              ),
              Column(
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) {
                        return Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index % 2 == 0 ? Colors.red : Colors.blue,
                          ),
                          margin: const EdgeInsets.all(4),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) {
                        return Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index % 2 == 0 ? Colors.red : Colors.blue,
                          ),
                          margin: const EdgeInsets.all(4),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
