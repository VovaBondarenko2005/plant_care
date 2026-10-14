
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import 'change_password_screen.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 16),
        const CircleAvatar(
          radius: 48,
          backgroundColor: AppTheme.lightGreen,
          child: Icon(
            Icons.person,
            size: 54,
            color: AppTheme.primary,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Володимир',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'user@plantcare.com',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 32),
        Card(
          color: Colors.white,
          elevation: 0,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.person_outline,
                  color: AppTheme.primary,
                ),
                title: const Text('Редагувати профіль'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Редагування профілю — '
                            'демонстраційний розділ.',
                      ),
                    ),
                  );
                },
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(
                  Icons.lock_outline,
                  color: AppTheme.primary,
                ),
                title: const Text('Змінити пароль'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                      const ChangePasswordScreen(),
                    ),
                  );
                },
              ),
              const Divider(height: 1),
              const ListTile(
                leading: Icon(
                  Icons.language,
                  color: AppTheme.primary,
                ),
                title: Text('Мова'),
                trailing: Text('Українська'),
              ),
              const Divider(height: 1),
              const ListTile(
                leading: Icon(
                  Icons.palette_outlined,
                  color: AppTheme.primary,
                ),
                title: Text('Тема'),
                trailing: Text('Світла'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        OutlinedButton.icon(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => const LoginScreen(),
              ),
                  (route) => false,
            );
          },
          icon: const Icon(Icons.logout),
          label: const Text('Вийти з облікового запису'),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.red,
            minimumSize: const Size(double.infinity, 52),
          ),
        ),
      ],
    );
  }
}
