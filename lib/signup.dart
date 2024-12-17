import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DriverRegistrationForm(),
    );
  }
}

class DriverRegistrationForm extends StatefulWidget {
  const DriverRegistrationForm({super.key});

  @override
  State<DriverRegistrationForm> createState() => _DriverRegistrationFormState();
}

class _DriverRegistrationFormState extends State<DriverRegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  String? _gender;
  String _profileImage = '';

  // Controllers for text fields
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _cnicController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle file picking
  Future<void> _pickProfileImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      setState(() {
        _profileImage =
            result.files.single.name; // Just get the name for display
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Driver Registration"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gender Selection
                const Text("You are:"),
                Row(
                  children: [
                    Radio<String>(
                      value: "female",
                      groupValue: _gender,
                      onChanged: (String? value) {
                        setState(() {
                          _gender = value;
                        });
                      },
                    ),
                    const Text("Female"),
                    Radio<String>(
                      value: "male",
                      groupValue: _gender,
                      onChanged: (String? value) {
                        setState(() {
                          _gender = value;
                        });
                      },
                    ),
                    const Text("Male"),
                  ],
                ),
                // Last Name
                TextFormField(
                  controller: _lastnameController,
                  decoration: const InputDecoration(labelText: 'Last Name'),
                ),
                // First Name
                TextFormField(
                  controller: _firstnameController,
                  decoration: const InputDecoration(labelText: 'First Name'),
                ),
                // Email
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
                // Telephone
                TextFormField(
                  controller: _telephoneController,
                  decoration: const InputDecoration(labelText: 'Telephone'),
                  keyboardType: TextInputType.phone,
                ),
                // CNIC
                TextFormField(
                  controller: _cnicController,
                  decoration: const InputDecoration(labelText: 'CNIC'),
                ),
                // Age
                TextFormField(
                  controller: _ageController,
                  decoration: const InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                ),
                // Username
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
                // Password
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                // Profile Image Picker
                Row(
                  children: [
                    const Text("Profile Image: "),
                    ElevatedButton(
                      onPressed: _pickProfileImage,
                      child: const Text("Choose File"),
                    ),
                    const SizedBox(width: 10),
                    Text(_profileImage), // Display selected file name
                  ],
                ),
                const SizedBox(height: 20),
                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle form submission
                      print("Form Submitted!");
                    }
                  },
                  child: const Text("Create Account"),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to login page
                  },
                  child: const Text("Already have an account? Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
