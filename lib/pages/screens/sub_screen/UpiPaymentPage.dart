import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class UpiPaymentPage extends StatelessWidget {
  final String upiId = "funwithmetamil-1@okhdfcbank"; // Set your UPI ID here
  final String name = "FreeSkill Testing"; // Recipient's name
  final String transactionNote = "Payment for services (testing)"; // Note for the transaction
  final String amount = "1.00"; // Amount to be paid

  Future<void> openUpiApp(BuildContext context) async {
    // Construct the UPI URL with single encoding
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

    try {
      if (await canLaunchUrl(upiUrl)) {
        await launchUrl(upiUrl, mode: LaunchMode.externalApplication);
      } else {
        // Handle the case when UPI apps are not installed or the link cannot be launched
        throw "Could not launch the UPI payment app. Please make sure a UPI app (like Google Pay, PhonePe) is installed.";
      }
    } catch (e) {
      // Catch any errors and show an alert
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
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
          onPressed: () => openUpiApp(context), // Pass BuildContext here
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
              ),
              const SizedBox(width: 8),
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
