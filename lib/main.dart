import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuftipro_kyc/bloc/PlanBloc.dart';
import 'package:shuftipro_kyc/screens/pricing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StockAxis Demo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (_) => PlanBloc(),
        ),
      ], child: const PricingPage()),
    );
  }
}
