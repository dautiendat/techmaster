import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  late double omega; // Tần số góc của con lắc
  final double theta0 = pi / 2; // Góc lệch ban đầu 
  final double length = 1.0; // Chiều dài dây giả định
  final double g = 9.8; // Gia tốc trọng trường
  @override
  void initState() {
    super.initState();

    omega = sqrt(g/length);
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat(reverse: false);

    _animationController.addListener(() {
        setState(() {
          
        });
      });
      
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double time = _animationController.value*2*pi; // Chuyển đổi giá trị 0-1 thành thời gian
    double dampingFactor = exp(-0.1 * time);
    double angle = dampingFactor*theta0 * cos(omega * time);
    
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 150,
                height: 2,
                color: Colors.black,
              ),
              Transform.rotate(
                    angle: angle,
                    alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Container(
                      width: 2,
                      height: 150,
                      color: Colors.black,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                    
                  ],
                ),
              ),
              
              
            ],
          ),
        ),
      ),
    );
  }
}

 



