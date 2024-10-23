import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProceedButton extends StatelessWidget {
  final int totalPrice;
  final bool isDiscounted;
  final int discountedAmount;

  const ProceedButton(
      {super.key,
      required this.totalPrice,
      required this.discountedAmount,
      required this.isDiscounted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
          width: double.infinity,
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      isDiscounted
                          ? Text(
                              "Rs. $totalPrice",
                              style: GoogleFonts.rubik(
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            )
                          : Text(
                              "Rs. $totalPrice",
                              style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                      const SizedBox(
                        width: 10,
                      ),
                      isDiscounted
                          ? Text(
                              "Rs. $discountedAmount",
                              style: GoogleFonts.rubik(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  Text(
                    "Inclusive GST",
                    style: GoogleFonts.rubik(
                        color: const Color(0xFF979797),
                        fontWeight: FontWeight.normal,
                        fontSize: 13),
                  ),
                ],
              ),
              SizedBox(
                width: isDiscounted ? 15 : 50,
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: const Color(0xFF19378f),
                  ),
                  child: Center(
                    child: Text(
                      "Proceed For Payment",
                      style: GoogleFonts.rubik(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ))
            ],
          )),
    );
  }
}
