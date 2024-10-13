import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Rating Stars Example'),
        ),
        body: Center(
          child: StarRating(),
        ),
      ),
    );
  }
}

class StarRating extends StatefulWidget {
  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _selectedStarIndex = 0; // Zmienna przechowująca liczbę zaznaczonych gwiazdek

  // Funkcja wywoływana po kliknięciu na gwiazdkę
  void _onStarTap(int index) {
    setState(() {
      _selectedStarIndex = index; // Ustawiamy nową wartość dla liczby zaznaczonych gwiazdek
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < _selectedStarIndex
                ? Icons.star
                : Icons.star_border, // Zaznaczone gwiazdki są wypełnione, a pozostałe puste
            color: Colors.white,
            size: 40.0,
          ),
          onPressed: () {
            _onStarTap(index + 1); // Kliknięcie na gwiazdkę ustawia indeks (1-based)
          },
        );
      }),
    );
  }
}