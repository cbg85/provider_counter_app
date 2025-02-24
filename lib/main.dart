import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AgeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AgeScreen(),
      ),
    );
  }
}

class AgeProvider extends ChangeNotifier {
  double _age = 0; // Age starts at 0

  double get age => _age;

  void setAge(double newAge) {
    _age = newAge;
    notifyListeners();
  }
}

class AgeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ageProvider = Provider.of<AgeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Age Slider & Progress Bar')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Age: ${ageProvider.age.toInt()}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Age Slider
            Slider(
              value: ageProvider.age,
              min: 0,
              max: 99,
              divisions: 99,
              label: ageProvider.age.toInt().toString(),
              onChanged: (value) {
                ageProvider.setAge(value);
              },
            ),

            SizedBox(height: 20),

            // Progress Bar with Color Change
            LinearProgressIndicator(
              value: ageProvider.age / 99,
              backgroundColor: Colors.grey[300],
              color: _getProgressColor(ageProvider.age),
              minHeight: 20,
            ),
          ],
        ),
      ),
    );
  }

  // Function to determine progress bar color
  Color _getProgressColor(double age) {
    if (age <= 33) {
      return Colors.green;
    } else if (age <= 67) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }
}
