import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peaje_client/common.dart';

class QrJourneyPage extends StatelessWidget {
  const QrJourneyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PeajeColors.white100,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(
            left: kDefaultPadding,
            top: kDefaultPadding,
          ),
          child: Text(
            '2.',
            style: Get.textTheme.headline2!.copyWith(),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.help_outline_rounded,
              size: kiconSize / 1.5,
              color: PeajeColors.darkGrey,
            ),
          ),
        ],
      ),
      backgroundColor: PeajeColors.white100,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(
              flex: 1,
            ),
            Text(
              "Muestra el Código Qr",
              style: Get.textTheme.headline1!.copyWith(),
              textAlign: TextAlign.center,
            ),
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 10,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.asset('assets/illustrations/artboard4.png')
                          .image),
                ),
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
