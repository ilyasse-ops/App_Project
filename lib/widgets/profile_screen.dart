import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isFollowing = false;
  int _followersCount = 1420;

  final List<String> _skills = [
    "Flutter & Dart",
    "UI/UX Design",
    "Firebase",
    "Python",
    "Git & GitHub",
    "REST APIs"
  ];

  final List<Map<String, dynamic>> _socials = [
    {"name": "GitHub", "icon": Icons.code, "handle": "@ahmed_dev", "color": Colors.black87},
    {"name": "LinkedIn", "icon": Icons.business_center, "handle": "Ahmed El-Khoury", "color": Colors.blue[800]},
    {"name": "Twitter", "icon": Icons.chat_bubble_outline, "handle": "@ahmed_flutter", "color": Colors.blue[400]},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Cover Photo & Avatar Area
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Cover Image Gradient
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF6366F1), Color(0xFFD946EF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                // Glowing circle inside cover
                Positioned(
                  left: -50,
                  top: -50,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                // Back Button (If within navigation, represented here manually)
                Positioned(
                  top: 40,
                  left: 20,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.more_vert, color: Colors.white, size: 20),
                  ),
                ),

                // Profile Image overlapping the cover
                Positioned(
                  bottom: -60,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 56,
                      backgroundImage: NetworkImage(
                        "https://picsum.photos/300/300",
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 70),

            // Profile info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const Text(
                    "Ahmed El-Khoury",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Développeur Mobile Principal",
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text("Paris, France", style: TextStyle(color: Colors.grey, fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Actions Row
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isFollowing = !_isFollowing;
                              _followersCount += _isFollowing ? 1 : -1;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _isFollowing ? Colors.grey[200] : const Color(0xFF6366F1),
                            foregroundColor: _isFollowing ? Colors.black87 : Colors.white,
                            elevation: _isFollowing ? 0 : 2,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                          child: Text(
                            _isFollowing ? "Suivi ✓" : "Suivre",
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Démarrage d'une discussion...")),
                            );
                          },
                          icon: const Icon(Icons.mail_outline_rounded, color: Color(0xFF6366F1)),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // Stats Section
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatColumn("120", "Publications"),
                        Container(width: 1, height: 30, color: Colors.grey[300]),
                        _buildStatColumn("$_followersCount", "Abonnés"),
                        Container(width: 1, height: 30, color: Colors.grey[300]),
                        _buildStatColumn("345", "Abonnements"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // About Section
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "À propos de moi",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Développeur passionné par la création d'applications mobiles élégantes et fluides avec Flutter. Plus de 5 ans d'expérience dans l'écosystème mobile, j'adore l'open-source, le design interactif et l'intégration des API complexes.",
                    style: TextStyle(color: Colors.grey[700], height: 1.5, fontSize: 13.5),
                  ),

                  const SizedBox(height: 28),

                  // Skills Section
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Compétences clés",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: _skills.map((skill) {
                        return Chip(
                          label: Text(skill),
                          labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.grey[300]!),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Social Channels Section
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Réseaux sociaux",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ..._socials.map((social) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey[200]!),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: social['color'].withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(social['icon'], color: social['color']),
                        ),
                        title: Text(
                          social['name'],
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        subtitle: Text(social['handle'], style: const TextStyle(fontSize: 12)),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.grey),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Redirection vers le compte ${social['name']}...")),
                          );
                        },
                      ),
                    );
                  }).toList(),

                  const SizedBox(height: 40),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
