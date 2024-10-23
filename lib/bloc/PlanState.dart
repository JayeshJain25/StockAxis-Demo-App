abstract class PlanState {}

class PlanInitial extends PlanState {}

class PlanUpdated extends PlanState {
  final int totalAmount;
  final int discountedAmount;
  final Map<String, String?> selectedPlans;

  PlanUpdated(this.totalAmount, this.discountedAmount, this.selectedPlans);
}
