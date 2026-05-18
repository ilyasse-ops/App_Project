import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String _selectedCity = "Paris";
  final TextEditingController _searchController = TextEditingController();

  final Map<String, Map<String, dynamic>> _weatherData = {
    "Paris": {
      "temp": 19,
      "condition": "Nuageux",
      "desc": "Intervalles ensoleillés et nuages passagers.",
      "wind": 14,
      "humidity": 65,
      "uv": 3,
      "hourly": [
        {"time": "Maintenant", "temp": 19, "icon": Icons.cloud_outlined},
        {"time": "14:00", "temp": 21, "icon": Icons.wb_sunny_outlined},
        {"time": "16:00", "temp": 20, "icon": Icons.wb_sunny_outlined},
        {"time": "18:00", "temp": 18, "icon": Icons.cloud_outlined},
        {"time": "20:00", "temp": 16, "icon": Icons.cloud_outlined},
      ],
      "weekly": [
        {"day": "Lundi", "temp": "19° / 11°", "icon": Icons.cloud_outlined, "cond": "Nuageux"},
        {"day": "Mardi", "temp": "22° / 13°", "icon": Icons.wb_sunny_outlined, "cond": "Ensoleillé"},
        {"day": "Mercredi", "temp": "18° / 12°", "icon": Icons.water_drop_outlined, "cond": "Pluvieux"},
        {"day": "Jeudi", "temp": "16° / 10°", "icon": Icons.water_drop_outlined, "cond": "Pluvieux"},
        {"day": "Vendredi", "temp": "20° / 11°", "icon": Icons.cloud_outlined, "cond": "Nuageux"},
      ]
    },
    "New York": {
      "temp": 26,
      "condition": "Ensoleillé",
      "desc": "Un ciel parfaitement bleu et ensoleillé.",
      "wind": 8,
      "humidity": 45,
      "uv": 8,
      "hourly": [
        {"time": "Maintenant", "temp": 26, "icon": Icons.wb_sunny_outlined},
        {"time": "14:00", "temp": 28, "icon": Icons.wb_sunny_outlined},
        {"time": "16:00", "temp": 27, "icon": Icons.wb_sunny_outlined},
        {"time": "18:00", "temp": 25, "icon": Icons.wb_sunny_outlined},
        {"time": "20:00", "temp": 22, "icon": Icons.nights_stay_outlined},
      ],
      "weekly": [
        {"day": "Lundi", "temp": "26° / 17°", "icon": Icons.wb_sunny_outlined, "cond": "Ensoleillé"},
        {"day": "Mardi", "temp": "29° / 18°", "icon": Icons.wb_sunny_outlined, "cond": "Ensoleillé"},
        {"day": "Mercredi", "temp": "25° / 16°", "icon": Icons.cloud_outlined, "cond": "Nuageux"},
        {"day": "Jeudi", "temp": "24° / 15°", "icon": Icons.wb_sunny_outlined, "cond": "Ensoleillé"},
        {"day": "Vendredi", "temp": "27° / 17°", "icon": Icons.wb_sunny_outlined, "cond": "Ensoleillé"},
      ]
    },
    "Tokyo": {
      "temp": 15,
      "condition": "Pluvieux",
      "desc": "Pluie continue et fraîche. Pensez au parapluie.",
      "wind": 18,
      "humidity": 85,
      "uv": 1,
      "hourly": [
        {"time": "Maintenant", "temp": 15, "icon": Icons.water_drop_outlined},
        {"time": "14:00", "temp": 14, "icon": Icons.water_drop_outlined},
        {"time": "16:00", "temp": 14, "icon": Icons.water_drop_outlined},
        {"time": "18:00", "temp": 15, "icon": Icons.water_drop_outlined},
        {"time": "20:00", "temp": 13, "icon": Icons.cloud_outlined},
      ],
      "weekly": [
        {"day": "Lundi", "temp": "15° / 10°", "icon": Icons.water_drop_outlined, "cond": "Pluie"},
        {"day": "Mardi", "temp": "16° / 11°", "icon": Icons.water_drop_outlined, "cond": "Pluie"},
        {"day": "Mercredi", "temp": "18° / 12°", "icon": Icons.cloud_outlined, "cond": "Nuageux"},
        {"day": "Jeudi", "temp": "20° / 13°", "icon": Icons.wb_sunny_outlined, "cond": "Ensoleillé"},
        {"day": "Vendredi", "temp": "21° / 14°", "icon": Icons.wb_sunny_outlined, "cond": "Ensoleillé"},
      ]
    },
    "Montréal": {
      "temp": -2,
      "condition": "Neigeux",
      "desc": "Légère chute de neige et température glaciale.",
      "wind": 22,
      "humidity": 75,
      "uv": 1,
      "hourly": [
        {"time": "Maintenant", "temp": -2, "icon": Icons.ac_unit_outlined},
        {"time": "14:00", "temp": -1, "icon": Icons.ac_unit_outlined},
        {"time": "16:00", "temp": -3, "icon": Icons.ac_unit_outlined},
        {"time": "18:00", "temp": -5, "icon": Icons.ac_unit_outlined},
        {"time": "20:00", "temp": -7, "icon": Icons.cloud_outlined},
      ],
      "weekly": [
        {"day": "Lundi", "temp": "-2° / -8°", "icon": Icons.ac_unit_outlined, "cond": "Neige"},
        {"day": "Mardi", "temp": "-4° / -10°", "icon": Icons.ac_unit_outlined, "cond": "Neige"},
        {"day": "Mercredi", "temp": "-1° / -6°", "icon": Icons.cloud_outlined, "cond": "Nuageux"},
        {"day": "Jeudi", "temp": "-5° / -11°", "icon": Icons.ac_unit_outlined, "cond": "Neige"},
        {"day": "Vendredi", "temp": "-8° / -14°", "icon": Icons.ac_unit_outlined, "cond": "Neige"},
      ]
    }
  };

  Map<String, dynamic> get _currentWeather {
    return _weatherData[_selectedCity] ?? _weatherData["Paris"]!;
  }

  // Get dynamic background gradient based on current weather condition
  LinearGradient _getDynamicGradient(String condition) {
    switch (condition) {
      case "Ensoleillé":
        return const LinearGradient(
          colors: [Color(0xFFFBBF24), Color(0xFFF59E0B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case "Pluvieux":
        return const LinearGradient(
          colors: [Color(0xFF475569), Color(0xFF334155)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case "Neigeux":
        return const LinearGradient(
          colors: [Color(0xFFA5F3FC), Color(0xFF0891B2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case "Nuageux":
      default:
        return const LinearGradient(
          colors: [Color(0xFF818CF8), Color(0xFF4F46E5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
    }
  }

  IconData _getConditionIcon(String condition) {
    switch (condition) {
      case "Ensoleillé":
        return Icons.wb_sunny;
      case "Pluvieux":
        return Icons.water_drop;
      case "Neigeux":
        return Icons.ac_unit;
      case "Nuageux":
      default:
        return Icons.cloud;
    }
  }

  void _searchCity() {
    String cityInput = _searchController.text.trim();
    if (cityInput.isEmpty) return;

    // Capitalize first letter
    cityInput = cityInput.substring(0, 1).toUpperCase() + cityInput.substring(1).toLowerCase();

    if (_weatherData.containsKey(cityInput)) {
      setState(() {
        _selectedCity = cityInput;
        _searchController.clear();
      });
      FocusScope.of(context).unfocus();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Ville '$cityInput' non disponible dans cette démo (Veuillez essayer: Paris, New York, Tokyo, Montréal)."),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weather = _currentWeather;
    final condition = weather['condition'] as String;
    final gradient = _getDynamicGradient(condition);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: SafeArea(
          child: Column(
            children: [
              // Custom search & City picker bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextField(
                          controller: _searchController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: "Rechercher Paris, Tokyo...",
                            hintStyle: TextStyle(color: Colors.white70),
                            prefixIcon: Icon(Icons.search, color: Colors.white),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                          onSubmitted: (value) => _searchCity(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.check, color: Colors.white),
                        onPressed: _searchCity,
                      ),
                    ),
                  ],
                ),
              ),

              // City Quick Select Row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: _weatherData.keys.map((city) {
                    final isSelected = city == _selectedCity;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCity = city;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.white : Colors.white12,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            city,
                            style: TextStyle(
                              color: isSelected ? Colors.black87 : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 20),

              // Main weather info
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      // Large Icon
                      Icon(
                        _getConditionIcon(condition),
                        size: 96,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 12),

                      // City name
                      Text(
                        _selectedCity,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      // Temp
                      Text(
                        "${weather['temp']}°C",
                        style: const TextStyle(
                          fontSize: 72,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                        ),
                      ),

                      // Description
                      Text(
                        condition,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        weather['desc'] as String,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 32),

                      // Detailed statistics box
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.white.withOpacity(0.1)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildWeatherMetric(Icons.wind_power, "${weather['wind']} km/h", "Vent"),
                            _buildWeatherMetric(Icons.water_drop, "${weather['humidity']}%", "Humidité"),
                            _buildWeatherMetric(Icons.wb_sunny, "UV ${weather['uv']}", "Indice UV"),
                          ],
                        ),
                      ),

                      const SizedBox(height: 28),

                      // Hourly Forecast section
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Prévisions Aujourd'hui",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: (weather['hourly'] as List).length,
                          itemBuilder: (context, index) {
                            final hour = (weather['hourly'] as List)[index];
                            return Container(
                              width: 80,
                              margin: const EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.white.withOpacity(0.05)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    hour['time'],
                                    style: const TextStyle(color: Colors.white70, fontSize: 11),
                                  ),
                                  const SizedBox(height: 8),
                                  Icon(hour['icon'] as IconData, color: Colors.white, size: 24),
                                  const SizedBox(height: 8),
                                  Text(
                                    "${hour['temp']}°",
                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 28),

                      // Weekly Forecast section
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Prévisions 5 Jours",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      ... (weather['weekly'] as List).map((day) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Day name
                              Expanded(
                                child: Text(
                                  day['day'],
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                              ),
                              // Weather description and icon
                              Row(
                                children: [
                                  Icon(day['icon'] as IconData, color: Colors.white, size: 20),
                                  const SizedBox(width: 8),
                                  Text(
                                    day['cond'],
                                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                                  ),
                                ],
                              ),
                              // High/Low Temperature
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    day['temp'],
                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherMetric(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 11),
        ),
      ],
    );
  }
}
