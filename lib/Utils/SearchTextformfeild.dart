import 'package:flutter/material.dart';
import 'package:specspot/Utils/Colors.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search for products or brands',
                hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: AppColors.paleSlate,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a search term';
                }
                return null;
              },
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 17, 0), // Red color
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.filter_list,
                color: Colors.white,
              ),
              onPressed: () {
                // Implement your filter action here
              },
            ),
          ),
        ],
      ),
    );
  }
}
