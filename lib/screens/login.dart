import 'package:codeland/screens/view_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/textfield.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Create a GlobalKey

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Images at the top
                  Image.asset('assets/logo.png', width: 150, height: 150),
                  Image.asset('assets/tree.png', width: 120, height: 120),
                  Text(
                    'Biomedical Kiosk',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 120), // Adjust the left padding as needed
                    child: Text(
                      'for HCE\'s', // Add your additional text here
                      style: GoogleFonts.poppins(fontSize: 12, color: Colors.orange),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Text before fields
                  // TextFields
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: _formKey, // Assign the GlobalKey to Form
                      child: Column(
                        children: [
                          MyTextField(
                            hintText: 'Email',
                            obscureText: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                            onSaved: (value) {},
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 20),
                          MyTextField(
                            hintText: 'Password',
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            onSaved: (value) {},
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: 20),
                          // Login Button
                          ElevatedButton(
                            onPressed: () {
                              // Validate the form
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, go to the next page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ImageUploadPage()),
                                );
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.orange),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(color: Colors.orange), // Border color
                                ),
                              ),
                              shadowColor: MaterialStateProperty.all(Colors.orange.withOpacity(0.5)),
                              elevation: MaterialStateProperty.all(5), // Adjust elevation as needed
                            ),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                'Login',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          // 3 Statements
                          Row(
                            children: [
                              Text('For Assistance & Login Details Contact:', style: GoogleFonts.poppins()),
                            ],
                          ),
                          Row(
                            children: [
                              Text('English, Kannada & Telugu: ', style: GoogleFonts.poppins()),
                              SizedBox(width: 3),
                              Text('7406333800', style: GoogleFonts.poppins(color: Colors.orange, decoration: TextDecoration.underline)),
                            ],
                          ),
                          Row(
                            children: [
                              Text('English, Kannada & Hindi: ', style: GoogleFonts.poppins()),
                              SizedBox(width: 3),
                              Text('9071386515', style: GoogleFonts.poppins(color: Colors.orange, decoration: TextDecoration.underline)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          margin: EdgeInsets.all(10),
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'v1.7 © 2023, Codeland Infosolutions Pvt Ltd.',
                    style: GoogleFonts.poppins(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
