# 🚀 Hub d'Apprentissage & Projets Interactifs Flutter

Bienvenue dans le **Hub d'Apprentissage & Projets Flutter** ! Une application éducative et pratique de niveau premium construite entièrement avec Flutter et Material 3. 

Cette application a été conçue pour offrir à la fois un **cours interactif en direct** sur les widgets de base et une **galerie d'applications autonomes complexes** développées sur mesure.

---

## 📸 Aperçu des Fonctionnalités du Hub

L'application principale est structurée autour d'un système de navigation fluide composé de trois piliers majeurs :

### 1. 📚 Bibliothèque de Widgets (`Widgets Core`)
Un espace d'apprentissage en direct pour maîtriser les 7 widgets fondamentaux de Flutter :
* **Widgets documentés** : `Scaffold`, `AppBar`, `Center`, `Padding`, `ListView`, `Stack`, `Expanded`.
* **Explorateur dynamique** : Cliquez sur un widget pour afficher :
  - Son rôle précis et sa description détaillée.
  - Son **code source d'exemple** affiché dans un bloc sombre élégant.
  - Un **rendu interactif en direct** du widget directement intégré dans le tableau de bord !
* **Playground Stateless vs Stateful** : Une démonstration interactive comparant le comportement des widgets sans état et avec état en temps réel grâce à deux compteurs de clics (démontrant de manière flagrante l'utilité de `setState()`).

### 2. 📝 Galerie d'Exercices Pratiques (`Exercices`)
Démonstrations visuelles et interactives des exercices demandés, accompagnées de leurs codes sources respectifs :
* **Exercice 1 — Carte Profil** : Une carte profil élégante combinant avatar, nom et bouton de suivi.
* **Exercice 2 — Ligne de Boutons** : 3 boutons disposés horizontalement et espacés de manière équitable.
* **Exercice 3 — Mise en Page Complexe** : Combinaison de lignes (`Row`) et de colonnes (`Column`) pour former une structure d'application complète avec icônes et boutons.

### 3. 🛠️ Dashboard des 5 Applications Projets (`Projets`)
Un tableau de bord moderne listant **5 applications autonomes et complètes**, accessibles via des transitions animées avec retour automatique :

* **🔐 1. Écran de Connexion (Connection Screen)** : Formulaire sécurisé avec clés de validation globales (`FormState`), validation regex d'email, masquage/affichage du mot de passe, indicateur de chargement réseau simulé (2s) et écran de succès personnalisé avec message de bienvenue dynamique.
* **👤 2. Profil Utilisateur (User Profile)** : En-tête avec couverture en dégradé, statistiques, bouton de suivi dynamique interactif qui met à jour le compteur d'abonnés en direct, badges de compétences, et liens vers les réseaux sociaux avec snackbars.
* **🛍️ 3. Liste de Produits (Product List)** : Catalogue e-commerce sur grille double colonne, barre de recherche fonctionnelle en direct, filtrage par catégories, badge de panier dynamique interactif dans l'AppBar avec option d'annulation et modale inférieure (`BottomSheet`) de détails.
* **🧮 4. Calculatrice (Interactive Calculator)** : Clavier complet avec Dark Theme, historique des calculs, gestion des priorités opératoires complexes, décimales, pourcentages et touche effacer (`Backspace`).
* **☀️ 5. Application Météo (Simple Weather App)** : **Thème à gradients réactifs** s'adaptant instantanément au climat de la ville recherchée (Sunny, Cloudy, Rainy, Snowy), recherche de villes (Paris, New York, Tokyo, Montréal), détails météo (vent, humidité, UV) et prévisions horaires et quotidiennes.

---

## 📂 Structure des Fichiers du Projet

```text
lib/
├── main.dart                          # Point d'entrée de l'application & Hub de navigation
└── widgets/
    ├── important_widgets_screen.dart  # Écran d'apprentissage des Widgets & Démo Stateful/Stateless
    ├── exercises_screen.dart          # Rendu interactif et code des Exercices 1, 2 et 3
    ├── login_screen.dart              # Projet 1 : Écran de connexion sécurisé
    ├── profile_screen.dart            # Projet 2 : Page de profil utilisateur réactive
    ├── product_list_screen.dart       # Projet 3 : Catalogue e-commerce et gestion de panier
    ├── calculator_screen.dart         # Projet 4 : Calculatrice Dark Theme
    └── weather_screen.dart            # Projet 5 : Application météo à gradients dynamiques
```

---

## 🚀 Installation et Démarrage

### Prérequis
* [Flutter SDK](https://docs.flutter.dev/get-started/install) (version 3.19.0 ou supérieure recommandée)
* [Dart SDK](https://dart.dev/get-started)
* Un appareil connecté (émulateur Android/iOS, navigateur Web, ou machine de bureau)

### Étapes de lancement

1. **Cloner le dépôt** :
   ```bash
   git clone https://github.com/ilyasse-ops/App_Project.git
   cd App_Project
   ```

2. **Récupérer les dépendances** :
   ```bash
   flutter pub get
   ```

3. **Lister les appareils disponibles** :
   ```bash
   flutter devices
   ```

4. **Lancer l'application en mode développement** :
   ```bash
   flutter run
   ```

5. **Lancer l'analyse de code pour contrôle** :
   ```bash
   flutter analyze
   ```

---

## 🎨 Spécifications de Design (Design System)
* **Design Moderne** : Utilisation exclusive des standards **Material 3**.
* **Palette de Couleurs** : Harmonisation des tons (HSL) avec dégradés élégants et prise en charge de thèmes dynamiques (comme l'application météo).
* **Typographie & Formes** : Structure typographique forte et coins arrondis à `20px`/`24px` pour un rendu épuré "Premium".
