import 'package:flutter/material.dart';

class Fee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Fee',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Color(0xff1b9bda), // Updated color
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff1b9bda).withOpacity(0.9), // Updated color
                            Colors.white.withOpacity(0.6),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 19),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fee Details',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20),
                          FeeDetailRow(
                            label: "Total Fee:",
                            value: "280,00",
                          ),
                          SizedBox(height: 20),
                          FeeDetailRow(
                            label: "Due Date:",
                            value: "30th August 2024",
                          ),
                          SizedBox(height: 20),
                          FeeDetailRow(
                            label: "Status:",
                            value: "Unpaid",
                            valueColor: Colors.red,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Pay using:",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20),
                          PaymentButton(
                            label: "JazzCash",
                            onPressed: () {
                              // Implement JazzCash payment functionality here
                            },
                          ),
                          SizedBox(height: 20),
                          PaymentButton(
                            label: "EasyPaisa",
                            onPressed: () {
                              // Implement EasyPaisa payment functionality here
                            },
                          ),
                          SizedBox(height: 20),
                          PaymentButton(
                            label: "Bank Account",
                            onPressed: () {
                              // Implement Bank Account payment functionality here
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeeDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;

  FeeDetailRow({required this.label, required this.value, this.valueColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 18, color: valueColor),
        ),
      ],
    );
  }
}

class PaymentButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  PaymentButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xff1b9bda), // Updated color
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        textStyle: TextStyle(fontSize: 20),
      ),
      child: Text(label),
    );
  }
}
