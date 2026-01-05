import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _agreed = false;
  String? _selectedService;

  static const Color primaryPurple = Color(0xFF6A11CB);

  final List<String> _services = [
    'Plumber',
    'Electrician',
    'Cleaner',
    'Carpenter',
    'Painter',
    'Hair Stylist',
    'Tutor',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Create Account',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),

                /// Progress
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _progressDot(true),
                      const SizedBox(width: 6),
                      _progressDot(false),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                /// Title
                const Text(
                  'Join as a',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                ),
                const Text(
                  'Service Provider',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Connect with local clients and grow your business today.',
                  style: TextStyle(fontSize: 14.5, color: Colors.black54),
                ),

                const SizedBox(height: 32),

                /// Full Name
                _label('Full Name'),
                _inputField(
                  hint: 'e.g. Abeba Kebede',
                  icon: Icons.person_outline,
                ),

                const SizedBox(height: 20),

                /// Phone
                _label('Phone Number'),
                Row(
                  children: [
                    _prefixBox('+251'),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _inputField(
                        hint: '911 234 567',
                        icon: Icons.phone_android,
                        keyboard: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  "We'll send a verification code to this number.",
                  style: TextStyle(fontSize: 12.5, color: Colors.black45),
                ),

                const SizedBox(height: 20),

                /// Service Type
                _label('Service Type'),
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: _boxDecoration(),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: _selectedService,
                      hint: const Text(
                        'Select your service',
                        style: TextStyle(color: Colors.black54),
                      ),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: _services
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() => _selectedService = value);
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// City
                _label('City / Area'),
                _inputField(
                  hint: 'Addis Ababa, Bole',
                  icon: Icons.location_on_outlined,
                  iconColor: primaryPurple,
                ),

                const SizedBox(height: 10),

                /// Location
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: const [
                      Icon(Icons.my_location, size: 16, color: primaryPurple),
                      SizedBox(width: 6),
                      Text(
                        'Use current location',
                        style: TextStyle(
                          color: primaryPurple,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 26),

                /// Terms
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _agreed,
                      activeColor: primaryPurple,
                      onChanged: (v) => setState(() => _agreed = v ?? false),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 13.5,
                              color: Colors.black54,
                            ),
                            children: [
                              TextSpan(text: 'I agree to the '),
                              TextSpan(
                                text: 'Terms of Service',
                                style: TextStyle(
                                  color: primaryPurple,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(text: ' and '),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  color: primaryPurple,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                /// Button
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: _agreed ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryPurple,
                      disabledBackgroundColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      'Register Now',
                      style: TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// Login
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                      children: [
                        const TextSpan(text: 'Already have an account? '),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () => context.go('/login'),
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                color: primaryPurple,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Widgets

  static Widget _progressDot(bool active) {
    return Container(
      width: 22,
      height: 4,
      decoration: BoxDecoration(
        color: active ? primaryPurple : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  static Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 14.5, fontWeight: FontWeight.w600),
    );
  }

  Widget _inputField({
    required String hint,
    required IconData icon,
    Color iconColor = Colors.grey,
    TextInputType keyboard = TextInputType.text,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      decoration: _boxDecoration(),
      child: TextFormField(
        keyboardType: keyboard,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: Icon(icon, color: iconColor),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),
    );
  }

  static Widget _prefixBox(String text) {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      decoration: _boxDecoration(),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }

  static BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}
