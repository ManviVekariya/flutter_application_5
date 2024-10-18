import 'package:flutter/material.dart';

class OrderSummaryPage extends StatefulWidget {
  @override
  _OrderSummaryPageState createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  String? _selectedPaymentMethod; // To track selected radio button
  bool _saveCardDetails = false; // To track the checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Summary'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('₹200'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Taxes', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('₹20'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Delivery fees',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('₹20'),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total:',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text('₹240', style: TextStyle(fontSize: 18)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Estimated delivery time:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('15-30 mins'),
              ],
            ),

            // Payment Methods
            SizedBox(height: 20),
            Text('Payment methods',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            // Credit card payment option
            Row(
              children: [
                Image.asset('assets/', width: 30),
                SizedBox(width: 10),
                Text('Credit card'),
                SizedBox(width: 10),
                Text('51050505'),
                Spacer(),
                Radio<String>(
                  value: 'credit_card',
                  groupValue: _selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentMethod = value;
                    });
                  },
                ),
              ],
            ),

            // Debit card payment option
            Row(
              children: [
                Image.asset('assets/', width: 30),
                SizedBox(width: 10),
                Text('Debit card'),
                SizedBox(width: 10),
                Text('3566***** 0505'),
                Spacer(),
                Radio<String>(
                  value: 'debit_card',
                  groupValue: _selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentMethod = value;
                    });
                  },
                ),
              ],
            ),

            // Save card details checkbox
            Row(
              children: [
                Checkbox(
                  value: _saveCardDetails,
                  onChanged: (bool? value) {
                    setState(() {
                      _saveCardDetails = value ?? false;
                    });
                  },
                ),
                Text('Save card details for future payments'),
              ],
            ),

            // Pay Now Button
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle payment button click
                if (_selectedPaymentMethod == null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please select a payment method')));
                } else {
                  // Proceed with payment logic
                  print('Paying with $_selectedPaymentMethod');
                }
              },
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}
