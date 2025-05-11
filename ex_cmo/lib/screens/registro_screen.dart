import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/login_form_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class RegistroScreen extends StatelessWidget {
  const RegistroScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarName(name: 'Registro'),
      body: Column(
        children: [
          NavBar(),
          ChangeNotifierProvider(
            create: (_) => LoginFormProvider(),
            child: InputForm(nombre: 'Registrar cuenta', route: 'login')
          ),
        ]
      ),
    );
  }
}
