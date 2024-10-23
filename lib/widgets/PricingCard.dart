import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shuftipro_kyc/widgets/PricingDropdown.dart';

class PricingCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String options;
  final IconData icons;

  const PricingCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.options,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      icons,
                      color: const Color(0xFFe0b18c),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: GoogleFonts.rubik(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(subtitle,
                            style: const TextStyle(
                              fontSize: 13,
                            )),
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.info_outline_rounded,
                  color: Color(0xFFb8b8b8),
                ),
              ],
            ),
            const Divider(
              color: Color(0xFFdfdfdf),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: GoogleFonts.rubik(),
            ),
            const SizedBox(height: 16),
            PricingDropdown(pkgName: options),
          ],
        ),
      ),
    );
  }
}

// class PlanDropdown extends StatefulWidget {
//   final List<String> options;

//   const PlanDropdown({super.key, required this.options});

//   @override
//   _PlanDropdownState createState() => _PlanDropdownState();
// }

// class _PlanDropdownState extends State<PlanDropdown> {
//   String? selectedPlan;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: selectedPlan,
//       hint: const Text('Select a Plan (inclusive of GST)'),
//       onChanged: (value) {
//         setState(() {
//           selectedPlan = value!;
//         });
//         if (value!.contains('12 Months')) {
//           BlocProvider.of<PlanBloc>(context)
//               .add(const PlanSelected('12 Months'));
//         } else {
//           BlocProvider.of<PlanBloc>(context)
//               .add(const PlanSelected('6 Months'));
//         }
//       },
//       items: widget.options
//           .map((plan) => DropdownMenuItem(
//                 value: plan,
//                 child: Text(plan),
//               ))
//           .toList(),
//     );
//   }
// }
