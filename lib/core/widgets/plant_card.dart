
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PlantCard extends StatelessWidget {
  final String name;
  final String species;
  final IconData icon;
  final VoidCallback? onTap;

  const PlantCard({
    super.key,
    required this.name,
    required this.species,
    this.icon = Icons.local_florist,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(12),
        leading: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppTheme.lightGreen,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            icon,
            color: AppTheme.primary,
            size: 30,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(species),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
