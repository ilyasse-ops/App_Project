import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  int _cartCount = 0;
  String _selectedCategory = "Tout";
  String _searchQuery = "";

  final List<Map<String, dynamic>> _products = [
    {
      "id": 1,
      "title": "Casque Audio Premium",
      "price": 189.99,
      "rating": 4.8,
      "reviews": 124,
      "category": "Tech",
      "image": "https://picsum.photos/id/101/300/300",
      "description": "Casque audio sans fil haute performance avec réduction active du bruit. Doté d'une autonomie ultra-longue de 40 heures et d'un confort d'écoute exceptionnel."
    },
    {
      "id": 2,
      "title": "Montre Connectée Pro",
      "price": 249.50,
      "rating": 4.6,
      "reviews": 89,
      "category": "Tech",
      "image": "https://picsum.photos/id/102/300/300",
      "description": "Suivez votre santé et votre forme au quotidien. Écran AMOLED lumineux, GPS intégré, capteur de fréquence cardiaque en continu et étanchéité jusqu'à 50 mètres."
    },
    {
      "id": 3,
      "title": "Sac à dos Urban",
      "price": 59.90,
      "rating": 4.5,
      "reviews": 210,
      "category": "Style",
      "image": "https://picsum.photos/id/103/300/300",
      "description": "Sac à dos résistant à l'eau idéal pour les trajets quotidiens. Compartiment rembourré pour ordinateur portable 15,6 pouces et multiples poches de rangement intelligentes."
    },
    {
      "id": 4,
      "title": "Enceinte Bluetooth",
      "price": 79.99,
      "rating": 4.7,
      "reviews": 154,
      "category": "Tech",
      "image": "https://picsum.photos/id/104/300/300",
      "description": "Un son à 360 degrés d'une clarté impressionnante avec des basses profondes. Complètement étanche (IPX7), emportez la fête partout où vous allez."
    },
    {
      "id": 5,
      "title": "Lunettes de Soleil Classic",
      "price": 120.00,
      "rating": 4.3,
      "reviews": 67,
      "category": "Style",
      "image": "https://picsum.photos/id/105/300/300",
      "description": "Lunettes de soleil polarisées au design intemporel. Protection UV400 complète, branches légères en acétate et verres anti-reflets ultra-clairs."
    },
    {
      "id": 6,
      "title": "Machine à Café Compacte",
      "price": 149.00,
      "rating": 4.4,
      "reviews": 112,
      "category": "Maison",
      "image": "https://picsum.photos/id/106/300/300",
      "description": "Savourez d'excellents expressos ou capuccinos crémeux en quelques secondes. Chauffe rapide, réservoir amovible d'un litre et mousseur à lait intégré."
    },
  ];

  List<Map<String, dynamic>> get _filteredProducts {
    return _products.where((product) {
      final matchesCategory = _selectedCategory == "Tout" || product['category'] == _selectedCategory;
      final matchesSearch = product['title'].toString().toLowerCase().contains(_searchQuery.toLowerCase()) ||
          product['description'].toString().toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  void _showProductDetails(Map<String, dynamic> product) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Cover / Image
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(product['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    right: 15,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.black87),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 12,
                    left: 15,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        product['category'],
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                    ),
                  ),
                ],
              ),

              // Details Padding
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              product['title'],
                              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                            ),
                          ),
                          Text(
                            "${product['price'].toStringAsFixed(2)} €",
                            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Colors.indigo),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Rating & Reviews row
                      Row(
                        children: [
                          const Icon(Icons.star_rounded, color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            "${product['rating']}",
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "(${product['reviews']} avis)",
                            style: const TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),
                      const Text(
                        "Description",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product['description'],
                        style: TextStyle(color: Colors.grey[700], height: 1.5, fontSize: 14),
                      ),

                      const SizedBox(height: 36),

                      // Action Button
                      SizedBox(
                        height: 52,
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              _cartCount++;
                            });
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("${product['title']} ajouté au panier !"),
                                backgroundColor: Colors.indigo,
                                action: SnackBarAction(
                                  label: "Annuler",
                                  textColor: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      _cartCount--;
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
                          label: const Text("Ajouter au Panier", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            elevation: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Boutique Connectée",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1E293B),
        elevation: 0.5,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, size: 26),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Votre panier contient $_cartCount produits.")),
                  );
                },
              ),
              if (_cartCount > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      "$_cartCount",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Container(
        color: const Color(0xFFF8FAFC),
        child: Column(
          children: [
            // Search Bar & Filter chips
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: TextField(
                onChanged: (val) {
                  setState(() {
                    _searchQuery = val;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Rechercher un produit...",
                  prefixIcon: const Icon(Icons.search, color: Color(0xFF64748B)),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  hintStyle: const TextStyle(color: Color(0xFF94A3B8)),
                ),
              ),
            ),

            // Category list (Horizontal ListView)
            SizedBox(
              height: 52,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                children: ["Tout", "Tech", "Style", "Maison"].map((category) {
                  final isSelected = _selectedCategory == category;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: isSelected,
                      onSelected: (bool selected) {
                        if (selected) {
                          setState(() {
                            _selectedCategory = category;
                          });
                        }
                      },
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : const Color(0xFF64748B),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.indigo,
                      checkmarkColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 8),

            // Product Grid
            Expanded(
              child: _filteredProducts.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off_rounded, size: 64, color: Colors.grey[400]),
                          const SizedBox(height: 12),
                          const Text(
                            "Aucun produit ne correspond.",
                            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.72,
                      ),
                      itemCount: _filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = _filteredProducts[index];

                        return GestureDetector(
                          onTap: () => _showProductDetails(product),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.02),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Product Image with favorite badge
                                Stack(
                                  children: [
                                    Container(
                                      height: 130,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(product['image']),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: const BoxDecoration(
                                          color: Colors.white70,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.favorite_border,
                                          size: 16,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                // Card Content
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Product Title
                                        Text(
                                          product['title'],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Color(0xFF1E293B),
                                          ),
                                        ),

                                        // Rating Row
                                        Row(
                                          children: [
                                            const Icon(Icons.star, color: Colors.amber, size: 14),
                                            const SizedBox(width: 2),
                                            Text(
                                              "${product['rating']}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              "(${product['reviews']})",
                                              style: const TextStyle(fontSize: 10, color: Colors.grey),
                                            ),
                                          ],
                                        ),

                                        // Pricing & Add button
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${product['price'].toStringAsFixed(2)} €",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 14,
                                                color: Colors.indigo,
                                              ),
                                            ),
                                            Container(
                                              height: 28,
                                              width: 28,
                                              decoration: BoxDecoration(
                                                color: Colors.indigo.withOpacity(0.1),
                                                shape: BoxShape.circle,
                                              ),
                                              child: IconButton(
                                                padding: EdgeInsets.zero,
                                                icon: const Icon(Icons.add, size: 16, color: Colors.indigo),
                                                onPressed: () {
                                                  setState(() {
                                                    _cartCount++;
                                                  });
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text("${product['title']} ajouté !"),
                                                      duration: const Duration(seconds: 1),
                                                      backgroundColor: Colors.indigo,
                                                    ),
                                                  );
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
