import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const EasyMartApp());
}

class AppDatabase {
  static final List<User> users = [
    User(
      id: 'u1',
      name: 'Demo User',
      email: 'demo@easymart.app',
      password: '123456',
      role: 'user',
      address: '123 Main St, Makati, Manila',
      latitude: 14.5547,
      longitude: 121.0244,
    ),
    User(
      id: 'admin1',
      name: 'Admin User',
      email: 'admin@easymart.app',
      password: '123456',
      role: 'admin',
      address: 'Admin Office',
      latitude: 14.5995,
      longitude: 120.9842,
    ),
  ];

  static User? currentUser;

  static final List<Product> products = [
    Product(
      id: 'p1',
      name: 'Fresh Red Apples',
      category: 'Fruits',
      imageUrl:
          'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce?auto=format&fit=crop&w=900&q=80',
      price: 89.00,
      packSize: 6,
      unit: 'pcs',
      description: 'Sweet and fresh apples from local farms.',
    ),
    Product(
      id: 'p2',
      name: 'Bananas',
      category: 'Fruits',
      imageUrl:
          'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?auto=format&fit=crop&w=900&q=80',
      price: 55.00,
      packSize: 12,
      unit: 'pcs',
      description: 'Healthy and perfect for breakfast.',
    ),
    Product(
      id: 'p3',
      name: 'Rice 5kg',
      category: 'Groceries',
      imageUrl:
          'https://images.unsplash.com/photo-1586201375761-83865001e31d?auto=format&fit=crop&w=900&q=80',
      price: 245.00,
      packSize: 1,
      unit: 'bag',
      description: 'Classic Filipino staple rice.',
    ),
    Product(
      id: 'p4',
      name: 'Chicken Breast',
      category: 'Meat',
      imageUrl:
          'https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?auto=format&fit=crop&w=900&q=80',
      price: 180.00,
      packSize: 6,
      unit: 'pcs',
      description: 'Fresh chicken fillet for family meals.',
    ),
    Product(
      id: 'p5',
      name: 'Eggs',
      category: 'Dairy',
      imageUrl:
          'https://images.unsplash.com/photo-1518569656558-1f25e69d93d3?auto=format&fit=crop&w=900&q=80',
      price: 72.00,
      packSize: 12,
      unit: 'pcs',
      description: 'Farm-fresh eggs for breakfast and baking.',
    ),
    Product(
      id: 'p6',
      name: 'Tomatoes',
      category: 'Vegetables',
      imageUrl:
          'https://images.unsplash.com/photo-1546094096-0df4bcaaa337?auto=format&fit=crop&w=900&q=80',
      price: 68.00,
      packSize: 8,
      unit: 'pcs',
      description: 'Fresh tomatoes for everyday dishes.',
    ),
    Product(
      id: 'p7',
      name: 'Instant Noodles',
      category: 'Pantry',
      imageUrl:
          'https://images.unsplash.com/photo-1556740749-887f6717d7e4?auto=format&fit=crop&w=900&q=80',
      price: 48.00,
      packSize: 5,
      unit: 'pack',
      description: 'Quick pantry favorite for busy days.',
    ),
    Product(
      id: 'p8',
      name: 'Fresh Tilapia',
      category: 'Seafood',
      imageUrl:
          'https://images.unsplash.com/photo-1544943910-4c1dc44aab44?auto=format&fit=crop&w=900&q=80',
      price: 160.00,
      packSize: 3,
      unit: 'pcs',
      description: 'Fresh seafood for Filipino meals.',
    ),
    Product(
      id: 'p9',
      name: 'Carrots',
      category: 'Vegetables',
      imageUrl:
          'https://images.unsplash.com/photo-1447175008436-054170c2e979?auto=format&fit=crop&w=900&q=80',
      price: 53.00,
      packSize: 10,
      unit: 'pcs',
      description: 'Crunchy carrots for soups and salads.',
    ),
    Product(
      id: 'p10',
      name: 'Coconut Water',
      category: 'Beverages',
      imageUrl:
          'https://images.unsplash.com/photo-1546173159-315724a31696?auto=format&fit=crop&w=900&q=80',
      price: 42.00,
      packSize: 6,
      unit: 'bottle',
      description: 'Refreshing and natural hydration.',
    ),
    Product(
      id: 'p11',
      name: 'Pork Chops',
      category: 'Meat',
      imageUrl:
          'https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?auto=format&fit=crop&w=900&q=80',
      price: 210.00,
      packSize: 4,
      unit: 'pcs',
      description: 'Tender pork cuts for family dinners.',
    ),
    Product(
      id: 'p12',
      name: 'Bread Loaf',
      category: 'Bakery',
      imageUrl:
          'https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=900&q=80',
      price: 70.00,
      packSize: 1,
      unit: 'loaf',
      description: 'Soft and fresh loaf for breakfast.',
    ),
    Product(
      id: 'p13',
      name: 'Bottled Water',
      category: 'Beverages',
      imageUrl:
          'https://images.unsplash.com/photo-1548839140-29a749e1cf4d?auto=format&fit=crop&w=900&q=80',
      price: 28.00,
      packSize: 12,
      unit: 'bottle',
      description: 'Clean and refreshing everyday hydration.',
    ),
    Product(
      id: 'p14',
      name: 'Laundry Detergent',
      category: 'Household',
      imageUrl:
          'https://images.unsplash.com/photo-1581578731548-c64695cc6952?auto=format&fit=crop&w=900&q=80',
      price: 155.00,
      packSize: 1,
      unit: 'pack',
      description: 'Powerful cleaning for every wash.',
    ),
    Product(
      id: 'p15',
      name: 'Toilet Paper',
      category: 'Household',
      imageUrl:
          'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=900&q=80',
      price: 130.00,
      packSize: 12,
      unit: 'rolls',
      description: 'Soft and absorbent daily essentials.',
    ),
  ];

  static final List<CartItem> cartItems = [];

  static final List<Order> orders = [
    Order(
      id: 'ord1',
      userId: 'u1',
      items: [
        CartItem(
          productId: 'p1',
          name: 'Fresh Red Apples',
          price: 89,
          quantity: 2,
          imageUrl:
              'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce?auto=format&fit=crop&w=900&q=80',
        ),
        CartItem(
          productId: 'p6',
          name: 'Tomatoes',
          price: 68,
          quantity: 1,
          imageUrl:
              'https://images.unsplash.com/photo-1546094096-0df4bcaaa337?auto=format&fit=crop&w=900&q=80',
        ),
      ],
      totalAmount: 246.00,
      status: 'Delivered',
      createdAt: DateTime.now().subtract(const Duration(days: 7)),
      deliveryAddress: '123 Main St, Makati, Manila',
      driverLat: 14.5540,
      driverLng: 121.0250,
      eta: 0,
    ),
    Order(
      id: 'ord2',
      userId: 'u1',
      items: [
        CartItem(
          productId: 'p3',
          name: 'Rice 5kg',
          price: 245,
          quantity: 1,
          imageUrl:
              'https://images.unsplash.com/photo-1586201375761-83865001e31d?auto=format&fit=crop&w=900&q=80',
        ),
        CartItem(
          productId: 'p13',
          name: 'Bottled Water',
          price: 28,
          quantity: 3,
          imageUrl:
              'https://images.unsplash.com/photo-1548839140-29a749e1cf4d?auto=format&fit=crop&w=900&q=80',
        ),
      ],
      totalAmount: 329.00,
      status: 'In Transit',
      createdAt: DateTime.now().subtract(const Duration(days: 4)),
      deliveryAddress: '123 Main St, Makati, Manila',
      driverLat: 14.5551,
      driverLng: 121.0190,
      eta: 18,
    ),
    Order(
      id: 'ord3',
      userId: 'u1',
      items: [
        CartItem(
          productId: 'p4',
          name: 'Chicken Breast',
          price: 180,
          quantity: 2,
          imageUrl:
              'https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?auto=format&fit=crop&w=900&q=80',
        ),
        CartItem(
          productId: 'p10',
          name: 'Coconut Water',
          price: 42,
          quantity: 2,
          imageUrl:
              'https://images.unsplash.com/photo-1546173159-315724a31696?auto=format&fit=crop&w=900&q=80',
        ),
      ],
      totalAmount: 444.00,
      status: 'Delivered',
      createdAt: DateTime.now().subtract(const Duration(days: 14)),
      deliveryAddress: '123 Main St, Makati, Manila',
      driverLat: 14.5600,
      driverLng: 121.0150,
      eta: 0,
    ),
  ];

  static double get totalSpentThisWeek {
    final now = DateTime.now();
    return orders
        .where((order) =>
            order.userId == currentUser?.id &&
            order.createdAt.isAfter(now.subtract(const Duration(days: 7))))
        .fold(0.0, (sum, order) => sum + order.totalAmount);
  }

  static double get totalSpentThisMonth {
    final now = DateTime.now();
    return orders
        .where((order) =>
            order.userId == currentUser?.id &&
            order.createdAt.isAfter(now.subtract(const Duration(days: 30))))
        .fold(0.0, (sum, order) => sum + order.totalAmount);
  }

  static int get weeklyOrderCount {
    final now = DateTime.now();
    return orders
        .where((order) =>
            order.userId == currentUser?.id &&
            order.createdAt.isAfter(now.subtract(const Duration(days: 7))))
        .length;
  }

  static int get monthlyOrderCount {
    final now = DateTime.now();
    return orders
        .where((order) =>
            order.userId == currentUser?.id &&
            order.createdAt.isAfter(now.subtract(const Duration(days: 30))))
        .length;
  }

  static void addToCart(Product product) {
    final index = cartItems.indexWhere((item) => item.productId == product.id);
    if (index >= 0) {
      final current = cartItems[index];
      cartItems[index] = CartItem(
        productId: current.productId,
        name: current.name,
        price: current.price,
        quantity: current.quantity + 1,
        imageUrl: current.imageUrl,
      );
    } else {
      cartItems.add(
        CartItem(
          productId: product.id,
          name: product.name,
          price: product.price,
          quantity: 1,
          imageUrl: product.imageUrl,
        ),
      );
    }
  }

  static User? login(String email, String password) {
    try {
      final user = users.firstWhere(
        (u) => u.email == email && u.password == password,
      );
      currentUser = user;
      return user;
    } catch (_) {
      return null;
    }
  }

  static User? register(String name, String email, String password) {
    final newUser = User(
      id: 'u${users.length + 1}',
      name: name,
      email: email,
      password: password,
      role: 'user',
      address: 'Enter your delivery address',
      latitude: 14.5547,
      longitude: 121.0244,
    );
    users.add(newUser);
    currentUser = newUser;
    return newUser;
  }

  static void logout() {
    currentUser = null;
    cartItems.clear();
  }
}

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String role;
  String address;
  double latitude;
  double longitude;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.address,
    required this.latitude,
    required this.longitude,
  });
}

class Product {
  final String id;
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final int packSize;
  final String unit;
  final String description;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.packSize,
    required this.unit,
    required this.description,
  });

  String get packLabel => '$packSize $unit pack';
}

class CartItem {
  final String productId;
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;

  const CartItem({
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  double get total => price * quantity;
}

class Order {
  final String id;
  final String userId;
  final List<CartItem> items;
  final double totalAmount;
  String status;
  final DateTime createdAt;
  final String deliveryAddress;
  double driverLat;
  double driverLng;
  int eta;

  Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalAmount,
    required this.status,
    required this.createdAt,
    required this.deliveryAddress,
    required this.driverLat,
    required this.driverLng,
    required this.eta,
  });
}

class EasyMartApp extends StatelessWidget {
  const EasyMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyMart',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const AuthScreen(),
    );
  }
}

class AppTheme {
  static const Color primary = Color(0xFFFF8C00);
  static const Color primaryDark = Color(0xFF001F3F);
  static const Color background = Color(0xFFF5F7F8);
  static const Color text = Color(0xFF1B1D1F);
  static const Color muted = Color(0xFF6B7280);
  static const Color card = Color(0xFFFFFFFF);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: text,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: card,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: primary, width: 1.5),
        ),
      ),
    );
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLogin = true;
  final _emailController = TextEditingController(text: 'demo@easymart.app');
  final _passwordController = TextEditingController(text: '123456');
  final _nameController = TextEditingController();
  String? _errorMessage;

  void _handleLogin() {
    final user = AppDatabase.login(
      _emailController.text,
      _passwordController.text,
    );

    if (user != null) {
      if (user.role == 'admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const AdminDashboard()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const UserDashboard()),
        );
      }
    } else {
      setState(() => _errorMessage = 'Invalid credentials');
    }
  }

  void _handleRegister() {
    if (_nameController.text.isEmpty || _emailController.text.isEmpty) {
      setState(() => _errorMessage = 'Please fill all fields');
      return;
    }

    final user = AppDatabase.register(
      _nameController.text,
      _emailController.text,
      _passwordController.text,
    );

    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const UserDashboard()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 28),
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: AppTheme.primaryDark,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'E',
                        style: TextStyle(
                          fontSize: 86,
                          fontWeight: FontWeight.w900,
                          color: AppTheme.primary,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 16,
                        child: Container(
                          width: 34,
                          height: 28,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppTheme.primary, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.shopping_cart,
                            size: 16,
                            color: AppTheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'EasyMart',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.primaryDark,
                ),
              ),
              const Text(
                'Easy Shop, Smart Choice',
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 1.1,
                  color: AppTheme.muted,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 30),
              if (_errorMessage != null)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEBEE),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Color(0xFFE53935)),
                  ),
                ),
              const SizedBox(height: 16),
              if (!_isLogin)
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Full name',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
              if (!_isLogin) const SizedBox(height: 16),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _isLogin ? _handleLogin : _handleRegister,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(_isLogin ? 'Login' : 'Register'),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_isLogin ? "Don't have an account? " : 'Already have an account? '),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                        _errorMessage = null;
                      });
                    },
                    child: Text(
                      _isLogin ? 'Register' : 'Login',
                      style: const TextStyle(
                        color: AppTheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';

  void _addToCart(Product product) {
    AppDatabase.addToCart(product);
    setState(() {});
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} added to cart'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  List<Product> get _filteredProducts {
    final query = _searchController.text.toLowerCase();
    final items = AppDatabase.products.where((product) {
      final matchesCategory =
          _selectedCategory == 'All' || product.category == _selectedCategory;
      final matchesQuery =
          query.isEmpty || product.name.toLowerCase().contains(query);
      return matchesCategory && matchesQuery;
    }).toList();
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EasyMart'),
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CartScreen(cartItems: AppDatabase.cartItems),
                ),
              );
            },
          ),
        ],
      ),
      body: _selectedIndex == 0
          ? _buildShopScreen()
          : _selectedIndex == 1
              ? _buildOrdersScreen()
              : _buildProfileScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.shop_outlined), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_outlined), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outlined), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildShopScreen() {
    final categories = <String>['All', ...AppDatabase.products.map((e) => e.category).toSet()];

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(
              colors: [AppTheme.primary, const Color(0xFFFFA500)],
            ),
          ),
          child: Row(
            children: const [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good morning!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Fresh groceries in 20-30 mins',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.delivery_dining,
                size: 48,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            controller: _searchController,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: 'Search groceries',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final selected = _selectedCategory == category;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(category),
                  selected: selected,
                  onSelected: (_) {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                  selectedColor: AppTheme.primary,
                  labelStyle: TextStyle(
                    color: selected ? Colors.white : AppTheme.primaryDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: _filteredProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.72,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
            ),
            itemBuilder: (context, index) {
              final product = _filteredProducts[index];
              return ProductCard(
                product: product,
                onAdd: () => _addToCart(product),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildOrdersScreen() {
    final userOrders = AppDatabase.orders
        .where((order) => order.userId == AppDatabase.currentUser?.id)
        .toList();

    return userOrders.isEmpty
        ? const Center(
            child: Text(
              'No orders yet',
              style: TextStyle(fontSize: 18, color: AppTheme.muted),
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: userOrders.length,
            itemBuilder: (context, index) {
              final order = userOrders[index];
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.receipt, color: AppTheme.primary),
                  title: Text('Order ${order.id}'),
                  subtitle: Text(
                    '${order.createdAt.day}/${order.createdAt.month}/${order.createdAt.year}',
                  ),
                  trailing: Chip(
                    label: Text(order.status),
                    backgroundColor: order.status == 'Delivered'
                        ? const Color(0xFFE8F5E9)
                        : const Color(0xFFFFF3E0),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => OrderDetailScreen(order: order),
                      ),
                    );
                  },
                ),
              );
            },
          );
  }

  Widget _buildProfileScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFEAFBF3),
            ),
            child: const Icon(
              Icons.person,
              size: 40,
              color: AppTheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            AppDatabase.currentUser?.name ?? 'User',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          Text(
            AppDatabase.currentUser?.email ?? '',
            style: const TextStyle(color: AppTheme.muted),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: SummaryCard(
                  title: 'This Week',
                  value: '₱${AppDatabase.totalSpentThisWeek.toStringAsFixed(2)}',
                  subtitle: '${AppDatabase.weeklyOrderCount} orders',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SummaryCard(
                  title: 'This Month',
                  value: '₱${AppDatabase.totalSpentThisMonth.toStringAsFixed(2)}',
                  subtitle: '${AppDatabase.monthlyOrderCount} orders',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Delivery Address',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppDatabase.currentUser?.address ?? 'No address set',
                    style: const TextStyle(color: AppTheme.muted),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AddressScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                      label: const Text('Update Address'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primary,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: const Text(
              'Recent Orders Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 12),
          ...AppDatabase.orders
              .where((order) => order.userId == AppDatabase.currentUser?.id)
              .take(3)
              .map(
                (order) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order #${order.id}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  order.status,
                                  style: const TextStyle(
                                    color: AppTheme.muted,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '₱${order.totalAmount.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              color: AppTheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              AppDatabase.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const AuthScreen()),
              );
            },
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE53935),
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;

  const SummaryCard({
    required this.title,
    required this.value,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppTheme.muted,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppTheme.primaryDark,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(
                color: AppTheme.muted,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _addressController =
        TextEditingController(text: AppDatabase.currentUser?.address ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Address')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _addressController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Delivery Address',
                hintText: 'Enter your complete address',
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  if (AppDatabase.currentUser != null) {
                    AppDatabase.currentUser!.address = _addressController.text;
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Address updated successfully'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text('Save Address'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    required this.onAdd,
    super.key,
  });

  final Product product;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            child: Image.network(
              product.imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.packLabel,
                    style: const TextStyle(
                      color: AppTheme.muted,
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₱${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        onPressed: onAdd,
                        icon: const Icon(Icons.add_circle_rounded),
                        color: AppTheme.primary,
                        iconSize: 32,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({required this.cartItems, super.key});

  final List<CartItem> cartItems;

  double get subtotal {
    return cartItems.fold(0.0, (sum, item) => sum + item.total);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My cart')),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'Your cart is empty',
                style: TextStyle(fontSize: 18, color: AppTheme.muted),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return Card(
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                item.imageUrl,
                                width: 56,
                                height: 56,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(item.name),
                            subtitle: Text(
                              '${item.quantity} x ₱${item.price.toStringAsFixed(2)}',
                            ),
                            trailing: Text(
                              '₱${item.total.toStringAsFixed(2)}',
                              style: const TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Subtotal'),
                            Text('₱${subtotal.toStringAsFixed(2)}'),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Delivery'),
                            Text('₱29.00'),
                          ],
                        ),
                        const Divider(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            Text(
                              '₱${(subtotal + 29.00).toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Order placed successfully!'),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                              AppDatabase.cartItems.clear();
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primary,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text('Checkout'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class OrderDetailScreen extends StatelessWidget {
  final Order order;

  const OrderDetailScreen({required this.order, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Details')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order #${order.id}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Chip(
                          label: Text(order.status),
                          backgroundColor: order.status == 'Delivered'
                              ? const Color(0xFFE8F5E9)
                              : const Color(0xFFFFF3E0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Date: ${order.createdAt.day}/${order.createdAt.month}/${order.createdAt.year}',
                      style: const TextStyle(color: AppTheme.muted),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Address: ${order.deliveryAddress}',
                      style: const TextStyle(color: AppTheme.muted),
                    ),
                    const SizedBox(height: 12),
                    const Divider(),
                    const SizedBox(height: 12),
                    Text(
                      'Total Amount: ₱${order.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (order.status != 'Delivered')
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => OrderTrackingScreen(order: order),
                      ),
                    );
                  },
                  icon: const Icon(Icons.location_on_outlined),
                  label: const Text('Track Order on Map'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class OrderTrackingScreen extends StatefulWidget {
  final Order order;
  const OrderTrackingScreen({required this.order, super.key});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    final userLat = AppDatabase.currentUser?.latitude ?? 14.5547;
    final userLng = AppDatabase.currentUser?.longitude ?? 121.0244;
    final driverLat = order.driverLat;
    final driverLng = order.driverLng;

    final Map<MarkerId, Marker> markers = {
      const MarkerId('driver'): Marker(
        markerId: const MarkerId('driver'),
        position: LatLng(driverLat, driverLng),
        infoWindow: const InfoWindow(title: 'Driver Location'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        ),
      ),
      const MarkerId('customer'): Marker(
        markerId: const MarkerId('customer'),
        position: LatLng(userLat, userLng),
        infoWindow: const InfoWindow(title: 'Your Delivery Address'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
        ),
      ),
    };

    return Scaffold(
      appBar: AppBar(title: const Text('Track Your Order')),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ETA to your address',
                      style: TextStyle(fontSize: 16, color: AppTheme.muted),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${order.eta} minutes',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.primary,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.directions_car_filled,
                  size: 38,
                  color: AppTheme.primary,
                ),
              ],
            ),
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(userLat, userLng),
                zoom: 14,
              ),
              markers: markers.values.toSet(),
              onMapCreated: (controller) {
                mapController = controller;
              },
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Delivery progress',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(height: 12),
                LinearProgressIndicator(
                  value: (30 - order.eta) / 30,
                  backgroundColor: const Color(0xFFE5E7EB),
                  valueColor: const AlwaysStoppedAnimation(AppTheme.primary),
                  minHeight: 8,
                ),
                const SizedBox(height: 10),
                Text(
                  'Driver is on the way. ${order.eta} minutes remaining.',
                  style: const TextStyle(color: AppTheme.muted),
                ),
                const SizedBox(height: 12),
                Text(
                  'Delivery to: ${order.deliveryAddress}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              AppDatabase.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const AuthScreen()),
              );
            },
          ),
        ],
      ),
      body: _selectedIndex == 0
          ? _buildOverviewScreen()
          : _selectedIndex == 1
              ? _buildOrdersScreen()
              : _buildProductsScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_outlined),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_outlined),
            label: 'Products',
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewScreen() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        children: const [
          StatCard(
            title: 'Orders',
            value: '1,240',
            icon: Icons.shopping_bag_outlined,
          ),
          StatCard(
            title: 'Revenue',
            value: '₱24.6K',
            icon: Icons.attach_money_rounded,
          ),
          StatCard(
            title: 'Delivery',
            value: '96%',
            icon: Icons.local_shipping_outlined,
          ),
          StatCard(
            title: 'Customers',
            value: '8.4K',
            icon: Icons.people_alt_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersScreen() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: AppDatabase.orders.length,
      itemBuilder: (context, index) {
        final order = AppDatabase.orders[index];
        final user = AppDatabase.users.firstWhere(
          (u) => u.id == order.userId,
          orElse: () => AppDatabase.users.first,
        );
        return Card(
          child: ListTile(
            title: Text('Order #${order.id}'),
            subtitle: Text('${user.name} - ${user.email}'),
            trailing: Chip(
              label: Text(order.status),
              backgroundColor: order.status == 'Delivered'
                  ? const Color(0xFFE8F5E9)
                  : const Color(0xFFFFF3E0),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProductsScreen() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: AppDatabase.products.length,
      itemBuilder: (context, index) {
        final product = AppDatabase.products[index];
        return Card(
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                product.imageUrl,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(product.name),
            subtitle: Text('${product.packLabel} - ₱${product.price}'),
            trailing: const Icon(Icons.edit),
          ),
        );
      },
    );
  }
}

class StatCard extends StatelessWidget {
  const StatCard({
    required this.title,
    required this.value,
    required this.icon,
    super.key,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE5CC),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppTheme.primary),
            ),
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(color: AppTheme.muted)),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
