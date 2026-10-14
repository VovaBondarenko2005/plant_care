
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../core/widgets/plant_card.dart';
import '../core/widgets/primary_button.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, String>> _plants = [
    {
      'name': 'Монстера',
      'species': 'Monstera deliciosa',
    },
    {
      'name': 'Фікус',
      'species': 'Ficus elastica',
    },
    {
      'name': 'Кактус',
      'species': 'Cactaceae',
    },
    {
      'name': 'Сансевієрія',
      'species': 'Dracaena trifasciata',
    },
  ];

  void _changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.eco, color: AppTheme.primary),
            SizedBox(width: 8),
            Text(
              'PlantCare',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppTheme.primary,
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildDashboard(),
          _buildPlants(),
          _buildJournal(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _changeTab,
        backgroundColor: Colors.white,
        indicatorColor: AppTheme.lightGreen,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Головна',
          ),
          NavigationDestination(
            icon: Icon(Icons.local_florist_outlined),
            selectedIcon: Icon(Icons.local_florist),
            label: 'Рослини',
          ),
          NavigationDestination(
            icon: Icon(Icons.history),
            label: 'Журнал',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Профіль',
          ),
        ],
      ),
    );
  }

  Widget _buildDashboard() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Привіт, Володимире!',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: AppTheme.text,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Сьогодні чудовий день, щоб подбати про рослини.',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.primary,
            borderRadius: BorderRadius.circular(22),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.water_drop_outlined,
                color: Colors.white,
                size: 38,
              ),
              SizedBox(height: 14),
              Text(
                'Час полити рослини!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Перевір, які рослини потребують поливу.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        const Text(
          'Мої рослини',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ..._plants.take(3).map(
              (plant) => PlantCard(
            name: plant['name']!,
            species: plant['species']!,
          ),
        ),
        const SizedBox(height: 12),
        PrimaryButton(
          text: 'Переглянути всі рослини',
          icon: Icons.arrow_forward,
          onPressed: () => _changeTab(1),
        ),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: () => _changeTab(2),
          icon: const Icon(Icons.history),
          label: const Text('Журнал догляду'),
        ),
      ],
    );
  }

  Widget _buildPlants() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Мої рослини',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Каталог кімнатних рослин',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 24),
        ..._plants.map(
              (plant) => PlantCard(
            name: plant['name']!,
            species: plant['species']!,
            onTap: () => _showPlantDetails(plant),
          ),
        ),
        const SizedBox(height: 12),
        PrimaryButton(
          text: 'Додати рослину',
          icon: Icons.add,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Додавання рослини буде реалізовано '
                      'на наступному етапі.',
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  void _showPlantDetails(Map<String, String> plant) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(plant['name']!),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.local_florist,
              size: 64,
              color: AppTheme.primary,
            ),
            const SizedBox(height: 12),
            Text(plant['species']!),
            const SizedBox(height: 12),
            const Text(
              'Інформація про догляд буде '
                  'доступна в наступних версіях.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Закрити'),
          ),
        ],
      ),
    );
  }

  Widget _buildJournal() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Журнал догляду',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Історія виконаних процедур',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 24),
        _journalItem(
          'Полив монстери',
          'Сьогодні',
          Icons.water_drop,
        ),
        _journalItem(
          'Підживлення фікуса',
          'Вчора',
          Icons.eco,
        ),
        _journalItem(
          'Пересадка кактуса',
          '10 жовтня',
          Icons.local_florist,
        ),
      ],
    );
  }

  Widget _journalItem(
      String title,
      String date,
      IconData icon,
      ) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppTheme.lightGreen,
          child: Icon(icon, color: AppTheme.primary),
        ),
        title: Text(title),
        subtitle: Text(date),
      ),
    );
  }
}
