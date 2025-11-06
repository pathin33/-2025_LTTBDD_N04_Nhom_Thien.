import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      appBar: AppBar(
        title: Text(tr('help.title')),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        children: [
          sectionTitle(tr('help.usage_guide_section')),
          infoTile(
            context,
            icon: CupertinoIcons.book_solid,
            iconColor: const Color(0xFF007AFF),
            title: tr('help.create_deck'),
            subtitle: tr('help.create_deck_desc'),
          ),
          infoTile(
            context,
            icon: CupertinoIcons.arrow_2_circlepath,
            iconColor: const Color(0xFF34C759),
            title: tr('help.study_cards'),
            subtitle: tr('help.study_cards_desc'),
          ),
          infoTile(
            context,
            icon: CupertinoIcons.chart_bar_square_fill,
            iconColor: const Color(0xFFFF9500),
            title: tr('help.track_progress'),
            subtitle: tr('help.track_progress_desc'),
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          sectionTitle(tr('help.contact_feedback_section')),
          infoTile(
            context,
            icon: CupertinoIcons.mail_solid,
            iconColor: const Color(0xFF5856D6),
            title: tr('help.send_feedback'),
            subtitle: tr('help.send_feedback_desc'),
            trailing: const Icon(CupertinoIcons.arrow_up_right, size: 18),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(tr('help.email_coming_soon'))),
              );
            },
          ),
          infoTile(
            context,
            icon: CupertinoIcons.info_circle_fill,
            iconColor: const Color(0xFF8E8E93),
            title: tr('help.about_app'),
            subtitle: tr('help.version'),
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Center(
            child: Text(
              tr('help.thank_you'),
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        ],
      ),
    );
  }

  // Tieu de
  Widget sectionTitle(String text) => Padding(
        padding: const EdgeInsets.only(left: 4, bottom: 6, top: 12),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
      );

  Widget infoTile(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
    Widget? trailing,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: iconColor, size: 22),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 14, height: 1.3),
        ),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}