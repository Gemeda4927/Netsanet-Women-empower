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
    const primaryPurple = Color(0xFF7B2CBF);
    final screenWidth = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(
      context,
    ).textScaleFactor.clamp(0.85, 1.15); // slightly smaller

    final texts = isAmharic
        ? {
            'welcomeTitle': 'እንኳን ወደ ቴና በደህና መጡ',
            'welcomeSubtitle':
                'በየቀኑ ህይወትዎን የተሻለ ለማድረግ አማካሪ አገልግሎቶችን ከአካባቢዎ ጋር ያገናኙ።',
            'findHelp': 'አሁን እርዳታ ይፈልጉ',
            'becomeProvider': 'አቅራቢ ይሁኑ',
            'feature1Title': 'የተረጋገጡ አቅራቢዎች',
            'feature1Desc': 'የእርስዎ ደህንነት ቅድሚያ የሚሰጠው።',
            'feature2Title': 'ሴቶችን ማብረት',
            'feature2Desc': 'በኢትዮጵያ ውስጥ የአካባቢ እድገትን መደገፍ።',
            'feature3Title': 'ማህበረሰብ',
            'feature3Desc': 'ጠንካራ አውታረ መረብ መገንባት።',
          }
        : {
            'welcomeTitle': 'Welcome to Tena',
            'welcomeSubtitle':
                'Connecting you with trusted local services for a better everyday life.',
            'findHelp': 'Find Help Now',
            'becomeProvider': 'Become a Provider',
            'feature1Title': 'Verified Providers',
            'feature1Desc': 'Safety first for your peace of mind.',
            'feature2Title': 'Empowering Women',
            'feature2Desc': 'Supporting local growth in Ethiopia.',
            'feature3Title': 'Community',
            'feature3Desc': 'Building a stronger network.',
          };

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth > 600 ? 40 : 20, // reduced padding
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header with Logo & Language Toggle
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 38, // smaller
                          height: 38,
                          decoration: BoxDecoration(
                            color: primaryPurple,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: primaryPurple.withOpacity(0.3),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'T',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24, // smaller
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Tena',
                          style: TextStyle(
                            fontSize: 24 * textScale, // smaller
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
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF6E44FF),
                              Color(0xFFB15EFF),
                              Color(0xFF7B2CBF),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [
                            BoxShadow(
                              color: primaryPurple.withOpacity(0.3),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              isAmharic ? 'አማ' : 'Eng',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              isAmharic ? ' / Eng' : ' / አማ',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white70,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Image
                AnimatedOpacity(
                  opacity: 1,
                  duration: const Duration(milliseconds: 1200),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: double.infinity,
                      height: screenWidth > 500 ? 320 : 240, // smaller image
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                // Title & Subtitle
                Text(
                  texts['welcomeTitle']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28 * textScale, // smaller
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  texts['welcomeSubtitle']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.5 * textScale, // smaller
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 36),
                // Features
                _FeatureCard(
                  icon: Icons.verified_user_outlined,
                  title: texts['feature1Title']!,
                  description: texts['feature1Desc']!,
                  iconColor: primaryPurple,
                ),
                const SizedBox(height: 12),
                _FeatureCard(
                  icon: Icons.trending_up,
                  title: texts['feature2Title']!,
                  description: texts['feature2Desc']!,
                  iconColor: Colors.teal,
                ),
                const SizedBox(height: 12),
                _FeatureCard(
                  icon: Icons.groups,
                  title: texts['feature3Title']!,
                  description: texts['feature3Desc']!,
                  iconColor: Colors.orangeAccent,
                ),
                const SizedBox(height: 48),
                // Buttons
                SizedBox(
                  width: double.infinity,
                  height: 50, // smaller
                  child: ElevatedButton(
                    onPressed: () => context.go(RouteName.login),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      elevation: 2,
                      shadowColor: primaryPurple.withOpacity(0.4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          texts['findHelp']!,
                          style: TextStyle(
                            fontSize: 15 * textScale,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.search, size: 20),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 50, // smaller
                  child: OutlinedButton(
                    onPressed: () => context.go(RouteName.createAccount),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryPurple,
                      side: const BorderSide(color: primaryPurple, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: Text(
                      texts['becomeProvider']!,
                      style: TextStyle(
                        fontSize: 15 * textScale,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                Text(
                  '© 2026 Tena • v1.0.0',
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
                const SizedBox(height: 20),
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5EFFF),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE0D4FF), width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 26),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
