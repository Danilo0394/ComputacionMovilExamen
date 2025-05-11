import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/proveedores.dart';
import 'package:flutter_application_1/providers/proveedor_provider.dart';
import 'package:provider/provider.dart';

class ProveedorFormScreen extends StatelessWidget {
  final Proveedor? proveedor;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  ProveedorFormScreen({this.proveedor}) {
    if (proveedor != null) {
      _nameController.text = proveedor!.name;
      _contactController.text = proveedor!.contact;
      _addressController.text = proveedor!.address;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(proveedor == null ? 'Nuevo Proveedor' : 'Editar Proveedor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              TextFormField(
                controller: _contactController,
                decoration: InputDecoration(labelText: 'Contacto'),
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Dirección'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final provider = Provider.of<ProveedorProvider>(context, listen: false);
                    final newProveedor = Proveedor(
                      id: proveedor?.id ?? 0,
                      name: _nameController.text,
                      contact: _contactController.text,
                      address: _addressController.text,
                    );
                    provider.saveProveedor(newProveedor);
                    Navigator.pop(context);
                  }
                },
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}