import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {ResetPasswordScreen({super.key});

final TextEditingController _emailController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String? _validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Будь ласка, введіть електронну адресу';
  }
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  if (!emailRegex.hasMatch(value)) {
    return 'Будь ласка, введіть правильну електронну адресу';
  }
  return null;
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1024px-Google-flutter-logo.svg.png",
                width: 200,
              ),
            ),
            const SizedBox(height: 24.0),
            Center(
              child: Text(
                'Reset password',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Email:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _emailController,
              validator: _validateEmail,
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (BuildContext ctx) {
                            return const AlertDialog(
                              title: Text('Message'),
                              content: Text("Need to implement"),
                            );
                          },
                        );
                      }
                    },
                    child: const Text("Reset"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => {Navigator.pop(context)},
                    child: const Text("Back"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
}