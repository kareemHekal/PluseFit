import 'package:fit_zone/core/resuable_comp/auth_background_cuver.dart';
import 'package:flutter/material.dart';

import 'core/resuable_comp/blurred_container.dart';
import 'core/resuable_comp/validator.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundCuver(
      widget: Center(
        child: BlurredContainer(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  validator: Validator.email,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Next'),
                  ),
                ),
                OutlinedButton(onPressed: () {}, child: const Text("dadsada")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
