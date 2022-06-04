import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class StorageCard extends StatelessWidget {
  late String _storageName;
  late String _storageCity;
  late String _storageDescription;
  late int _storageCurrentCapacity;
  late int _storageMaxCapacity;
  late double _storageStatus;

  StorageCard(this._storageName, this._storageCity, this._storageDescription,
      this._storageCurrentCapacity, this._storageMaxCapacity);

  String get storageName => _storageName;

  set storageName(String value) {
    _storageName = value;
  }

  double get storageStatus => _storageStatus;

  setStorageStatus(String value) {
    _storageStatus = _storageCurrentCapacity / _storageMaxCapacity;
  }

  Map<String, double> getDataForPieChart() {
    int remainingSpace = _storageMaxCapacity - _storageCurrentCapacity;
    Map<String, double> dataMap = {
      "Occupied": _storageCurrentCapacity.toDouble(),
      "Free": remainingSpace.toDouble(),
    };
    return dataMap;
  }

  String get storageCity => _storageCity;

  set storageCity(String value) {
    _storageCity = value;
  }

  String get storageDescription => _storageDescription;

  set storageDescription(String value) {
    _storageDescription = value;
  }

  int get storageCurrentCapacity => _storageCurrentCapacity;

  set storageCurrentCapacity(int value) {
    _storageCurrentCapacity = value;
  }

  int get storageMaxCapacity => _storageMaxCapacity;

  set storageMaxCapacity(int value) {
    _storageMaxCapacity = value;
  }

  @override
  Widget build(BuildContext context) {
    setStorageStatus("Check");
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.5,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          )
                        ]),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width - 20,
                        height: 120,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      PieChart(
                                        dataMap: getDataForPieChart(),
                                        animationDuration:
                                            Duration(milliseconds: 800),
                                        legendOptions: LegendOptions(
                                          showLegends: false,
                                        ),
                                        chartValuesOptions: ChartValuesOptions(
                                          showChartValueBackground: false,
                                          showChartValues: false,
                                        ),
                                      )
                                    ],
                                  ),
                                  flex: 3),
                              Flexible(
                                child: SizedBox(
                                  width: 20,
                                ),
                                flex: 1,
                              ),
                              Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${_storageName}',
                                            style: TextStyle(fontSize: 28),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${_storageCity}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color.fromRGBO(
                                                    135, 135, 135, 1)),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              child: Text(
                                            '${_storageDescription}',
                                            style: TextStyle(fontSize: 11),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ))
                                        ],
                                      ),
                                    ],
                                  ),
                                  flex: 8),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (_storageStatus < 0.25)
                                      Text(
                                        '${(_storageStatus * 100).toStringAsFixed(2)}%',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green),
                                      )
                                    else if (_storageStatus < 0.50)
                                      Text(
                                        '${(_storageStatus * 100).toStringAsFixed(2)}%',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.amber),
                                      )
                                    else
                                      Text(
                                        '${(_storageStatus * 100).toStringAsFixed(2)}%',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      )
                                  ],
                                ),
                                flex: 3,
                              )
                            ],
                          ),
                        )),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
