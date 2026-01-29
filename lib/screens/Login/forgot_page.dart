import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Pindahkan controller ke sini supaya boleh guna dalam onPressed
    final TextEditingController _inputController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      // TAMBAH: AppBar kosong untuk mudahkan user tekan 'Back'
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // LOGO (Sama macam kod anda)
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Image.asset('assets/images/bernama_logo.webp', height: 50),
                    const SizedBox(width: 8),
                    const Text(
                      'Bernama',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 40,
              ), // Kurangkan sikit sebab dah ada AppBar

              const Text(
                'Oops!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const Text(
                'I forgot',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),

              const SizedBox(height: 30),
              const Icon(Icons.lock_outline, size: 80, color: Colors.black54),
              const SizedBox(height: 25),

              const Text(
                "Enter your email, phone, or\nusername and we'll send you a link\nto change a new password",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Color(0xFF00AEEF)),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: _inputController, // <--- Dah betul
                decoration: InputDecoration(
                  hintText: 'Username, Email or Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// SEND BUTTON
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00AEEF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // PEMBETULAN: Check kalau kosong atau tidak
                    if (_inputController.text.isNotEmpty) {
                      _showSuccessDialog(context);
                    } else {
                      // Opsional: Tunjuk snackbar kalau kosong
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter your details'),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'SEND',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // User takleh klik luar untuk tutup
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: const Text('Link to reset password has been sent!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Tutup dialog
              Navigator.pop(context); // Balik ke Login
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
