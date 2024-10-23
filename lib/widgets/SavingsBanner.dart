import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavingsBanner extends StatelessWidget {
  const SavingsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF008800),
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Text(
          'You will save Rs.5000 on this plan',
          style: GoogleFonts.rubik(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
