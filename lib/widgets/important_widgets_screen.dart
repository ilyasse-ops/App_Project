import 'package:flutter/material.dart';

class ImportantWidgetsScreen extends StatefulWidget {
  const ImportantWidgetsScreen({super.key});

  @override
  State<ImportantWidgetsScreen> createState() => _ImportantWidgetsScreenState();
}

class _ImportantWidgetsScreenState extends State<ImportantWidgetsScreen> {
  String? _selectedWidget;
  int _statelessCounter = 0; // Won't change visually in StatelessWidget demo
  int _statefulCounter = 0;   // Will change in StatefulWidget demo

  final List<Map<String, String>> _widgetsInfo = [
    {
      'name': 'Scaffold',
      'role': 'Structure de la page',
      'desc': 'Fournit la structure visuelle de base d\'un écran, incluant l\'AppBar, le tiroir de navigation (Drawer), le FloatingActionButton, et le corps de la page.',
      'code': '''Scaffold(
  appBar: AppBar(title: Text("Titre")),
  body: Center(child: Text("Contenu")),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
)'''
    },
    {
      'name': 'AppBar',
      'role': 'Barre du haut',
      'desc': 'Une barre d\'outils en haut de l\'écran contenant typiquement le titre de la page, des icônes d\'actions, et un bouton de retour.',
      'code': '''AppBar(
  title: Text("Mon Application"),
  backgroundColor: Colors.indigo,
  actions: [
    IconButton(
      icon: Icon(Icons.notifications),
      onPressed: () {},
    ),
  ],
)'''
    },
    {
      'name': 'Center',
      'role': 'Centre un widget',
      'desc': 'Un widget de mise en page qui centre son enfant unique horizontalement et verticalement dans l\'espace disponible.',
      'code': '''Center(
  child: Text("Texte centré !"),
)'''
    },
    {
      'name': 'Padding',
      'role': 'Ajoute de l’espace',
      'desc': 'Permet d\'ajouter des marges intérieures (espacement) tout autour d\'un widget enfant.',
      'code': '''Padding(
  padding: EdgeInsets.all(16.0),
  child: Card(child: Text("Avec de l'espace")),
)'''
    },
    {
      'name': 'ListView',
      'role': 'Liste scrollable',
      'desc': 'Une liste d\'éléments disposés de manière linéaire (verticale ou horizontale) qui permet le défilement automatique lorsque le contenu dépasse l\'écran.',
      'code': '''ListView(
  children: [
    ListTile(
      leading: Icon(Icons.star),
      title: Text("Élément 1"),
    ),
    ListTile(
      leading: Icon(Icons.star),
      title: Text("Élément 2"),
    ),
  ],
)'''
    },
    {
      'name': 'Stack',
      'role': 'Superposition',
      'desc': 'Permet d\'empiler plusieurs widgets les uns sur les autres (comme des couches). Utile pour ajouter du texte sur des images ou créer des badges.',
      'code': '''Stack(
  children: [
    Image.network("https://picsum.photos/200"),
    Positioned(
      bottom: 10,
      left: 10,
      child: Text("Texte superposé"),
    ),
  ],
)'''
    },
    {
      'name': 'Expanded',
      'role': 'Prend l’espace restant',
      'desc': 'Force l\'enfant d\'une Row, Column ou Flex à s\'étendre pour remplir tout l\'espace libre restant dans l\'axe principal.',
      'code': '''Row(
  children: [
    Container(width: 50, color: Colors.red),
    Expanded(
      child: Container(color: Colors.blue), // Prend tout le reste !
    ),
    Container(width: 50, color: Colors.green),
  ],
)'''
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
              theme.colorScheme.primaryContainer.withOpacity(0.2),
              theme.colorScheme.background,
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            // Header
            Row(
              children: [
                Icon(Icons.widgets_outlined, size: 32, color: theme.colorScheme.primary),
                const SizedBox(width: 12),
                Text(
                  "Widgets Importants",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Les briques fondamentales indispensables pour construire n'importe quelle interface Flutter.",
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),

            // Widgets Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.5,
              ),
              itemCount: _widgetsInfo.length,
              itemBuilder: (context, index) {
                final widgetItem = _widgetsInfo[index];
                final isSelected = _selectedWidget == widgetItem['name'];

                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedWidget = isSelected ? null : widgetItem['name'];
                      });
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? theme.colorScheme.primary
                            : theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? theme.colorScheme.primary
                              : theme.colorScheme.outlineVariant.withOpacity(0.5),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: isSelected
                                ? theme.colorScheme.primary.withOpacity(0.3)
                                : Colors.black.withOpacity(0.04),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widgetItem['name']!,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : theme.colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            widgetItem['role']!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: isSelected ? Colors.white.withOpacity(0.8) : Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            // Widget Explorer / Details Panel
            if (_selectedWidget != null) ...[
              const SizedBox(height: 24),
              _buildWidgetExplorerPanel(context),
            ],

            const SizedBox(height: 36),

            // State management explanation section
            Row(
              children: [
                Icon(Icons.bolt, size: 32, color: Colors.amber[700]),
                const SizedBox(width: 12),
                Text(
                  "Stateless vs Stateful",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildStateComparisonCard(context),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetExplorerPanel(BuildContext context) {
    final theme = Theme.of(context);
    final widgetData = _widgetsInfo.firstWhere((w) => w['name'] == _selectedWidget);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.colorScheme.outlineVariant.withOpacity(0.8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Widget : ${widgetData['name']}",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _selectedWidget = null;
                  });
                },
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            widgetData['desc']!,
            style: theme.textTheme.bodyMedium?.copyWith(height: 1.4),
          ),
          const SizedBox(height: 16),
          Text(
            "Exemple de code :",
            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(12),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                widgetData['code']!,
                style: const TextStyle(
                  fontFamily: 'Courier',
                  color: Colors.greenAccent,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Rendu Interactif :",
            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildWidgetDemoRenderer(widgetData['name']!),
        ],
      ),
    );
  }

  Widget _buildWidgetDemoRenderer(String name) {
    switch (name) {
      case 'Center':
        return Container(
          height: 100,
          color: Colors.grey[100],
          child: const Center(
            child: Chip(
              label: Text("Je suis au centre"),
              backgroundColor: Colors.indigoAccent,
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
        );
      case 'Padding':
        return Container(
          color: Colors.grey[100],
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.teal[400],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "Grâce au Padding externe de 24 pixels, je ne touche pas les bords !",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      case 'ListView':
        return Container(
          height: 140,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text("${index + 1}", style: const TextStyle(color: Colors.white)),
                ),
                title: Text("Élément défilant n° ${index + 1}"),
                subtitle: const Text("Faites défiler vers le bas"),
                dense: true,
              );
            },
          ),
        );
      case 'Stack':
        return Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              image: NetworkImage("https://picsum.photos/400/200"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "PROMO -20%",
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black87, Colors.transparent],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Une magnifique image empilée",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        );
      case 'Expanded':
        return Container(
          padding: const EdgeInsets.all(8),
          color: Colors.grey[200],
          child: Row(
            children: [
              Container(
                width: 60,
                height: 50,
                color: Colors.amber,
                child: const Center(child: Text("Fixe")),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 50,
                  color: Colors.blueAccent,
                  child: const Center(
                    child: Text(
                      "Expanded (prend tout le reste !)",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 60,
                height: 50,
                color: Colors.amber,
                child: const Center(child: Text("Fixe")),
              ),
            ],
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildStateComparisonCard(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: theme.colorScheme.outlineVariant.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 15,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Column(
        children: [
          // Row containing side by side description
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // StatelessWidget Left
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "StatelessWidget",
                          style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Interface fixe.",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Il ne peut pas changer d'état pendant que l'application tourne. Il se contente d'afficher les données qu'il a reçues à sa création.",
                        style: TextStyle(color: Colors.grey[600], fontSize: 13, height: 1.4),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // Divider line
                Container(width: 1, height: 150, color: Colors.grey[200]),
                const SizedBox(width: 20),
                // StatefulWidget Right
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.purple[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "StatefulWidget",
                          style: TextStyle(color: Colors.purple[800], fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Interface dynamique.",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Il possède un état interne mutable. En appelant setState(), on force Flutter à reconstruire le widget avec les nouvelles valeurs.",
                        style: TextStyle(color: Colors.grey[600], fontSize: 13, height: 1.4),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Interactive Comparison Playground
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Démonstration Interactive :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    // Stateless Demo Box
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.blue.withOpacity(0.2)),
                        ),
                        child: Column(
                          children: [
                            const Text("Stateless Counter", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                            const SizedBox(height: 12),
                            Text(
                              "$_statelessCounter",
                              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue[800]),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () {
                                // Increment without calling setState or modifying stateful state
                                _statelessCounter++; 
                                // Nothing changes visually because we don't trigger rebuilding!
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[600],
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              child: const Text("Ajouter"),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "(Ne fait rien car pas de setState)",
                              style: TextStyle(fontSize: 10, color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Stateful Demo Box
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.purple.withOpacity(0.2)),
                        ),
                        child: Column(
                          children: [
                            const Text("Stateful Counter", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                            const SizedBox(height: 12),
                            Text(
                              "$_statefulCounter",
                              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.purple[800]),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _statefulCounter++;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple[600],
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              child: const Text("Ajouter"),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "(S'incrémente grâce au setState)",
                              style: TextStyle(fontSize: 10, color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
