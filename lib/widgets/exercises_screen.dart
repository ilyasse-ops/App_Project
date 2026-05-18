import 'package:flutter/material.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  // Exercise 1 state
  bool _isFollowing = false;

  // Exercise 2 state
  String _clickedButton = "Aucun bouton cliqué";

  // Exercise 3 state
  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();
  double? _calcResult;
  String _selectedOperator = "+";

  void _calculateResult() {
    final double? num1 = double.tryParse(_number1Controller.text);
    final double? num2 = double.tryParse(_number2Controller.text);

    if (num1 == null || num2 == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Veuillez saisir deux nombres valides."),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    setState(() {
      switch (_selectedOperator) {
        case "+":
          _calcResult = num1 + num2;
          break;
        case "-":
          _calcResult = num1 - num2;
          break;
        case "×":
          _calcResult = num1 * num2;
          break;
        case "÷":
          if (num2 == 0) {
            _calcResult = null;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Division par zéro impossible !"),
                backgroundColor: Colors.redAccent,
              ),
            );
          } else {
            _calcResult = num1 / num2;
          }
          break;
      }
    });
  }

  @override
  void dispose() {
    _number1Controller.dispose();
    _number2Controller.dispose();
    super.dispose();
  }

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
              theme.colorScheme.primaryContainer.withOpacity(0.1),
              theme.colorScheme.background,
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            // Screen Header
            Row(
              children: [
                Icon(Icons.assignment_outlined, size: 32, color: theme.colorScheme.primary),
                const SizedBox(width: 12),
                Text(
                  "Exercices Pratiques",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Démonstrations en temps réel et codes sources des exercices demandés.",
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),

            // Exercise 1 Card
            _buildExerciseSection(
              title: "Exercice 1 — Carte Profil",
              objective: "Créer une image (haut), un nom (centre) et un bouton (bas) alignés verticalement.",
              codeSnippet: '''Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage("https://picsum.photos/200"),
    ),
    SizedBox(height: 20),
    Text("Ahmed", style: TextStyle(fontSize: 24)),
    SizedBox(height: 20),
    ElevatedButton(
      onPressed: () {},
      child: Text("Suivre"),
    ),
  ],
)''',
              demoWidget: Center(
                child: Container(
                  width: 250,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: theme.colorScheme.outlineVariant.withOpacity(0.5)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          "https://picsum.photos/200",
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Ahmed",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Développeur Mobile",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isFollowing = !_isFollowing;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isFollowing ? Colors.green[600] : theme.colorScheme.primary,
                          foregroundColor: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        ),
                        child: Text(_isFollowing ? "Suivi ✓" : "Suivre"),
                      ),
                    ],
                  ),
                ),
              ),
              context: context,
            ),

            const SizedBox(height: 28),

            // Exercise 2 Card
            _buildExerciseSection(
              title: "Exercice 2 — Créer une ligne de boutons",
              objective: "Disposer 3 boutons de manière horizontale espacés équitablement.",
              codeSnippet: '''Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    ElevatedButton(onPressed: () {}, child: Text("A")),
    ElevatedButton(onPressed: () {}, child: Text("B")),
    ElevatedButton(onPressed: () {}, child: Text("C")),
  ],
)''',
              demoWidget: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: theme.colorScheme.outlineVariant.withOpacity(0.5)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _clickedButton = "Bouton A cliqué !";
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo[500],
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text("A", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _clickedButton = "Bouton B cliqué !";
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo[600],
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text("B", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _clickedButton = "Bouton C cliqué !";
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo[700],
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text("C", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Chip(
                    avatar: const Icon(Icons.touch_app, size: 16, color: Colors.indigo),
                    label: Text(
                      _clickedButton,
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo),
                    ),
                    backgroundColor: Colors.indigo[50],
                  ),
                ],
              ),
              context: context,
            ),

            const SizedBox(height: 28),

            // Exercise 3 Card
            _buildExerciseSection(
              title: "Exercice 3 — Mini Calculatrice",
              objective: "Créer un champ texte, un bouton et afficher le résultat calculé.",
              codeSnippet: '''// Widgets utilisés : TextField, ElevatedButton, Text
Column(
  children: [
    TextField(controller: controller, ...),
    ElevatedButton(
      onPressed: calculer,
      child: Text("Calculer"),
    ),
    Text("Résultat : \$resultat"),
  ],
)''',
              demoWidget: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: theme.colorScheme.outlineVariant.withOpacity(0.5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _number1Controller,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              labelText: "Nombre 1",
                              hintText: "0.0",
                              filled: true,
                              fillColor: Colors.grey[50],
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: DropdownButton<String>(
                            value: _selectedOperator,
                            underline: const SizedBox(),
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.primary,
                            ),
                            items: <String>['+', '-', '×', '÷'].map((String val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            }).toList(),
                            onChanged: (String? newVal) {
                              if (newVal != null) {
                                setState(() {
                                  _selectedOperator = newVal;
                                });
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _number2Controller,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              labelText: "Nombre 2",
                              hintText: "0.0",
                              filled: true,
                              fillColor: Colors.grey[50],
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _calculateResult,
                      icon: const Icon(Icons.calculate_outlined),
                      label: const Text("Calculer"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.1)),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              "Résultat Affiché :",
                              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _calcResult == null
                                  ? "--"
                                  : (_calcResult == _calcResult!.toInt()
                                      ? "${_calcResult!.toInt()}"
                                      : _calcResult!.toStringAsFixed(3)),
                              style: theme.textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              context: context,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseSection({
    required String title,
    required String objective,
    required String codeSnippet,
    required Widget demoWidget,
    required BuildContext context,
  }) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: theme.colorScheme.outlineVariant.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 20,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          objective,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        backgroundColor: Colors.transparent,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(height: 1),
                const SizedBox(height: 16),
                const Text(
                  "Rendu Interactif :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 12),
                demoWidget,
                const SizedBox(height: 24),
                const Text(
                  "Code Flutter suggéré :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      codeSnippet,
                      style: const TextStyle(
                        fontFamily: 'Courier',
                        color: Colors.greenAccent,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          )
        ],
      ),
    );
  }
}
