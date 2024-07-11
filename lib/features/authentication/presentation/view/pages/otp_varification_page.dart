import 'package:flutter/material.dart';

class OtpVarificationPage extends StatelessWidget {
  OtpVarificationPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Instagram logo
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/a/a5/Instagram_icon.png',
                  height: 100,
                ),
                SizedBox(height: 24.0),
                // OTP TextField
                TextFormField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter OTP',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: _validateOTP,
                ),
                SizedBox(height: 16.0),
                // Verify OTP Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process OTP verification.
                    }
                  },
                  child: Text('Verify OTP'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the OTP';
    }
    // Ensure OTP is exactly 6 digits
    if (value.length != 6) {
      return 'OTP must be 6 digits long';
    }
    return null;
  }
}
