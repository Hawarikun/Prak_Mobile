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

// class EditProfilePage extends StatefulWidget {
//   const EditProfilePage({Key? key}) : super(key: key);

//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }

class _ProfileDetail extends State<ProfileDetail> {
  // final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  bool isVisible = false;

// class _EditProfilePageState extends State<EditProfilePage> {
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

//   @override
//   void initState() {
//     if (widget.user.name != "") {
//       nameController.text = widget.user.name;
//     }
//     super.initState();
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: MediaQuery.of(context).padding.top,
//           ),
//           Row(
//             children: [
//               IconButton(
//                 onPressed: () {
//                   GoRouter.of(context).pop();
//                 },
//                 icon: const Icon(
//                   Icons.chevron_left_rounded,
//                 ),
//               ),
//               const Text(
//                 "Profile Detail",
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           Expanded(
//             child: Form(
//               key: _fromKey,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                     ),
//                     child: TextFormField(
//                       controller: nameController,
//                       obscureText: true,
//                       keyboardType: TextInputType.name,
//                       decoration: InputDecoration(
//                         label: const Text("Nama"),
//                         hintText: "ex : Ciptaraka Nurhisam Hawari",
//                         suffixIcon: const Icon(
//                           Icons.visibility,
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(
//                             16,
//                           ),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == "") {
//                           return "Nama wajib diisi";
//                         }
//                         return null;
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           TextButton(
//             onPressed: () {
//               if (_fromKey.currentState!.validate()) {
//                 log("Update Profile" as num);
//               }
//             },
//             child: const Text(
//               "Simpan",
//             ),
//           ),
//           const SizedBox(
//             height: 16,
//           )
//         ],
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement save profile changes
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
