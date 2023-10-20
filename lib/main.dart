import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FormInput(),
    );
  }
}

class FormInput extends StatefulWidget {
  const FormInput({super.key});

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  TextEditingController var_tanggal = TextEditingController();

  String? _jk;
  void pilihJk(String value) {
    setState(() {
      _jk = value;
    });
  }

  List<String> agama = [
    "Islam",
    "Kristen Khatolik",
    "Kristen Protestan",
    "Hindu",
    "Budha",
    "Lainnya",
  ];

  String _agama = "Islam";
  void dispose() {
    var_tanggal.dispose();
    super.dispose();
  }

  String formatDate(DateTime date) {
    return DateFormat('dd MM YY').format(date);
  }

  DateTime selectDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectDate)
      setState(() {
        selectDate = picked;
        var_tanggal.text = DateFormat('EEEE dd MMMM yyyy').format(selectDate);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.list),
        title: const Text("Form Input"),
        backgroundColor: const Color.fromARGB(255, 100, 188, 28),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Nama Lengkap",
                labelText: "Nama Lengkap",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              maxLines: 3,
              maxLength: 100,
              decoration: InputDecoration(
                hintText: "Alamat",
                labelText: "Alamat",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RadioListTile(
              value: "Laki-laki",
              title: const Text("Laki-laki"),
              groupValue: _jk,
              onChanged: (String? value) {
                pilihJk(value!);
              },
              activeColor: Colors.teal,
              subtitle: const Text("Pilih ini jika laki-laki"),
            ),
            RadioListTile(
              value: "Perempuan",
              title: const Text("Perempuan"),
              groupValue: _jk,
              onChanged: (String? value) {
                pilihJk(value!);
              },
              activeColor: Colors.teal,
              subtitle: const Text("Pilih ini jika perempuan"),
            ),
            DropdownButton(
              value: _agama,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: agama.map((String agama) {
                return DropdownMenuItem(
                  value: agama,
                  child: Text(agama),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _agama = newValue!;
                });
              },
            ),
            TextFormField(
              controller: var_tanggal,
              decoration: InputDecoration(
                labelText: 'Tanggal Lahir',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ),
              onTap: () {
                _selectDate(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
