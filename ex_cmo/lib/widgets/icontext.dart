import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String iconName;
  final String route;
  const IconText({
    super.key, required this.icon, required this.iconName, required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () => Navigator.pushNamed(context, route),
          icon: Icon(icon)),
        Text(iconName),
      ],
    );
  }
}
