import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wellness_hub/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WellnessTrackerScreen extends StatefulWidget {
  const WellnessTrackerScreen({super.key});

  @override
  State<WellnessTrackerScreen> createState() => _WellnessTrackerScreenState();
}

class _WellnessTrackerScreenState extends State<WellnessTrackerScreen> {
  late Box _wellnessBox;
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _initHive();
  }

  Future<void> _initHive() async {
    await Hive.initFlutter();
    _wellnessBox = await Hive.openBox('wellness_data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wellness Tracker',
          style: GoogleFonts.poppins(
            color: AppTheme.lightLavender,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: AppTheme.purpleRose,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: AppTheme.purpleRose.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
          ),
          if (_selectedDay != null) ...[
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'How are you feeling today?',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildTrackerItem(
              'Mood',
              Icons.mood,
              ['😊', '😐', '😔'],
            ),
            _buildTrackerItem(
              'Energy',
              Icons.energy_savings_leaf,
              ['⚡', '🔋', '🪫'],
            ),
            _buildTrackerItem(
              'Pain',
              Icons.medical_services,
              ['😣', '😖', '😫'],
            ),
            _buildTrackerItem(
              'Food Cravings',
              Icons.fastfood,
              ['🍎', '🍕', '🍫'],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTrackerItem(String title, IconData icon, List<String> options) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: AppTheme.purpleRose),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: options.map((emoji) {
                return GestureDetector(
                  onTap: () {
                    _saveWellnessData(title, emoji);
                  },
                  child: Text(
                    emoji,
                    style: const TextStyle(fontSize: 32),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _saveWellnessData(String category, String value) {
    final dateKey = _selectedDay!.toIso8601String().split('T')[0];
    final data = _wellnessBox.get(dateKey, defaultValue: {}) as Map;
    data[category] = value;
    _wellnessBox.put(dateKey, data);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$category updated successfully!'),
        backgroundColor: AppTheme.purpleRose,
      ),
    );
  }
} 