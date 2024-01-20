import '../../models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import '../../models/theme_manager.dart';

class CustomText extends StatelessWidget {
  final String data;
  final TextStyle? style;

  const CustomText(this.data, {Key? key, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final fontSize = themeManager.fontSize;

    return Text(
      data,
      style: style?.copyWith(fontSize: fontSize) ?? TextStyle(fontSize: fontSize),
    );
  }
}

class NearbyDoctors extends StatelessWidget {
  const NearbyDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(nearbyEmployee.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: AssetImage(nearbyEmployee[index].profile),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.crop_square,
                        color: Colors.grey[500],
                        size: 21,
                      ),
                      CustomText(
                        " ${nearbyEmployee[index].id}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                      ),
                      CustomText(
                        " ${nearbyEmployee[index].name}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      CustomText(
                        "      P0${nearbyEmployee[index].room}",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      ),
                      CustomText(
                        " _ ${nearbyEmployee[index].position}",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Row(
                  //   children: [
                  //     Icon(
                  //       Ionicons.star,
                  //       color: Colors.yellow[700],
                  //       size: 18,
                  //     ),
                  //     const Padding(
                  //       padding: EdgeInsets.only(left: 4, right: 6),
                  //       child: CustomText(
                  //         "4.0",
                  //         style: TextStyle(fontWeight: FontWeight.bold),
                  //       ),
                  //     ),
                  //     CustomText("195 Reviews")
                  //   ],
                  // )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}