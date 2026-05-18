import 'package:flutter/material.dart';
import 'widgets/important_widgets_screen.dart';
import 'widgets/exercises_screen.dart';
import 'widgets/login_screen.dart';
import 'widgets/profile_screen.dart';
import 'widgets/product_list_screen.dart';
import 'widgets/calculator_screen.dart';
import 'widgets/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apprentissage Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.light,
          background: const Color(0xFFF8FAFC),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
          headlineMedium: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
          titleLarge: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
          bodyLarge: TextStyle(color: Color(0xFF334155)),
          bodyMedium: TextStyle(color: Color(0xFF475569)),
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF1E293B),
          elevation: 0.5,
          centerTitle: true,
        ),
      ),
      home: const MainNavigationHub(),
    );
  }
}

class MainNavigationHub extends StatefulWidget {
  const MainNavigationHub({super.key});

  @override
  State<MainNavigationHub> createState() => _MainNavigationHubState();
}

class _MainNavigationHubState extends State<MainNavigationHub> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ImportantWidgetsScreen(),
    const ExercisesScreen(),
    const ProjectsDashboardScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.rocket_launch_outlined, color: theme.colorScheme.primary),
            const SizedBox(width: 8),
            const Text(
              "Flutter Hub",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.white,
          selectedItemColor: theme.colorScheme.primary,
          unselectedItemColor: Colors.grey[400],
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.widgets_outlined),
              activeIcon: Icon(Icons.widgets),
              label: 'Widgets Core',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              activeIcon: Icon(Icons.assignment),
              label: 'Exercices',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_customize_outlined),
              activeIcon: Icon(Icons.dashboard_customize),
              label: 'Projets',
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectsDashboardScreen extends StatelessWidget {
  const ProjectsDashboardScreen({super.key});

  final List<Map<String, dynamic>> _projects = const [
    {
      "title": "Écran Connexion",
      "desc": "Interface de connexion moderne avec validations, bouton de chargement et gestion de l'affichage sécurisé du mot de passe.",
      "icon": Icons.lock_open_rounded,
      "color": Color(0xFF6366F1),
      "screen": LoginScreen(),
    },
    {
      "title": "Profil Utilisateur",
      "desc": "Page de profil premium avec couverture dégradée, statistiques, bio textuelle, liste de compétences et liens vers les réseaux sociaux.",
      "icon": Icons.person_outline_rounded,
      "color": Color(0xFFD946EF),
      "screen": ProfileScreen(),
    },
    {
      "title": "Liste Produits",
      "desc": "Catalogue e-commerce moderne disposé en grille double colonne avec barre de recherche, filtres par puce et incrémentation de panier dynamique.",
      "icon": Icons.shopping_bag_outlined,
      "color": Color(0xFF10B981),
      "screen": ProductListScreen(),
    },
    {
      "title": "Calculatrice",
      "desc": "Mini calculatrice complète au format dark-theme, gérant les priorités arithmétiques, décimales, pourcentages et historique des calculs.",
      "icon": Icons.calculate_outlined,
      "color": Color(0xFFF59E0B),
      "screen": CalculatorScreen(),
    },
    {
      "title": "Application Météo",
      "desc": "Visualiseur météo adaptant son fond en dégradé de couleur en temps réel selon les conditions météo et gérant la recherche de multiples villes.",
      "icon": Icons.cloud_outlined,
      "color": Color(0xFF06B6D4),
      "screen": WeatherScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.primaryContainer.withOpacity(0.05),
              theme.colorScheme.background,
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            Row(
              children: [
                Icon(Icons.dashboard_customize_outlined, size: 32, color: theme.colorScheme.primary),
                const SizedBox(width: 12),
                Text(
                  "Applications Projets",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Découvrez et explorez les 5 projets interactifs créés sur mesure selon votre cahier des charges.",
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),

            // Vertical list of project cards
            ..._projects.map((proj) {
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: theme.colorScheme.outlineVariant.withOpacity(0.4)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    )
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => proj['screen'] as Widget),
                      );
                    },
                    borderRadius: BorderRadius.circular(24),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          // Left color block icon
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: (proj['color'] as Color).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              proj['icon'] as IconData,
                              size: 32,
                              color: proj['color'] as Color,
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Text and details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      proj['title'] as String,
                                      style: theme.textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.green[50],
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        "Actif",
                                        style: TextStyle(
                                          color: Colors.green[800],
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  proj['desc'] as String,
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    color: Colors.grey[600],
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
