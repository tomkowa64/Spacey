import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StorageCard extends StatelessWidget {
  late String _storageName;
  late String _storageStatus;
  late String _storageCity;
  late String _storageDescription;
  late int _storageCurrentCapacity;
  late int _storageMaxCapacity;

  StorageCard(this._storageName, this._storageCity, this._storageDescription,
      this._storageCurrentCapacity, this._storageMaxCapacity);

  String get storageName => _storageName;

  set storageName(String value) {
    _storageName = value;
  }

  String get storageStatus => _storageStatus;

  setStorageStatus(String value) {
    if (_storageCurrentCapacity / _storageMaxCapacity < 0.25) {
      _storageStatus = "Light";
    } else if (_storageCurrentCapacity / _storageMaxCapacity < 0.50) {
      _storageStatus = "Average";
    } else {
      _storageStatus = "Overloaded";
    }
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
                                      if (_storageStatus == "Light")
                                        CircleAvatar(
                                          child: Text(""),
                                          radius: 35,
                                          backgroundColor: Colors.green,
                                        )
                                      else if (_storageStatus == "Average")
                                        CircleAvatar(
                                          child: Text(""),
                                          radius: 35,
                                          backgroundColor: Colors.yellow,
                                        )
                                      else
                                        CircleAvatar(
                                          child: Text(""),
                                          radius: 35,
                                          backgroundColor: Colors.red,
                                        )
                                    ],
                                  ),
                                  flex: 2),
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
                                  flex: 6),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('${_storageCurrentCapacity}'),
                                    Divider(color: Colors.black),
                                    Text(
                                      '${_storageMaxCapacity}',
                                    )
                                  ],
                                ),
                                flex: 1,
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
