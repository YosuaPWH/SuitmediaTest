import 'package:flutter/material.dart';
import 'package:suitmedia_test/presentation/third_screen/third_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String selectedUsername = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Second Screen',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF04021D),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Welcome"),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.username,
                    style: const TextStyle(
                      color: Color(0xFF04021D),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                selectedUsername == ''
                    ? "Selected User Name"
                    : selectedUsername,
                style: const TextStyle(
                  color: Color(0xFF04021D),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 29, bottom: 20, right: 37),
            child: ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdScreen()),
                );

                if (result != null) {
                  setState(() {
                    selectedUsername = result as String;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2A637B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 41,
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Choose a User",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
