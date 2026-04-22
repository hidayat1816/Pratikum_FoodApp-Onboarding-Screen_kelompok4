import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Sign In"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WelcomeText(
                title: "Welcome to",
                text:
                    "Enter your Phone number or Email \naddress for sign in. Enjoy your food :)",
              ),
              const SignInForm(),
              const SizedBox(height: 16),

              Center(
                child: Text(
                  "Or",
                  style: TextStyle(color: Color(0xFF010F07).withOpacity(0.7)),
                ),
              ),
              const SizedBox(height: 24),

              /// 👉 CREATE ACCOUNT
              Center(
                child: Text.rich(
                  TextSpan(
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                    text: "Don’t have account? ",
                    children: <TextSpan>[
                      TextSpan(
                        text: "Create new account.",
                        style: const TextStyle(color: Color(0xFF22A45D)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/signup');
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              /// FACEBOOK
              SocalButton(
                press: () {},
                text: "Connect with Facebook",
                color: const Color(0xFF395998),
                icon: SvgPicture.string(
                  facebookIcon,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF395998),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              /// GOOGLE
              SocalButton(
                press: () {},
                text: "Connect with Google",
                color: const Color(0xFF4285F4),
                icon: SvgPicture.string(googleIcon),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

/// ================= TEXT =================
class WelcomeText extends StatelessWidget {
  final String title, text;

  const WelcomeText({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        const Text(
          "Enter your Phone number or Email \naddress for sign in. Enjoy your food :)",
          style: TextStyle(color: Color(0xFF868686)),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

/// ================= FORM =================
class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          /// EMAIL
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email tidak boleh kosong";
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "Email Address",
            ),
          ),
          const SizedBox(height: 16),

          /// PASSWORD
          TextFormField(
            obscureText: _obscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password tidak boleh kosong";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          /// FORGOT PASSWORD
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/forgot');
            },
            child: const Text("Forget Password?"),
          ),
          const SizedBox(height: 16),

          /// LOGIN BUTTON
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushReplacementNamed(context, '/home');
              }
            },
            child: const Text("Sign in"),
          ),
        ],
      ),
    );
  }
}

/// ================= SOCIAL BUTTON =================
class SocalButton extends StatelessWidget {
  final Color color;
  final String text;
  final Widget icon;
  final GestureTapCallback press;

  const SocalButton({
    super.key,
    required this.color,
    required this.icon,
    required this.press,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: press,
        child: Row(
          children: [
            icon,
            const Spacer(),
            Text(text),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

/// ================= ICON =================
const String facebookIcon = '''<svg></svg>''';
const String googleIcon = '''<svg></svg>''';