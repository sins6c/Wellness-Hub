import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  late SharedPreferences _prefs;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  Map<String, dynamic> _dailyLogs = {};
  
  final List<String> _moods = ['Happy', 'Good', 'Okay', 'Sad', 'Stressed'];
  String _selectedMood = 'Good';
  double _energyLevel = 70;
  double _painLevel = 20;
  double _foodCravings = 30;
  final TextEditingController _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    _loadDailyLog();
  }

  void _loadDailyLog() {
    final String dateKey = _selectedDay.toString().split(' ')[0];
    final String? logData = _prefs.getString(dateKey);
    if (logData != null) {
      setState(() {
        final Map<String, dynamic> data = json.decode(logData);
        _selectedMood = data['mood'] ?? 'Good';
        _energyLevel = (data['energyLevel'] ?? 70).toDouble();
        _painLevel = (data['painLevel'] ?? 20).toDouble();
        _foodCravings = (data['foodCravings'] ?? 30).toDouble();
        _notesController.text = data['notes'] ?? '';
      });
    } else {
      setState(() {
        _selectedMood = 'Good';
        _energyLevel = 70;
        _painLevel = 20;
        _foodCravings = 30;
        _notesController.text = '';
      });
    }
  }

  Future<void> _saveDailyLog() async {
    final String dateKey = _selectedDay.toString().split(' ')[0];
    final Map<String, dynamic> logData = {
      'mood': _selectedMood,
      'energyLevel': _energyLevel,
      'painLevel': _painLevel,
      'foodCravings': _foodCravings,
      'notes': _notesController.text,
    };
    await _prefs.setString(dateKey, json.encode(logData));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1B30),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Wellness Tracker',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF2E2B4D),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2024, 1, 1),
                    lastDay: DateTime.utc(2025, 12, 31),
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    calendarFormat: CalendarFormat.month,
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    calendarStyle: const CalendarStyle(
                      defaultTextStyle: TextStyle(color: Colors.white),
                      weekendTextStyle: TextStyle(color: Colors.white70),
                      selectedDecoration: BoxDecoration(
                        color: Color(0xFF9747FF),
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.fromBorderSide(
                          BorderSide(color: Color(0xFF9747FF)),
                        ),
                      ),
                      todayTextStyle: TextStyle(color: Color(0xFF9747FF)),
                    ),
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
                      rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
                    ),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                      _loadDailyLog();
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2E2B4D),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'How are you feeling today?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _moods.map((mood) {
                          final isSelected = mood == _selectedMood;
                          return GestureDetector(
                            onTap: () {
                              setState(() => _selectedMood = mood);
                              _saveDailyLog();
                            },
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: isSelected ? const Color(0xFF9747FF) : Colors.transparent,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    mood == 'Happy' ? '😊' :
                                    mood == 'Good' ? '🙂' :
                                    mood == 'Okay' ? '😐' :
                                    mood == 'Sad' ? '😔' : '😫',
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  mood,
                                  style: TextStyle(
                                    color: isSelected ? const Color(0xFF9747FF) : Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildSlider('Energy Level', _energyLevel, (value) {
                  setState(() => _energyLevel = value);
                  _saveDailyLog();
                }),
                _buildSlider('Pain Level', _painLevel, (value) {
                  setState(() => _painLevel = value);
                  _saveDailyLog();
                }),
                _buildSlider('Food Cravings', _foodCravings, (value) {
                  setState(() => _foodCravings = value);
                  _saveDailyLog();
                }),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2E2B4D),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Notes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _notesController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'How are you feeling today? Add any notes here...',
                          hintStyle: TextStyle(color: Colors.white54),
                          border: InputBorder.none,
                        ),
                        maxLines: 3,
                        onChanged: (value) => _saveDailyLog(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _saveDailyLog,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9747FF),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.save),
                    label: const Text(
                      "Save Today's Log",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // TODO: Implement insights view
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFF9747FF)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.insights),
                    label: const Text(
                      'View Insights',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSlider(String title, double value, Function(double) onChanged) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF2E2B4D),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${value.toInt()}%',
                style: const TextStyle(
                  color: Color(0xFF9747FF),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: const Color(0xFF9747FF),
              inactiveTrackColor: const Color(0xFF1E1B30),
              thumbColor: const Color(0xFF9747FF),
              overlayColor: const Color(0xFF9747FF).withOpacity(0.2),
              trackHeight: 4,
            ),
            child: Slider(
              value: value,
              min: 0,
              max: 100,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
} 