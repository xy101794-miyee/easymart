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
    ),
    User(
      id: 'admin1',
      name: 'Admin User',
      email: 'admin@easymart.app',
      password: '123456',
      role: 'admin',
    ),
  ];

  static User? currentUser;

  static const List<Product> products = [
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
  ];

  static final List<CartItem> cartItems = [];
  static final List<Order> orders = [
    Order(
      id: 'ord1',
      userId: 'u1',
      items: [],
      totalAmount: 450.00,
      status: 'Delivered',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Order(
      id: 'ord2',
      userId: 'u1',
      items: [],
      totalAmount: 320.00,
      status: 'Pending',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

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
    } catch (e) {
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

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
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
  final String status;
  final DateTime createdAt;

  Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalAmount,
    required this.status,
    required this.createdAt,
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
  static const Color primary = Color(0xFF1EBB68);
  static const Color primaryDark = Color(0xFF138F53);
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAFBF3),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Icon(
                  Icons.local_grocery_store_rounded,
                  size: 52,
                  color: AppTheme.primary,
                ),
              ),
              const SizedBox(height: 22),
              const Text(
                'Welcome to EasyMart',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Fresh groceries delivered to your home',
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.muted,
                ),
              ),
              const SizedBox(height: 24),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EasyMart'),
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
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: const LinearGradient(
              colors: [AppTheme.primary, Color(0xFF149F62)],
            ),
          ),
          child: const Row(
            children: [
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
        const SizedBox(height: 16),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: AppDatabase.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.72,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
            ),
            itemBuilder: (context, index) {
              final product = AppDatabase.products[index];
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          const SizedBox(height: 32),
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
            if (order.status == 'Pending')
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const OrderTrackingScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.location_on_outlined),
                  label: const Text('Track Order'),
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
  const OrderTrackingScreen({super.key});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  static const LatLng _center = LatLng(14.5995, 120.9842);

  final Map<MarkerId, Marker> _markers = {
    const MarkerId('driver'): const Marker(
      markerId: MarkerId('driver'),
      position: LatLng(14.5986, 120.9842),
      infoWindow: InfoWindow(title: 'Driver'),
    ),
    const MarkerId('customer'): const Marker(
      markerId: MarkerId('customer'),
      position: LatLng(14.6010, 120.9809),
      infoWindow: InfoWindow(title: 'Your place'),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Track delivery')),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ETA to your address',
                      style: TextStyle(fontSize: 16, color: AppTheme.muted),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '18 minutes',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.directions_car_filled,
                  size: 38,
                  color: AppTheme.primary,
                ),
              ],
            ),
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: _center,
                zoom: 13.5,
              ),
              markers: _markers.values.toSet(),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery progress',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                SizedBox(height: 12),
                LinearProgressIndicator(
                  value: 0.66,
                  backgroundColor: Color(0xFFE5E7EB),
                  valueColor: AlwaysStoppedAnimation(AppTheme.primary),
                ),
                SizedBox(height: 10),
                Text(
                  'Driver is on the way. 18 minutes remaining.',
                  style: TextStyle(color: AppTheme.muted),
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
                color: const Color(0xFFEAFBF3),
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
