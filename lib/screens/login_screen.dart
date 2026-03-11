import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// LOGIN BOX
              Container(
                width: 350,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 30,
                ),

                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff262626)),
                ),

                child: Column(
                  children: [
                    const Text(
                      "Instagram",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 40),

                    _buildUsernameField(),

                    const SizedBox(height: 10),

                    _buildPasswordField(),

                    const SizedBox(height: 16),

                    _buildLoginButton(),

                    const SizedBox(height: 20),

                    _buildDivider(),

                    const SizedBox(height: 20),

                    _buildFacebookLogin(),

                    const SizedBox(height: 15),

                    const Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.blue, fontSize: 12),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              /// SIGNUP BOX
              Container(
                width: 350,
                padding: const EdgeInsets.symmetric(vertical: 20),

                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff262626)),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: const [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.white),
                    ),

                    SizedBox(width: 5),

                    Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              /// FOOTER
              const Text(
                "Meta · About · Blog · Jobs · Help · Privacy · Terms",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUsernameField() {
    return TextField(
      controller: _usernameController,
      onChanged: (_) => _validateFields(),

      style: const TextStyle(color: Colors.white),

      decoration: InputDecoration(
        hintText: "Phone number, username, or email",
        hintStyle: const TextStyle(color: Colors.grey),

        filled: true,
        fillColor: const Color(0xff121212),

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: _passwordController,
      obscureText: true,
      onChanged: (_) => _validateFields(),

      style: const TextStyle(color: Colors.white),

      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: const TextStyle(color: Colors.grey),

        filled: true,
        fillColor: const Color(0xff121212),

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _isButtonEnabled
              ? Colors.blue
              : Colors.blue.withOpacity(0.4),
        ),

        onPressed: _isButtonEnabled ? _handleLogin : null,

        child: const Text("Log In"),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: const [
        Expanded(child: Divider(color: Color(0xff262626))),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text("OR", style: TextStyle(color: Colors.grey)),
        ),

        Expanded(child: Divider(color: Color(0xff262626))),
      ],
    );
  }

  Widget _buildFacebookLogin() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Icon(Icons.facebook, color: Colors.blue),

        SizedBox(width: 8),

        Text(
          "Log in with Facebook",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  void _validateFields() {
    final isValid =
        _usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;

    setState(() {
      _isButtonEnabled = isValid;
    });
  }

  void _handleLogin() {
    Navigator.pushReplacementNamed(context, '/feed');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
