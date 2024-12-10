import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class UpiPaymentPage extends StatelessWidget {
  final String upiId = "funwithmetamil-1@okhdfcbank"; // Set your UPI ID here
  final String name = "FreeSkill Testing"; // Recipient's name
  final String transactionNote = "Payment for services (testing)"; // Note for the transaction
  final String amount = "1.00"; // Amount to be paid

  Future<void> openUpiApp() async {
    final upiUrl = Uri(
      scheme: "upi",
      host: "pay",
      queryParameters: {
        "pa": upiId, // Payee Address (UPI ID)
        "pn": name, // Payee Name
        "tn": transactionNote, // Transaction Note
        "am": amount, // Amount
        "cu": "INR", // Currency (INR for Indian Rupee)
      },
    );

    if (await canLaunchUrl(upiUrl)) {
      await launchUrl(upiUrl, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $upiUrl";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Payment Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: openUpiApp,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // Google Pay button background
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [

              Text(
                "Pay via ",
                style: TextStyle(
                  color: Colors.white, // Text color for contrast
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ), const SizedBox(width: 8),
              Image.asset(
                'assets/icon/gpay.png', // Add Google Pay logo in assets
                height: 44,
              ),

            ],
          ),
        ),
      ),
    );
  }
}