import 'package:flutter/material.dart';
import '../widgets/rescue_button.dart';

class RescueScreen extends StatefulWidget {
  const RescueScreen({super.key});

  @override
  State<RescueScreen> createState() => _RescueScreenState();
}

class _RescueScreenState extends State<RescueScreen> {
  String urgency = 'Stable';
  String animalType = 'Dog';
  final TextEditingController _descController = TextEditingController();
  int _charCount = 0;

  @override
  void initState() {
    super.initState();
    _descController.addListener(() {
      setState(() {
        _charCount = _descController.text.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Emergency'),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Photo placeholder
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey),
              ),
              child: const Icon(Icons.camera_alt, size: 64, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            // Urgency selector
            const Text('Urgency Level', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            DropdownButtonFormField<String>(
              value: urgency,
              items: ['Stable', 'Injured', 'Critical'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (value) => setState(() => urgency = value!),
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            // Animal type
            const Text('Animal Type', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            DropdownButtonFormField<String>(
              value: animalType,
              items: ['Dog', 'Cat', 'Cow', 'Bird', 'Others'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (value) => setState(() => animalType = value!),
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            // Description
            const Text('Description (20-200 chars)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(
              controller: _descController,
              maxLength: 200,
              maxLines: 4,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                suffixText: '$_charCount / 200',
              ),
            ),
            const SizedBox(height: 16),
            // Location
            const Text('Location', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 8),
                  Text('Using your current location (Permission needed)'),
                ],
              ),
            ),
            const Spacer(),
            // Submit button
            SizedBox(
              width: double.infinity,
              child: RescueButton(onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
