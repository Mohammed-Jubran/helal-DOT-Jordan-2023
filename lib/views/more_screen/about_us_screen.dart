import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("About us",style: TextStyle(fontFamily: 'TiltNeon')),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  Text(
                    "Welcome to Our Grocery App! We provide you with competitive-priced online grocery shopping and fast, reliable delivery service. Our journey began in 2000 with the opening of a small grocery store in the heart of the city, and since then, thanks to the support of our loyal customers, our company has grown and developed into one of the best online shopping services in the region.",
                    style: TextStyle(
                        fontFamily: 'TiltNeon',
                        color: Colors.black,
                        fontSize: 17),
                  ),
                  SizedBox(height: 10),
                  Text(
                      "At Our Grocery App, we strive to provide the best online shopping experience for our customers. We guarantee the quality of the products we offer and deliver them to your doorstep as quickly as possible. We also provide excellent customer service and respond to your questions and inquiries quickly and efficiently.",
                      style: TextStyle(
                          fontFamily: 'TiltNeon',
                          color: Colors.black,
                          fontSize: 17)),
                  SizedBox(height: 10),
                  Text(
                      "We believe in the importance of teamwork and dedication to work, and we work hard to meet the needs of our customers and achieve their satisfaction. We look forward to continuing to provide the best services and products to our customers, and we thank you for your continuous support and trust in us.",
                      style: TextStyle(
                          fontFamily: 'TiltNeon',
                          color: Colors.black,
                          fontSize: 17)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
