import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarName(name: 'Login'),
      body: Column(
        children: [
          NavBar(),
          ChangeNotifierProvider(
            create: (_) => LoginFormProvider(),
            child: InputForm(nombre: 'Iniciar Sesión', route: 'lista_productos')
          ),
        ]
      ),
    );
  }
}
