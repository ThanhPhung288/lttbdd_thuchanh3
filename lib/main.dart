import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController soA = TextEditingController();
  final TextEditingController soB = TextEditingController();
  String ketQua = '';

  void tinh(String phepToan) {
    double? a = double.tryParse(soA.text);
    double? b = double.tryParse(soB.text);

    if (a == null || b == null) {
      setState(() => ketQua = 'Vui lòng nhập đủ 2 số');
      return;
    }

    double kq = 0;
    if (phepToan == '+') {
      kq = a + b;
    } else if (phepToan == '-') {
      kq = a - b;
    } else if (phepToan == '*') {
      kq = a * b;
    } else if (phepToan == '/') {
      if (b == 0) {
        setState(() => ketQua = 'Không thể chia cho 0');
        return;
      }
      kq = a / b;
    }

    setState(() {

      ketQua = (kq == kq.toInt()) ? kq.toInt().toString() : kq.toString();
    });
  }

  Widget nutPhepToan(String ky, Color mau) {
    return ElevatedButton(
      onPressed: () => tinh(ky),
      style: ElevatedButton.styleFrom(
        backgroundColor: mau,
        minimumSize: const Size(60, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(ky, style: const TextStyle(color: Colors.white, fontSize: 22)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Thực hành 03',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            TextField(
              controller: soA,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Số thứ nhất'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                nutPhepToan('+', Colors.red),
                nutPhepToan('-', Colors.orange),
                nutPhepToan('*', Colors.deepPurple),
                nutPhepToan('/', Colors.black87),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: soB,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Số thứ hai'),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Kết quả: $ketQua',
                  style: const TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}