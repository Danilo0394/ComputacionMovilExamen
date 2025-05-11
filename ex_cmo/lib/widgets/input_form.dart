import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/providers.dart';
import 'package:flutter_application_1/services/services.dart';
import 'package:provider/provider.dart';

class InputForm extends StatelessWidget {
  final String nombre;
  final String route;
  const InputForm({super.key, required this.nombre, required this.route});
  @override
  Widget build(BuildContext context) {
    final LoginForm = Provider.of<LoginFormProvider>(context);
    return Expanded(
      child: Container(
        color: Colors.grey,
        child: Center(
          child: SizedBox(
            width: 380,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(nombre, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 30),
                  Form(
                    key: LoginForm.formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        TextFormField(
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Ingrese aquí su correo electrónico',
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.mail)
                          ),
                          onChanged: (value) => LoginForm.email = value,
                          validator: (value) {
                            return (value != null && value.length >= 4)
                            ? null
                            : 'El correo no puede estar vacío';
                          }
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          autocorrect: false,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Ingrese aquí su contraseña',
                            labelText: 'Contraseña',
                            prefixIcon: Icon(Icons.lock)
                          ),
                          onChanged: (value) => LoginForm.password = value,
                          validator: (value) {
                            return (value != null && value.length >= 4)
                            ? null
                            : 'La contraseña no puede estar vacía';
                          }
                        ),
                        SizedBox(height: 30),
                        MaterialButton(
                          disabledColor: Colors.grey,
                          color: Colors.orange,
                          onPressed: LoginForm.isLoading
                          ? null
                          : () async {
                            FocusScope.of(context).unfocus();
                            final authService =
                              Provider.of<AuthService>(context, listen: false);
                            if (!LoginForm.isValidForm()) return;
                            LoginForm.isLoading = true;
                            if (nombre == 'Registrar cuenta'){
                              final String? errorMessage = await authService.create_user(
                                LoginForm.email, LoginForm.password);
                              if (errorMessage == null) {
                                Navigator.pushNamed(context, route);
                              }
                              else {
                                print(errorMessage);
                              }
                            }
                            else{
                              final String? errorMessage = await authService.login(
                                LoginForm.email, LoginForm.password);
                              if (errorMessage == null) {
                                Navigator.pushNamed(context, route);
                              }
                              else {
                                print(errorMessage);
                              }
                            }
                          },
                          child: Text(
                            nombre, style: TextStyle(color: Colors.white),
                          )
                        )
                      ],
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}