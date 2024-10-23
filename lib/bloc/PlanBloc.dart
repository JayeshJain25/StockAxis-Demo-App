import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuftipro_kyc/bloc/PlanEvent.dart';
import 'package:shuftipro_kyc/bloc/PlanState.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  int totalAmount = 0;
  int discountedAmount = 0;
  Map<String, String?> selectedPlans = {
    "LM": null,
    "EML": null,
    "LCF": null,
  };

  PlanBloc() : super(PlanInitial()) {
    on<PlanSelected>(_onPlanSelected);
    on<ResetPlans>(_onResetPlans);
  }

  void _onPlanSelected(PlanSelected event, Emitter<PlanState> emit) {
    String? selectedPlan = event.selectedPlan;
    String pkgName = event.pkgName;

    if (selectedPlan != null &&
        selectedPlan != "Select a Plan (inclusive of GST)") {
      int selectedAmount = int.parse(selectedPlan.split("-")[1].trim());

      // Subtract the previous selected plan amount for the same package
      if (selectedPlans[pkgName] != null &&
          selectedPlans[pkgName] != "Select a Plan (inclusive of GST)") {
        int prevAmount =
            int.parse(selectedPlans[pkgName]!.split("-")[1].trim());
        totalAmount -= prevAmount;
      }

      // Add the new amount for the selected plan
      totalAmount += selectedAmount;
      selectedPlans[pkgName] = selectedPlan;
    } else {
      // Deselect plan: Reset to "Select a Plan" and subtract the previous amount
      if (selectedPlans[pkgName] != null &&
          selectedPlans[pkgName] != "Select a Plan (inclusive of GST)") {
        int prevAmount =
            int.parse(selectedPlans[pkgName]!.split("-")[1].trim());
        totalAmount -= prevAmount;
      }
      selectedPlans[pkgName] = "Select a Plan (inclusive of GST)";
    }

    // Only count valid selected plans (exclude null and default option)
    int selectedCount = selectedPlans.values
        .where((value) =>
            value != null && value != "Select a Plan (inclusive of GST)")
        .length;

    // Apply discount if 2 or more products are selected
    if (selectedCount >= 2) {
      discountedAmount = (totalAmount * 0.80).round();
    } else {
      discountedAmount = totalAmount; // No discount
    }

    emit(PlanUpdated(totalAmount, discountedAmount, Map.from(selectedPlans)));
  }

  void _onResetPlans(ResetPlans event, Emitter<PlanState> emit) {
    totalAmount = 0;
    discountedAmount = 0;
    selectedPlans = {
      "LM": "Select a Plan (inclusive of GST)",
      "EML": "Select a Plan (inclusive of GST)",
      "LCF": "Select a Plan (inclusive of GST)",
    };
    emit(PlanUpdated(totalAmount, discountedAmount, Map.from(selectedPlans)));
  }
}
