import 'package:flutter/material.dart';
import 'package:ptbac2/my_native.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _aController = TextEditingController();
  final _bController = TextEditingController();
  final _cController = TextEditingController();
  String _result = '';

  void _solveEquation() {
    final a = double.tryParse(_aController.text) ?? 0.0;
    final b = double.tryParse(_bController.text) ?? 0.0;
    final c = double.tryParse(_cController.text) ?? 0.0;

    final giai = GiaiPhuongTrinh();
    setState(() {
      _result = giai.giai(a, b, c);
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Giải phương trình bậc 2',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            )
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            
            TextField(
              controller: _aController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                hintText: 'Nhập hệ số a'
              ),
            ),
            SizedBox(height: 12,),
            TextField(
              controller: _bController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                hintText: 'Nhập hệ số b'
              ),
            ),
            SizedBox(height: 12,),
            TextField(
              controller: _cController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                hintText: 'Nhập hệ số c'
              ),
            ),
            SizedBox(height: 12,),
            ElevatedButton(
              onPressed: _solveEquation,
              child: Text('Giải phương trình'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ));
  }

  
}