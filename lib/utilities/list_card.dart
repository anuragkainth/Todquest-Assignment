import 'package:flutter/material.dart';
import 'package:todquest_assignment/constants/colors.dart';


class ListCard extends StatelessWidget {
  ListCard({Key? key, required this.email, required this.name, required this.arrival}) : super(key: key);

  final String name;
  final String arrival;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).width / 4 + 20,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 2,
                  offset: Offset(0, 0),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(16)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.width/8, width: MediaQuery.of(context).size.width/8, child: Image.asset('images/person2.png',)),
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      email,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width / 25
                      ),
                    ),
                    Text(
                      arrival,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.width / 20,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 6,),
              ],
            ),
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}
