import 'package:flutter/material.dart';

class SettingRow extends StatelessWidget {
  const SettingRow(
      {super.key,
      required this.edit,
      required this.data,
      required this.ontap,
      required this.icon});
  final String edit;
  final String data;
  final Function() ontap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            children: [
              icon,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  edit,
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  data,
                  style: TextStyle(
                      color: Theme.of(context).hintColor, fontSize: 15),
                ),
              ),
              InkWell(
                onTap: ontap,
                child: Icon(
                  color: Theme.of(context).hintColor,
                  Icons.arrow_forward_ios_sharp,
                  size: 15,
                ),
              )
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
