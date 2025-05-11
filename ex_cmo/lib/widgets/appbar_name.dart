import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/providers.dart';
import 'package:provider/provider.dart';

class AppbarName extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  const AppbarName({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange,
      title: Text(name),
      elevation: 10,
      automaticallyImplyLeading: false,
      actions: [
        Consumer<CartProvider>(
          builder: (_, cart, __) => Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.cyan,
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text('${cart.itemCount}', style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          )
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () => Navigator.pushNamed(context, 'carro'),
        )
      ],
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}