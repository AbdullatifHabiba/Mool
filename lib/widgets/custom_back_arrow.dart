import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBackArrow extends StatelessWidget {
  const CustomBackArrow({super.key, this.onPressed
  });
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:onPressed?? () {
        Navigator.of(context).pop();
      },
      //'assets/images/back.svg'
      icon: SvgPicture.asset('assets/images/back.svg',
           height: 50.0, width: 50.0
      ),
    );
  }
}
