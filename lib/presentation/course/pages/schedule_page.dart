import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/common/widgets/appbar/app_bar.dart';

class SchedulePage extends StatelessWidget {
  
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Center(child: Text('Harmonogram', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
            Expanded(
              child: ListView(
                children: [
                  StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('Courses').doc('blabla').snapshots(),
                    builder: (context, snapshot) {
                      //var courseScheduleData = snapshot.data;
                      return Padding(
                        
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: _createDataTable(),
                      );
                    }
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
    const DataColumn(
    
    label: Text('Wydarzenie',)),
    const DataColumn(
    label: Text('Zakończenie')),
    const DataColumn(
    label: Text('Rozpoczęcie'))
  ];
}

List<DataRow> _rows()=> [
    const DataRow(
      cells: [
      DataCell(Text('8:00')),
      DataCell(Text('9:00')),
      DataCell(Text('Sniadanie'))
    ]),
     const DataRow(cells: [
      DataCell(Text('9:00')),
      DataCell(Text('11:00')),
      DataCell(Text('Panel IT '))
    ]),
    const DataRow(cells: [
      DataCell(Text('11:00')),
      DataCell(Text('12:00')),
      DataCell(Text('Lunch'))
    ]),
    const DataRow(cells: [
      DataCell(Text('12:00')),
      DataCell(Text('14:30')),
      DataCell(Text('Panel Businessplan '))
    ]),
    const DataRow(cells: [
      DataCell(Text('14:30')),
      DataCell(Text('16:00')),
      DataCell(Text('Panel PIT/ CIT 2024 '))
    ]),


  ];


