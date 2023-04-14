import 'package:flutter/material.dart';

import '../home_fragment/home_fragment_widgets.dart';

class NewsFragment extends StatelessWidget {
  const NewsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Masukkan kata kunci disini",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    suffixIcon: const Icon(
                      Icons.search_rounded,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: HomeFragmentWidget.latestNewsSection(
                size,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
