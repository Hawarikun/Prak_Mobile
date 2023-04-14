import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:pertemuan_v/configs/app_routes.dart';
import 'package:pertemuan_v/models/user.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({super.key, required this.user});
  final User user;
  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    if (widget.user.name != "") {}
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
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
                icon: const Icon(Icons.chevron_left_rounded),
              ),
              const Text("Profile Detail")
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        label: const Text("Nama"),
                        hintText: "ex : kelompok 06",
                        suffixIcon: Icon(Icons.abc_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      validator: (value) {
                        if (value == "") {
                          return "Nama Wajib Diisi";
                        }
                        return null;
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  log("update log");
                }
              },
              child: const Text("Simpan")),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
