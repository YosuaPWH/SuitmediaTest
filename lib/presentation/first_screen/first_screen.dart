import 'package:flutter/material.dart';
import 'package:suitmedia_test/presentation/routes.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String userInputPalindrome = '';
  String userName = '';
  bool isPalindromeResult = false;

  bool isPalindrome(String text) {
    var reversedText = text.split('').reversed.join();
    return text.trim() == reversedText.trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("assets/images/ic_photo.png"),
            ),
            const SizedBox(
              height: 51,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: SizedBox(
                height: 47,
                child: TextField(
                  onChanged: (newValue) {
                    setState(() {
                      userName = newValue;
                    });
                  },
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Name",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0x5B686777),
                        fontFamily: 'Poppins'
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: SizedBox(
                height: 47,
                child: TextField(
                  onChanged: (newValue) {
                    setState(() {
                      userInputPalindrome = newValue;
                    });
                  },
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Palindrome",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0x5B686777),
                        fontFamily: 'Poppins'
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isPalindromeResult = isPalindrome(userInputPalindrome);
                  });
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            isPalindromeResult
                                ? "Is Palindrome"
                                : "Is Not Palindrome",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          actions: [
                            TextButton(onPressed: () {
                              Navigator.of(context).pop();
                            }, child: const Text("OK"))
                          ],
                        );
                      }
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: const Color(0xFF2A637B)
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 41,
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "CHECK",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    )
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ElevatedButton(
                onPressed: () {
                  userName.isEmpty ? showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            "Name is empty",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          actions: [
                            TextButton(onPressed: () {
                              Navigator.of(context).pop();
                            }, child: const Text("OK"))
                          ],
                        );
                      }
                  ) : Navigator.pushNamed(context, NamedRoute.secondScreen, arguments: userName);
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: const Color(0xFF2A637B)
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 41,
                  child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "NEXT",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      )
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
