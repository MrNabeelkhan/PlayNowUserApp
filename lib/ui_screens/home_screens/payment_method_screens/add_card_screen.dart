import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardExpirationController = TextEditingController();
  TextEditingController cardCVCController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black45,
        title: const Text('Add a Card'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                  Timer(const Duration(seconds: 2), () {
                    setState(() {
                      isLoading = false;
                    });
                  });
                });
              },
              splashRadius: 28,
              icon: const Icon(
                Icons.check,
              ),
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        child: isLoading
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Get.height * .4,
                    ),
                    const CircularProgressIndicator(
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: Get.height * .05,
                    ),
                    const Text(
                      'Checking your details, please wait...',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Card number',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: cardNumberController,
                    cursorColor: Colors.blue,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: '1234 1234 1234 1234 ',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      suffixIcon: Icon(
                        Icons.credit_card_outlined,
                        color: Colors.grey,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white70,
                        ),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white70,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Get.width * .42,
                        // color: Colors.blue,
                        child: TextFormField(
                          controller: cardExpirationController,
                          cursorColor: Colors.blue,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: 'Expiration date',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white70,
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white70,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * .42,
                        // color: Colors.blue,
                        child: TextFormField(
                          controller: cardCVCController,
                          cursorColor: Colors.blue,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: 'CVC',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white70,
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white70,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
