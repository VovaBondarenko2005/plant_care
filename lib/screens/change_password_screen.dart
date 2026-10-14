
import 'package:flutter/material.dart';
import '../core/widgets/custom_text_field.dart';
import '../core/widgets/primary_button.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState
    extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final _oldPassword = TextEditingController();
  final _newPassword = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  void dispose() {
    _oldPassword.dispose();
    _newPassword.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  void _changePassword() {
    if (!_formKey.currentState!.validate()) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Демонстрація: форма зміни пароля перевірена',
        ),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Зміна пароля'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Оновлення пароля',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Введіть поточний пароль та '
                      'придумайте новий.',
                ),
                const SizedBox(height: 28),
                CustomTextField(
                  label: 'Поточний пароль',
                  controller: _oldPassword,
                  icon: Icons.lock_outline,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введіть поточний пароль';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Новий пароль',
                  controller: _newPassword,
                  icon: Icons.lock_reset,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Мінімум 6 символів';
                    }
                    if (value == _oldPassword.text) {
                      return 'Новий пароль має відрізнятися';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Підтвердіть новий пароль',
                  controller: _confirmPassword,
                  icon: Icons.verified_user_outlined,
                  isPassword: true,
                  validator: (value) {
                    if (value != _newPassword.text) {
                      return 'Паролі не збігаються';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 28),
                PrimaryButton(
                  text: 'Змінити пароль',
                  onPressed: _changePassword,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
