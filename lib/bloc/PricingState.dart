// pricing_state.dart
import 'package:equatable/equatable.dart';

class PricingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PricingInitial extends PricingState {}

class PricingLoading extends PricingState {}

class PricingLoaded extends PricingState {
  final List<String> pricingOptions;

  PricingLoaded(this.pricingOptions);

  @override
  List<Object?> get props => [pricingOptions];
}

class PricingError extends PricingState {
  final String message;

  PricingError(this.message);

  @override
  List<Object?> get props => [message];
}
