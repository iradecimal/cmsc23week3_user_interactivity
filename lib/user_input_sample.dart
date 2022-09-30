import 'package:flutter/material.dart';

class InputFieldsSample extends StatefulWidget {
  InputFieldsSample({super.key});

  @override
  _InputFieldsSampleState createState() => _InputFieldsSampleState();
}

class _InputFieldsSampleState extends State<InputFieldsSample> {
  String _searchTerm = "";

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      print("Latest Value: ${_searchController.text}");
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // checkbox
  bool _isChecked = false;

  // dropdown
  static final List<String> _dropdownOptions = [
    "One",
    "Two",
    "Three",
    "Four",
    "Five",
    "Six",
    "Seven"
  ];
  String dropdownValue = _dropdownOptions.first;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            const Text('Search'),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter search term",
                labelText: "Search",
              ),
              controller: _searchController,
              /* onChanged: (String value) {
                _searchTerm = value;
                print(_searchTerm);
              }, */
            ),
            Checkbox(
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: _dropdownOptions.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(
                          "Input Field: ${_searchController.text}\nCheckbox value: $_isChecked\n Dropdown value: $dropdownValue"),
                    );
                  },
                );
              },
              child: const Text('Show text'),
            ),
          ],
        ),
      ],
    );
  }
}
