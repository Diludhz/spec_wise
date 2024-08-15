import 'package:flutter/material.dart';
import 'package:specspot/Utils/Colors.dart';

class Filterandsortcontainer extends StatefulWidget {
  const Filterandsortcontainer({super.key});

  @override
  State<Filterandsortcontainer> createState() => _FilterandsortcontainerState();
}

class _FilterandsortcontainerState extends State<Filterandsortcontainer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.paleSlate,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                const Icon(Icons.filter_list, color: Colors.black),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const FilterWidgets(); // Replace with your Filter Widget
                      },
                    );
                  },
                  child: const Text(
                    "Filters",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const VerticalDivider(
              color: Colors.black,
              thickness: 3,
            ),
            Row(
              children: [
                const Icon(Icons.unfold_more_double_sharp, color: Colors.black),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    // Navigate to SortByWidget screen
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const FilterWidgets(); // Sort by widget as a modal sheet
                      },
                    );
                  },
                  child: const Text(
                    "Sort By",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SortByWidgets extends StatefulWidget {
  const SortByWidgets({Key? key}) : super(key: key);

  @override
  State<FilterWidgets> createState() => _FilterWidgetsState();
}

class _FilterWidgetsState extends State<FilterWidgets> {
  int? _selectedSortBy;
  int? _selectedScoreBy;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(17), topRight: Radius.circular(17)),
            color: Colors.black),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sort By',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                RadioListTile<int>(
                  title: const Text(
                    'Popularity',
                    style:
                        TextStyle(fontFamily: 'Poppins', color: Colors.white),
                  ),
                  value: 0,
                  groupValue: _selectedSortBy,
                  onChanged: (value) {
                    setState(() {
                      _selectedSortBy = value;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: const Text(
                    'Recency',
                    style:
                        TextStyle(fontFamily: 'Poppins', color: Colors.white),
                  ),
                  value: 1,
                  groupValue: _selectedSortBy,
                  onChanged: (value) {
                    setState(() {
                      _selectedSortBy = value;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: const Text(
                    'Price: Low to High',
                    style:
                        TextStyle(fontFamily: 'Poppins', color: Colors.white),
                  ),
                  value: 2,
                  groupValue: _selectedSortBy,
                  onChanged: (value) {
                    setState(() {
                      _selectedSortBy = value;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: const Text(
                    'Price: High to Low',
                    style:
                        TextStyle(fontFamily: 'Poppins', color: Colors.white),
                  ),
                  value: 3,
                  groupValue: _selectedSortBy,
                  onChanged: (value) {
                    setState(() {
                      _selectedSortBy = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'By Score',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                RadioListTile<int>(
                  title: const Text(
                    'SpecWise Score',
                    style:
                        TextStyle(fontFamily: 'Poppins', color: Colors.white),
                  ),
                  value: 0,
                  groupValue: _selectedScoreBy,
                  onChanged: (value) {
                    setState(() {
                      _selectedScoreBy = value;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: const Text(
                    'Performance Score',
                    style:
                        TextStyle(fontFamily: 'Poppins', color: Colors.white),
                  ),
                  value: 1,
                  groupValue: _selectedScoreBy,
                  onChanged: (value) {
                    setState(() {
                      _selectedScoreBy = value;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: const Text(
                    'Camera Score',
                    style:
                        TextStyle(fontFamily: 'Poppins', color: Colors.white),
                  ),
                  value: 2,
                  groupValue: _selectedScoreBy,
                  onChanged: (value) {
                    setState(() {
                      _selectedScoreBy = value;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: const Text(
                    'Battery Score',
                    style:
                        TextStyle(fontFamily: 'Poppins', color: Colors.white),
                  ),
                  value: 3,
                  groupValue: _selectedScoreBy,
                  onChanged: (value) {
                    setState(() {
                      _selectedScoreBy = value;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: const Text(
                    'Display Score',
                    style:
                        TextStyle(fontFamily: 'Poppins', color: Colors.white),
                  ),
                  value: 4,
                  groupValue: _selectedScoreBy,
                  onChanged: (value) {
                    setState(() {
                      _selectedScoreBy = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red, // Text color
                  ),
                  onPressed: () {
                    // Show a Snackbar with red background color when "Cancel" is pressed
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Sorting canceled'),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style:
                        TextStyle(fontFamily: 'Poppins', color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green, // Text color
                  ),
                  onPressed: () {
                    // Show a Snackbar with green background color when "Done" is pressed
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                          'Sort by: ${_selectedSortBy != null ? _selectedSortBy : 'None'}, '
                          'Score by: ${_selectedScoreBy != null ? _selectedScoreBy : 'None'}',
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: const Text('Done'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FilterWidgets extends StatefulWidget {
  const FilterWidgets({Key? key}) : super(key: key);

  @override
  State<FilterWidgets> createState() => _FilterWidgetsState();
}

class FilterWidgetsState extends State<FilterWidgets> {
  final _priceController = TextEditingController(text: "8,000");
  final _priceController2 = TextEditingController(text: "12,000");
  double _minPrice = 8000;
  double _maxPrice = 12000;
  int? _selectedSortBy;
  int? _selectedScoreBy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter By'),
        actions: [
          TextButton(
            onPressed: () {
              // reset filters
              setState(() {
                _priceController.text = "8,000";
                _priceController2.text = "12,000";
                _minPrice = 8000;
                _maxPrice = 12000;
                _selectedSortBy = null;
                _selectedScoreBy = null;
              });
            },
            child: const Text(
              'Reset All',
              style: TextStyle(color: Colors.orange),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Search for criterion',
                ),
              ),
              const SizedBox(height: 20),
              // Price filter
              const Text(
                'Price',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.currency_rupee),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text('to'),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _priceController2,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.currency_rupee),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Price slider
              RangeSlider(
                min: 0,
                max: 50000,
                values: RangeValues(_minPrice, _maxPrice),
                onChanged: (values) {
                  setState(() {
                    _minPrice = values.start;
                    _maxPrice = values.end;
                    _priceController.text = values.start.toStringAsFixed(0);
                    _priceController2.text = values.end.toStringAsFixed(0);
                  });
                },
              ),
              const SizedBox(height: 20),
              // Price range filter
              const Text(
                'Price Range',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  RadioListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('₹10,000 & below (483)'),
                    value: 0,
                    groupValue: _selectedSortBy,
                    onChanged: (value) {
                      setState(() {
                        _selectedSortBy = value as int?;
                      });
                    },
                  ),
                  RadioListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('₹10,000 - ₹20,000 (485)'),
                    value: 1,
                    groupValue: _selectedSortBy,
                    onChanged: (value) {
                      setState(() {
                        _selectedSortBy = value as int?;
                      });
                    },
                  ),
                  RadioListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('₹20,000 - ₹30,000 (208)'),
                    value: 2,
                    groupValue: _selectedSortBy,
                    onChanged: (value) {
                      setState(() {
                        _selectedSortBy = value as int?;
                      });
                    },
                  ),
                  RadioListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('₹30,000 - ₹50,000 (118)'),
                    value: 3,
                    groupValue: _selectedSortBy,
                    onChanged: (value) {
                      setState(() {
                        _selectedSortBy = value as int?;
                      });
                    },
                  ),
                  RadioListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('₹50,000 and above (75)'),
                    value: 4,
                    groupValue: _selectedSortBy,
                    onChanged: (value) {
                      setState(() {
                        _selectedSortBy = value as int?;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'By Score',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  RadioListTile<int>(
                    title: const Text(
                      'SpecWise Score',
                      style: TextStyle(fontFamily: 'Poppins'),
                    ),
                    value: 0,
                    groupValue: _selectedScoreBy,
                    onChanged: (value) {
                      setState(() {
                        _selectedScoreBy = value;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: const Text(
                      'Performance Score',
                      style: TextStyle(fontFamily: 'Poppins'),
                    ),
                    value: 1,
                    groupValue: _selectedScoreBy,
                    onChanged: (value) {
                      setState(() {
                        _selectedScoreBy = value;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: const Text(
                      'Camera Score',
                      style: TextStyle(fontFamily: 'Poppins'),
                    ),
                    value: 2,
                    groupValue: _selectedScoreBy,
                    onChanged: (value) {
                      setState(() {
                        _selectedScoreBy = value;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: const Text(
                      'Battery Score',
                      style: TextStyle(fontFamily: 'Poppins'),
                    ),
                    value: 3,
                    groupValue: _selectedScoreBy,
                    onChanged: (value) {
                      setState(() {
                        _selectedScoreBy = value;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: const Text(
                      'Display Score',
                      style: TextStyle(fontFamily: 'Poppins'),
                    ),
                    value: 4,
                    groupValue: _selectedScoreBy,
                    onChanged: (value) {
                      setState(() {
                        _selectedScoreBy = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red, // Text color
                    ),
                    onPressed: () {
                      // Show a Snackbar with red background color when "Cancel" is pressed
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Sorting canceled'),
                        ),
                      );
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style:
                          TextStyle(fontFamily: 'Poppins', color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green, // Text color
                    ),
                    onPressed: () {
                      // Show a Snackbar with green background color when "Done" is pressed
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            'Sort by: ${_selectedSortBy != null ? _selectedSortBy : 'None'}, '
                            'Score by: ${_selectedScoreBy != null ? _selectedScoreBy : 'None'}',
                          ),
                        ),
                      );
                      Navigator.pop(context);
                    },
                    child: const Text('Done'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
