import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shuftipro_kyc/bloc/PlanBloc.dart';
import 'package:shuftipro_kyc/bloc/PlanEvent.dart';
import 'package:shuftipro_kyc/bloc/PlanState.dart';
import 'package:shuftipro_kyc/bloc/PricingBloc.dart';
import 'package:shuftipro_kyc/bloc/PricingEvent.dart';
import 'package:shuftipro_kyc/bloc/PricingState.dart';

class PricingDropdown extends StatelessWidget {
  final String pkgName;

  const PricingDropdown({super.key, required this.pkgName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PricingBloc()..add(FetchPricing(pkgName)),
      child: BlocBuilder<PricingBloc, PricingState>(
        builder: (context, state) {
          if (state is PricingLoading) {
            return const CircularProgressIndicator();
          } else if (state is PricingLoaded) {
            return DropdownButtonFormField<String>(
              value: BlocProvider.of<PlanBloc>(context).state is PlanUpdated
                  ? (BlocProvider.of<PlanBloc>(context).state as PlanUpdated).selectedPlans[pkgName]
                  : null,
              hint: Text(
                'Select a Plan (inclusive of GST)',
                style: GoogleFonts.rubik(),
              ),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                suffixIconColor: const Color(0xFF3372b4),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Color(0xFF478858),
                    width: 2.0,
                  ),
                ),
              ),
              onChanged: (value) {
                BlocProvider.of<PlanBloc>(context).add(
                  PlanSelected(pkgName: pkgName, selectedPlan: value),
                );
              },
              items: state.pricingOptions
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: GoogleFonts.rubik(),
                  ),
                );
              }).toList(),
            );
          } else if (state is PricingError) {
            return Text('Error: ${state.message}');
          }
          return Container();
        },
      ),
    );
  }
}
