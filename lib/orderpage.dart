import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  // Sample list of orders
  final List<Map<String, String>> orders = [
    {
      "orderId": "#001",
      "customer": "John Doe",
      "status": "Delivered",
      "total": "\$15.99",
      "date": "Sep 28, 2024"
    },
    {
      "orderId": "#002",
      "customer": "Jane Smith",
      "status": "Pending",
      "total": "\$22.49",
      "date": "Sep 29, 2024"
    },
    {
      "orderId": "#003",
      "customer": "Michael Brown",
      "status": "Preparing",
      "total": "\$18.75",
      "date": "Sep 30, 2024"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Orders",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return _buildOrderCard(order, context);
          },
        ),
      ),
    );
  }

  // Widget to build each order card
  Widget _buildOrderCard(Map<String, String> order, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order ID: ${order['orderId']}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  order['date']!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Customer: ${order['customer']}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Status: ${order['status']}",
              style: TextStyle(
                fontSize: 16,
                color: _getStatusColor(order['status']!),
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Total: ${order['total']}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action to view order details
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("View Details"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to get status color
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Delivered':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      case 'Preparing':
        return Colors.blue;
      default:
        return Colors.black;
    }
  }
}
