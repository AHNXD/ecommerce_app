import 'package:ecommerce_app_qr/Future/Home/Pages/order_details_screen.dart';
import 'package:ecommerce_app_qr/Future/Home/Widgets/historyScreen/historyOrderCard.dart';
import 'package:ecommerce_app_qr/Future/Home/models/order_information.dart';
import 'package:ecommerce_app_qr/Utils/colors.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});
  final List<OrderInformation> myOrders = [
    OrderInformation(
        address1: '123 Main Street',
        code: '12345',
        city: 'New York',
        country: 'United States',
        email: 'john.doe@example.com',
        firstName: 'John',
        lastName: 'Doe',
        note: 'Please ensure timely delivery.',
        phone: '555-555-1234',
        productId: [1, 3, 5],
        quantity: [2, 1, 3]),
    OrderInformation(
        address1: '456 Oak Avenue',
        code: '67890',
        city: 'London',
        country: 'United Kingdom',
        email: 'jane.smith@example.com',
        firstName: 'Jane',
        lastName: 'Smith',
        note: 'Please include a gift wrapping.',
        phone: '123-456-7890',
        productId: [2, 4],
        quantity: [1, 2]),
    OrderInformation(
        address1: '789 Elm Street',
        code: '11122',
        city: 'Paris',
        country: 'France',
        email: 'emily.dufour@example.com',
        firstName: 'Emily',
        lastName: 'Dufour',
        note: 'Please include a handwritten note with the order.',
        phone: '33-1-23-45-67-89',
        productId: [6, 7, 8],
        quantity: [2, 1, 3]),
    OrderInformation(
        address1: '101 Pine Avenue',
        code: '33344',
        city: 'Tokyo',
        country: 'Japan',
        email: 'kenji.tanaka@example.com',
        firstName: 'Kenji',
        lastName: 'Tanaka',
        note: 'Please ensure delivery before the weekend.',
        phone: '81-3-1234-5678',
        productId: [9, 10],
        quantity: [1, 2]),
    OrderInformation(
        address1: '1234 Maple Drive',
        code: '55566',
        city: 'Sydney',
        country: 'Australia',
        email: 'david.lee@example.com',
        firstName: 'David',
        lastName: 'Lee',
        note: 'Please include a sample of the product with the order.',
        phone: '61-2-9999-8888',
        productId: [11, 12, 13],
        quantity: [3, 2, 1]),
    OrderInformation(
        address1: '567 Willow Lane',
        code: '77788',
        city: 'Berlin',
        country: 'Germany',
        email: 'sofia.schmidt@example.com',
        firstName: 'Sofia',
        lastName: 'Schmidt',
        note: 'Please ensure the order arrives before the event.',
        phone: '49-30-1234-5678',
        productId: [14, 15],
        quantity: [2, 3]),
    OrderInformation(
        address1: '890 Cedar Road',
        code: '99900',
        city: 'Moscow',
        country: 'Russia',
        email: 'ivan.petrov@example.com',
        firstName: 'Ivan',
        lastName: 'Petrov',
        note: 'Please include a tracking number for the shipment.',
        phone: '7-495-123-45-67',
        productId: [16, 17],
        quantity: [1, 1]),
    OrderInformation(
        address1: '2345 Walnut Street',
        code: '22233',
        city: 'Rio de Janeiro',
        country: 'Brazil',
        email: 'maria.silva@example.com',
        firstName: 'Maria',
        lastName: 'Silva',
        note: 'Please ensure the order arrives before the holiday.',
        phone: '55-21-9999-8888',
        productId: [18, 19],
        quantity: [3, 2]),
    OrderInformation(
        address1: '6789 Oak Avenue',
        code: '44455',
        city: 'Cape Town',
        country: 'South Africa',
        email: 'peter.smith@example.com',
        firstName: 'Peter',
        lastName: 'Smith',
        note: 'Please include a gift receipt with the order.',
        phone: '27-21-9999-8888',
        productId: [20, 21],
        quantity: [2, 1]),
    OrderInformation(
        address1: '1234 Maple Drive',
        code: '55566',
        city: 'Sydney',
        country: 'Australia',
        email: 'david.lee@example.com',
        firstName: 'David',
        lastName: 'Lee',
        note: 'Please include a sample of the product with the order.',
        phone: '61-2-9999-8888',
        productId: [11, 12, 13],
        quantity: [3, 2, 1])
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Orders")),
      body: ListView.builder(
        itemCount: myOrders.length,
        itemBuilder: (BuildContext context, int index) {
          return HistoryCardItem(index: index, order: myOrders[index]);
        },
      ),
    );
  }
}
