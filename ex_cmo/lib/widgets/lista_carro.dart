import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';
import '../providers/providers.dart';

class ListaCarro extends StatelessWidget {
  const ListaCarro({super.key});
  @override
  Widget build(BuildContext context) {

    final cartProvider = Provider.of<CartProvider>(context);

    if (cartProvider.getProducts.isEmpty){
      return Center(
        child: Column(
          children: [
            NavBar(),
            SizedBox(height: 30),
            Text('Su carro de compras está vacío.'),
            IconText(icon: Icons.arrow_back, iconName: 'Volver a lista de productos', route: 'lista_productos')
          ],
        ),
      );
    }
    else{
      return ListView(
        children: [
        NavBar(),
        ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: cartProvider.getProducts.length,
          itemBuilder: (BuildContext context, index) {
            final product = cartProvider.getProducts[index];
            return Container(
              color: Colors.grey,
              padding: EdgeInsets.all(32),
              height: 350,
              child: Center(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image(image: NetworkImage(product.productImage), width: double.infinity, height: double.infinity, fit: BoxFit.cover)
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        color: Colors.red,
                        width: 200,
                        child: Text(product.productName, style: TextStyle(fontSize: 24))
                      )
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        color: Colors.red,
                        height: 50,
                        child: IconButton(
                          onPressed: () => Navigator.pushNamed(context, 'detalle_producto', arguments: product.productName),
                          icon: Icon(Icons.more)
                        )
                      )
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        color: Colors.red,
                        child: Text('\$${product.productPrice}', style: TextStyle(fontSize: 24))
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        color: Colors.red,
                        child: IconButton(
                          onPressed: () { Provider.of<CartProvider>(context, listen: false).deleteProduct(product.productName); },
                          icon: Icon(Icons.remove_shopping_cart)
                        ),
                      ),
                    )
                  ],
                ),
              )
            );
          },
        ),
      ],
      );
    }
  }
}