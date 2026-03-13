import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),

          child: Column(
            children: [

              const SizedBox(height: 70),

              /// LOGO
              Center(
                child: Image.asset(
                  "assets/images/instagram_logo.png",
                  height: 60,
                ),
              ),

              const SizedBox(height: 60),

              /// CUENTAS
              _accountCard(context, "eysoyvale", "eysoyvale@email.com"),

              const SizedBox(height: 16),

              _accountCard(context, "isaa._wth", "isaa@email.com"),

              const SizedBox(height: 20),

              /// LOGIN OTRA CUENTA
              _loginOtherAccount(context),

              const Spacer(),

              /// CREAR CUENTA
              _createAccountButton(),

              const SizedBox(height: 20),

              const Text(
                "Meta",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  /// TARJETA PERFIL
  Widget _accountCard(BuildContext context, String username, String email) {
    return GestureDetector(
      onTap: () {
        _showPasswordDialog(context, email);
      },

      child: Container(
        height: 70,

        padding: const EdgeInsets.symmetric(horizontal: 16),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xff2A2A2A)),
        ),

        child: Row(
          children: [

            const CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey,
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Text(
                username,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.white54,
            ),
          ],
        ),
      ),
    );
  }

  /// DIALOGO CONTRASEÑA
  void _showPasswordDialog(BuildContext context, String email) {

    final passwordController = TextEditingController();

    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xff121212),

          title: const Text(
            "Introduce tu contraseña",
            style: TextStyle(color: Colors.white),
          ),

          content: TextField(
            controller: passwordController,
            obscureText: true,
            style: const TextStyle(color: Colors.white),

            decoration: const InputDecoration(
              hintText: "Contraseña",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancelar"),
            ),

            ElevatedButton(
              onPressed: () async {

                try {

                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email,
                    password: passwordController.text.trim(),
                  );

                  Navigator.pop(context);

                  Navigator.pushReplacementNamed(context, "/feed");

                } on FirebaseAuthException catch (e) {

                  String message = "Error de login";

                  if (e.code == "wrong-password") {
                    message = "Contraseña incorrecta";
                  }

                  if (e.code == "user-not-found") {
                    message = "Usuario no existe";
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(message)),
                  );
                }
              },

              child: const Text("Entrar"),
            ),
          ],
        );
      },
    );
  }

  /// BOTON OTRA CUENTA
  Widget _loginOtherAccount(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showLoginForm(context);
      },

      child: Container(
        height: 55,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: const Color(0xff2A2A2A)),
        ),

        child: const Center(
          child: Text(
            "Iniciar sesión en otra cuenta",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  /// LOGIN MANUAL
  void _showLoginForm(BuildContext context) {

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xff121212),

          title: const Text(
            "Iniciar sesión",
            style: TextStyle(color: Colors.white),
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              TextField(
                controller: emailController,
                style: const TextStyle(color: Colors.white),

                decoration: const InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),

              TextField(
                controller: passwordController,
                obscureText: true,
                style: const TextStyle(color: Colors.white),

                decoration: const InputDecoration(
                  hintText: "Contraseña",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),

          actions: [

            ElevatedButton(
              onPressed: () async {

                try {

                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );

                  Navigator.pop(context);

                  Navigator.pushReplacementNamed(context, "/feed");

                } catch (e) {

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Error de autenticación"),
                    ),
                  );
                }
              },

              child: const Text("Entrar"),
            ),
          ],
        );
      },
    );
  }

  /// CREAR CUENTA
  Widget _createAccountButton() {
    return Container(
      height: 55,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.blue),
      ),

      child: const Center(
        child: Text(
          "Crear cuenta nueva",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}