import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/5Travel_Desc/travel_desc_cubit.dart';
import '../../../business_logic/5Travel_Desc/travel_desc_state.dart';
import '../../../data/models/1Travel_Model.dart';
import '../../screens/4Bus_Screen/bus_view.dart';

class User_List extends StatelessWidget {
  final TravelModel travels2;

  final List travels;
  final int index;

  User_List({
    super.key,
    required this.travels2,
    required this.travels,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Travel_Desc_Cubit, Travel_Desc_States>(
      builder: (context, state) {
        Travel_Desc_Cubit cubit = Travel_Desc_Cubit.get(context);

        return ListTile(
          leading: Container(
            width: 40,
            height: 40,
            child: CircleAvatar(
              child: Text(
                (index + 1).toString(),
                style: TextStyle(
                    fontSize: 15, fontFamily: "bold", color: Colors.white),
              ),
              backgroundColor: Color(0xffD6A4DE),
            ),
          ),
          title: Text(travels[index]["name"].toString()),
          subtitle: Text(
              '${travels[index]["country"]} /  ${travels[index]["phone"]}'),
        );
      },
    );
  }
}
