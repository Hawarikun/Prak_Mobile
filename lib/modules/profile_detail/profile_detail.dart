import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:pertemuan_v/models/user.dart';
import '../../models/user.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({
    super.key,
    required this.user,
  });
  final User user;

  @override
  State<ProfileDetail> createState() => _ProfileDetail();
}

class _ProfileDetail extends State<ProfileDetail> {
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  final TextEditingController profileController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final _profileController = TextEditingController();
  final _usernameController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  bool isVisible = false;

  @override
  void initState() {
    if (widget.user.profilePhoto != "") {
      profileController.text = widget.user.profilePhoto!;
    }
    if (widget.user.username != "") {
      usernameController.text = widget.user.username;
    }
    if (widget.user.name != "") {
      nameController.text = widget.user.name;
    }
    if (widget.user.password != "") {
      passwordController.text = widget.user.password;
    }
    if (widget.user.email != "") {
      emailController.text = widget.user.email;
    }
    if (widget.user.phoneNumber != "") {
      phoneController.text = widget.user.phoneNumber!;
    }
    super.initState();
  }

  @override
  void dispose() {
    _profileController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: const Icon(Icons.chevron_left),
                  ),
                ),
                const SizedBox(width: 8),
                const Flexible(
                  child: Text(
                    "Profile Detail",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Expanded(
            child: Form(
              key: _fromKey,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "https://cdn.idntimes.com/content-images/community/2020/09/104967619-2451390651819718-4934284928595035666-n-2fc82b7325949c7d003c1c58e17d48b7.jpg"),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: TextFormField(
                      controller: usernameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        label: const Text("Username"),
                        hintText: "Username",
                        suffixIcon: const Icon(
                          Icons.supervised_user_circle,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == "") {
                          return "Username wajib diisi";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: isVisible,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        isDense: true,
                        label: const Text("Password"),
                        hintText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: Icon(isVisible == false
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == "") {
                          return "Password wajib diisi";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        label: const Text("Nama"),
                        hintText: "ex : Ciptaraka Nurhisam Hawari",
                        suffixIcon: const Icon(
                          Icons.abc,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == "") {
                          return "Nama wajib diisi";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: const Text("Email"),
                        hintText: "ex : example@gmail.com",
                        suffixIcon: const Icon(
                          Icons.email,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value!)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: const Text("Phone Number"),
                        hintText: "08XXXXXXXXX",
                        suffixIcon: const Icon(
                          Icons.numbers,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == "") {
                          return "Nama wajib diisi";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: TextFormField(
                      controller: profileController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        label: const Text("Profile"),
                        hintText: "Masukan link profile",
                        suffixIcon: const Icon(
                          Icons.link,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == "") {
                          return "Profile wajib diisi";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (_fromKey.currentState!.validate()) {
                log("Update Profile" as num);
              }
            },
            child: const Text(
              "Simpan",
            ),
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
