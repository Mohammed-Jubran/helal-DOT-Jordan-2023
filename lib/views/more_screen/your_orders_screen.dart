import 'package:flutter/material.dart';
import 'package:helal/controller/order_controller.dart';
import 'package:helal/model/order_model.dart';

class OrderScreen extends StatefulWidget {
  final int userId;

  const OrderScreen({Key? key, required this.userId}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late int receivedUserId;

  @override
  void initState() {
    super.initState();
    receivedUserId = widget.userId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders',style: TextStyle(fontFamily: 'TiltNeon')),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Order>>(
        future: OrderController().getOrdersByUserId(receivedUserId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error fetching orders: ${snapshot.error}'),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
              return const Center(child: Text('No orders found.'));
            }
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Order order = snapshot.data![index];
                return ListTile(
                  title: Text('Order Date: ${order.orderDate}',style: const TextStyle(fontFamily: 'TiltNeon')),
                  trailing: Text('Total: ${order.total?.toStringAsFixed(2)}',style: const TextStyle(fontFamily: 'TiltNeon')),
                );
              }, separatorBuilder: (BuildContext context, int index) { return const Divider(); },
            );
          }
          return Container();
        },
      ),
    );
  }
}
