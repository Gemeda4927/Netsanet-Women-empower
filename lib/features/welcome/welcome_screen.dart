import 'package:flutter/material.dart';
import '../../../../core/router/route_names.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isAmharic = false;

  @override
  Widget build(BuildContext context) {
    const Color primaryPurple = Color(0xFF7B2CBF);
    final screenWidth = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor.clamp(0.9, 1.2);

    final welcomeTitle = isAmharic ? 'እንኳን ወደ ቴና በደህና መጡ' : 'Welcome to Tena';
    final welcomeSubtitle = isAmharic
        ? 'በየቀኑ ህይወትዎን የተሻለ ለማድረግ አማካሪ አገልግሎቶችን ከአካባቢዎ ጋር ያገናኙ።'
        : 'Connecting you with trusted local services for a better everyday life.';

    final findHelpText = isAmharic ? 'አሁን እርዳታ ይፈልጉ' : 'Find Help Now';
    final becomeProviderText = isAmharic ? 'አቅራቢ ይሁኑ' : 'Become a Provider';

    final feature1Title = isAmharic ? 'የተረጋገጡ አቅራቢዎች' : 'Verified Providers';
    final feature1Desc = isAmharic
        ? 'የእርስዎ ደህንነት ቅድሚያ የሚሰጠው።'
        : 'Safety first for your peace of mind.';

    final feature2Title = isAmharic ? 'ሴቶችን ማብረት' : 'Empowering Women';
    final feature2Desc = isAmharic
        ? 'በኢትዮጵያ ውስጥ የአካባቢ እድገትን መደገፍ።'
        : 'Supporting local growth in Ethiopia.';

    final feature3Title = isAmharic ? 'ማህበረሰብ' : 'Community';
    final feature3Desc = isAmharic
        ? 'ጠንካራ አውታረ መረብ መገንባት።'
        : 'Building a stronger network.';

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth > 600 ? 48 : 24,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: primaryPurple,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: primaryPurple.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'T',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Tena',
                          style: TextStyle(
                            fontSize: 28 * textScale,
                            fontWeight: FontWeight.bold,
                            color: primaryPurple,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => setState(() => isAmharic = !isAmharic),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF6E44FF),
                              Color(0xFFB15EFF),
                              Color(0xFF7B2CBF),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: primaryPurple.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              isAmharic ? 'አማ' : 'Eng',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              isAmharic ? ' / Eng' : ' / አማ',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white70,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                AnimatedOpacity(
                  opacity: 1.0,
                  duration: const Duration(milliseconds: 1200),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: double.infinity,
                      height: screenWidth > 500 ? 360 : 280,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  welcomeTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 34 * textScale,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  welcomeSubtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.5 * textScale,
                    color: Colors.grey[700],
                    height: 1.55,
                  ),
                ),
                const SizedBox(height: 48),
                _FeatureCard(
                  icon: Icons.verified_user_outlined,
                  title: feature1Title,
                  description: feature1Desc,
                  iconColor: primaryPurple,
                ),
                const SizedBox(height: 16),
                _FeatureCard(
                  icon: Icons.trending_up,
                  title: feature2Title,
                  description: feature2Desc,
                  iconColor: Colors.teal,
                ),
                const SizedBox(height: 16),
                _FeatureCard(
                  icon: Icons.groups,
                  title: feature3Title,
                  description: feature3Desc,
                  iconColor: Colors.orangeAccent,
                ),
                const SizedBox(height: 60),
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () => context.go(RouteName.login),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 2,
                      shadowColor: primaryPurple.withOpacity(0.4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          findHelpText,
                          style: TextStyle(
                            fontSize: 17 * textScale,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.search, size: 22),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: OutlinedButton(
                    onPressed: () => context.go(RouteName.createAccount),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryPurple,
                      side: const BorderSide(color: primaryPurple, width: 2.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      becomeProviderText,
                      style: TextStyle(
                        fontSize: 17 * textScale,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                Text(
                  '© 2026 Tena • v1.0.0',
                  style: TextStyle(color: Colors.grey[500], fontSize: 13),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color iconColor;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF5EFFF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0D4FF), width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
