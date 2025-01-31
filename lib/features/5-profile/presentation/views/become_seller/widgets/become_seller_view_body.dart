import 'package:flutter/material.dart';
import 'package:user_online_shop/contants.dart';
import 'package:user_online_shop/core/widgets/custom_text_field.dart';

class BecomeSellerViewBody extends StatefulWidget {
  const BecomeSellerViewBody({super.key});

  @override
  State<BecomeSellerViewBody> createState() => _BecomeSellerViewBodyState();
}

class _BecomeSellerViewBodyState extends State<BecomeSellerViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'To become a seller, you need to fill out the form below. We will review your request and get back to you as soon as possible.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              labels: 'bghjgh',
              hintText: 'hintText',
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Phone',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Business Description',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
