import 'package:flutter/material.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/default_appbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(isBack: true,),
      body: Text("Cart"),
    );
  }
}
