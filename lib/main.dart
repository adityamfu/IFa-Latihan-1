import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, i) {
                  return numberTruthList[i]
                  ? ListTile(
                  title: Text(numberTruthList[i].toString()),
                  )
                  : Container(
                  height: 0,
                  width: 0,
                  );
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


