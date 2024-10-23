import 'package:equatable/equatable.dart';

abstract class PricingEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPricing extends PricingEvent {
  final String pkgName;

  FetchPricing(this.pkgName);

  @override
  List<Object> get props => [pkgName];
}
