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
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  bool isVisible = false;

  @override
  void initState() {
    if (widget.user.name != "") {
      nameController.text = widget.user.name;
    } else if (widget.user.email != "") {
      emailController.text = widget.user.email;
    }
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
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
          Row(
            children: [
              IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: const Icon(
                  Icons.chevron_left_rounded,
                ),
              ),
              const Text(
                "Profile Detail",
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Form(
              key: _fromKey,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://picsum.photos/200'),
                  ),
                  const SizedBox(
                    height: 16,
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
                        }),
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
