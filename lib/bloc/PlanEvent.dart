abstract class PlanEvent {}

class PlanSelected extends PlanEvent {
  final String pkgName;
  final String? selectedPlan;

  PlanSelected({required this.pkgName, required this.selectedPlan});
}

class ResetPlans extends PlanEvent {}
