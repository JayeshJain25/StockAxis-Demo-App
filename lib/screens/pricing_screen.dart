import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shuftipro_kyc/bloc/PlanBloc.dart';
import 'package:shuftipro_kyc/bloc/PlanState.dart';
import 'package:shuftipro_kyc/widgets/PricingCard.dart';
import 'package:shuftipro_kyc/widgets/ProceedButton.dart';
import 'package:shuftipro_kyc/widgets/SavingsBanner.dart';

class PricingPage extends StatelessWidget {
  const PricingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf6f7fb),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Pricing',
          style: GoogleFonts.rubik(),
        ),
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_rounded)),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.support_agent_rounded))
        ],
      ),
      bottomNavigationBar: BlocBuilder<PlanBloc, PlanState>(
        builder: (context, state) {
          if (state is PlanUpdated) {
            if (state.discountedAmount != state.totalAmount) {
              return ProceedButton(
                totalPrice: state.totalAmount,
                isDiscounted: true,
                discountedAmount: state.discountedAmount,
              );
            }
            return ProceedButton(
              totalPrice: state.totalAmount,
              isDiscounted: false,
              discountedAmount: 0,
            );
          }
          return const ProceedButton(
            totalPrice: 0,
            isDiscounted: false,
            discountedAmount: 0,
          );
        },
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SavingsBanner(),
            PricingCard(
              title: 'Little Masters',
              subtitle: 'Small cap',
              description:
                  'Invest in up-trending Smallcap stocks screened through MILARS strategy to generate wealth.',
              options: 'LM',
              icons: Icons.diamond_rounded,
            ),
            PricingCard(
              title: 'Emerging Market Leaders',
              subtitle: 'Mid cap',
              description:
                  'Generate wealth by riding momentum in Midcap stocks screened through MILARS strategy.',
              options: 'EML',
              icons: Icons.money_rounded,
            ),
            PricingCard(
              title: 'Large Cap Focus',
              subtitle: 'Large cap',
              description:
                  'Achieve stable growth in your portfolio by investing in Bluechip stocks through MILARS strategy.',
              options: 'LCF',
              icons: Icons.attach_money_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
