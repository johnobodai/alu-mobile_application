import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
           
            child: Image.asset(
              'assets/pineaple.jpg',
              
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 232, 230, 230),
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
              '''Pineapple, a tropical delight cherished for its vibrant sweetness and tanginess, serves as a nutrient-rich powerhouse abundant in vitamin C and manganese. Its versatile applications enhance both sweet and savory dishes, while the presence of bromelain supports digestion and offers anti-inflammatory properties. Despite these advantages, it's important to note potential drawbacks, including a relatively high sugar content, acidity that might pose challenges for some individuals, and the risk of allergies or sensitivity to bromelain.''',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // button action here
            },
            child: Text(
              'Scan',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              textStyle: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
