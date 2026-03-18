import 'package:flutter/material.dart';
import 'package:practicee/mixins/validator_mixin.dart';

class ValidatorScreen extends StatefulWidget {
  const ValidatorScreen({super.key});

  @override
  State<ValidatorScreen> createState() => _ValidatorScreenState();
}

class _ValidatorScreenState extends State<ValidatorScreen> with ValidatorMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late final TextEditingController _nameController;
  late final TextEditingController _ageController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Build called");
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildFormField(
                "Name",
                _nameController,
                (value) => validEmpty(value ?? '', "Name"),
              ),
              _buildFormField(
                "Age",
                _ageController,
                (value) => validEmpty(value ?? '', "Age"),
              ),
              _buildFormField(
                "Email",
                _emailController,
                (value) => emailValidator(value ?? ''),
              ),
              _buildFormField(
                "Password",
                _passwordController,
                (value) => passwordValidator(value ?? ''),
              ),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Validation Success"),
                      ),
                    );
                  }
                },
                child: const Text("Validate"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(
    String hint,
    TextEditingController controller,
    String? Function(String?) validator,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            border: border(),
            enabledBorder: border(),
            focusedBorder: border(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
