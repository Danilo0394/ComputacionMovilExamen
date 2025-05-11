import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class CarroScreen extends StatelessWidget {
  const CarroScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarName(name: 'Carro'),
      body: ListaCarro(),
    );
  }
}
