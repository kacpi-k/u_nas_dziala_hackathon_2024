import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/common/widgets/appbar/app_bar.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Center(child: Text('Harmonogram', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _createDataTable(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

DataTable _createDataTable(){
  return DataTable(columns: _columns(), rows: _rows(),columnSpacing: 16,);
}

List<DataColumn> _columns(){
  return [
    DataColumn(
    
    label: Text('Wydarzenie',)),
    DataColumn(
    label: Text('Zakończenie')),
    DataColumn(
    label: Text('Rozpoczęcie'))
  ];
}
List<DataRow> _rows(){
  return[
    DataRow(
      cells: [
      DataCell(Text('8:00')),
      DataCell(Text('9:00')),
      DataCell(Text('Sniadanie'))
    ]),
     DataRow(cells: [
      DataCell(Text('9:00')),
      DataCell(Text('11:00')),
      DataCell(Text('Panel "Java dla poczatkujacych"'))
    ])

  ];
}


