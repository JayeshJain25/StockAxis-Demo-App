import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:shuftipro_kyc/bloc/PricingEvent.dart';
import 'package:shuftipro_kyc/bloc/PricingState.dart';

class PricingBloc extends Bloc<PricingEvent, PricingState> {
  final Dio dio = Dio();

  PricingBloc() : super(PricingInitial()) {
    on<FetchPricing>(_onFetchPricing);
  }

  Future<void> _onFetchPricing(
      FetchPricing event, Emitter<PricingState> emit) async {
    emit(PricingLoading());
    try {
      final response = await dio.get(
          'https://www.stockaxis.com/webservices/android/index.aspx',
          queryParameters: {
            'action': 'search',
            'activity': 'PricingV2',
            'CID': '984493',
            'PKGName': event.pkgName,
          });
      if (response.statusCode == 200) {
        List<String> pricingOptions = ["Select a Plan (inclusive of GST)"];

        String responseBody = response.data.toString().split("<!DOCTYPE")[0];

        var decodedData = jsonDecode(responseBody);
        List<dynamic> pricingData = decodedData['data'];
        for (var plan in pricingData) {
          pricingOptions.add("${plan["PDescription"]} -  ${plan["PAmount"]}");
        }

        emit(PricingLoaded(pricingOptions));
      } else {
        emit(PricingError('Failed to fetch pricing'));
      }
    } catch (e) {
      emit(PricingError(e.toString()));
    }
  }
}
