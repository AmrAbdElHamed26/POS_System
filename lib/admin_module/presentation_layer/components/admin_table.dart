import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminTable extends StatelessWidget {
  final IconData currentIcon;

  final List<String> data;

  final String tableName;

  final bool additionState;

  const AdminTable(
      {Key? key,
      required this.currentIcon,
      required this.data,
      required this.tableName,
      required this.additionState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 400,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            spreadRadius: 1.2,
            blurRadius: .3,
            offset: Offset.fromDirection(.1),
          )
        ],
        color: Colors.white38.withOpacity(.6),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      currentIcon,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      tableName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
                if (additionState == true)
                  Icon(
                    Icons.add,
                    color: Colors.black.withOpacity(.5),
                  ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.3),
                  spreadRadius: .3,
                  blurRadius: .3,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(data[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
