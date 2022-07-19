import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_card_screen.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black45,
        title: const Text('Payment Method'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Get.to(AddCardScreen());
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.add,
                    color: Colors.blue,
                    size: 30,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'Add new card...',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.blue,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
