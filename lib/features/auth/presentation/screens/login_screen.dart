import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netsanet/core/router/route_names.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const Color primaryPurple = Color(0xFF8E2DE2);

  bool isClient = true;
  String demoUser = 'Client';

  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  /// SAMPLE DEMO DATA
  final Map<String, Map<String, String>> demoAccounts = {
    'Client': {'phone': '911234567', 'password': 'client123'},
    'Provider': {'phone': '922345678', 'password': 'provider123'},
  };

  void _login() {
    final phone = phoneCtrl.text.trim();
    final password = passCtrl.text.trim();

    final demo = demoAccounts[demoUser]!;

    if (phone == demo['phone'] && password == demo['password']) {
      context.go(
        demoUser == 'Client' ? RouteName.clientHome : RouteName.providerHome,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid demo credentials'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 60),

              /// Logo
              Container(
                padding: const EdgeInsets.all(18),
                decoration: _boxDecoration(),
                child: Column(
                  children: const [
                    Icon(Icons.auto_awesome, size: 42, color: primaryPurple),
                    SizedBox(height: 8),
                    Text(
                      'Netsanet',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              const Text(
                'Connecting women, empowering\ncommunities.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),

              const SizedBox(height: 28),

              /// Client / Provider Toggle
              Container(
                height: 46,
                padding: const EdgeInsets.all(4),
                decoration: _boxDecoration(),
                child: Row(
                  children: [
                    _roleTab('Client', isClient),
                    _roleTab('Provider', !isClient),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              _label('Mobile Number'),
              Row(
                children: [
                  _prefixBox('+251'),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _inputField(
                      controller: phoneCtrl,
                      hint: '911 234 567',
                      icon: Icons.phone_android,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              _label('Password'),
              _inputField(
                controller: passCtrl,
                hint: '••••••••',
                icon: Icons.visibility_outlined,
                obscure: true,
              ),

              const SizedBox(height: 16),

              /// Demo User Dropdown
              _label('Demo User'),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: _boxDecoration(),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: demoUser,
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem(
                        value: 'Client',
                        child: Text('Demo Client'),
                      ),
                      DropdownMenuItem(
                        value: 'Provider',
                        child: Text('Demo Provider'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        demoUser = value!;
                        isClient = demoUser == 'Client';

                        /// Auto-fill sample data
                        phoneCtrl.text = demoAccounts[value]!['phone']!;
                        passCtrl.text = demoAccounts[value]!['password']!;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// Login Button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Log In  →',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  children: [
                    TextSpan(text: 'New to Netsanet? '),
                    TextSpan(
                      text: 'Create Account',
                      style: TextStyle(
                        color: primaryPurple,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  /// Widgets
  Widget _roleTab(String text, bool active) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isClient = text == 'Client';
            demoUser = text;

            phoneCtrl.text = demoAccounts[text]!['phone']!;
            passCtrl.text = demoAccounts[text]!['password']!;
          });
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active ? primaryPurple : Colors.transparent,
            borderRadius: BorderRadius.circular(26),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: active ? Colors.white : Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  static Widget _label(String text) => Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    ),
  );

  Widget _inputField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscure = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      decoration: _boxDecoration(),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: Icon(icon, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),
    );
  }

  static Widget _prefixBox(String text) => Container(
    height: 52,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    alignment: Alignment.center,
    decoration: _boxDecoration(),
    child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
  );

  static BoxDecoration _boxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );
}
