import 'package:flutter/material.dart';
import 'package:helal/views/main_screen/bottom_navigation_bar.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7y-jsI0YfLeAwZ-t64HPE2IgG0QKfsWZQSA&usqp=CAU"),
          const Text("Your shopping cary is empty.",
              style: TextStyle(
                  fontFamily: 'TiltNeon',
                  fontSize: 16,
                  color: Color(0xFF838589),
                  fontWeight: FontWeight.w400)),
          const Text("Add items you want to shop.",
              style: TextStyle(
                  fontFamily: 'TiltNeon',
                  fontSize: 14,
                  color: Color(0xFF838589),
                  fontWeight: FontWeight.w400)),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavigation(),));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              foregroundColor: Colors.purple,
              fixedSize: const Size(150, 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.purple, width: 1)),
            ),
            child: const Text("SHOP NOW",
                style: TextStyle(
                    fontFamily: 'TiltNeon',
                    fontSize: 15,
                    color: Colors.purple,
                    fontWeight: FontWeight.w400)),
          )
        ],
      ),
    );
  }
}