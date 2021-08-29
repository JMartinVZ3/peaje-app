import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peaje_client/colors.dart';
import 'package:peaje_client/common.dart';

void appFlowDialog() {
  Get.dialog(Dialog(
    backgroundColor: PeajeColors.darkGrey,
    elevation: 2,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius * 2)),
    child: _Body(),
  ));
}

/// Widget que contiene el cuerpo del dialog
class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      height: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StartJourneyButton(),
          Divider(
            color: PeajeColors.white100,
            thickness: 0.5,
          ),
          GenerateQrButton(),
          Divider(
            color: PeajeColors.white100,
            thickness: 0.5,
          ),
          EndJourneyButton(),
        ],
      ),
    );
  }
}

/// Boton para comenzar el viaje del usuario
class StartJourneyButton extends StatelessWidget {
  const StartJourneyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Comenzar viaje',
            style: Get.textTheme.bodyText2!.copyWith(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 5,
                    spreadRadius: 5),
              ],
              color: PeajeColors.darkGrey,
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
            child: Icon(
              Icons.play_arrow_rounded,
              color: PeajeColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

/// Boton que genera el codigo qr que sera escaneado por el peaje
class GenerateQrButton extends StatelessWidget {
  const GenerateQrButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Generar Qr',
            style: Get.textTheme.bodyText2!.copyWith(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 5,
                    spreadRadius: 5),
              ],
              color: PeajeColors.darkGrey,
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
            child: Icon(
              Icons.qr_code,
              color: PeajeColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

/// Boton que sirve para finalizar el viaje
class EndJourneyButton extends StatelessWidget {
  const EndJourneyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Terminar viaje',
            style: Get.textTheme.bodyText2!.copyWith(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 5,
                    spreadRadius: 5),
              ],
              color: PeajeColors.darkGrey,
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
            child: Icon(
              Icons.flag_rounded,
              color: PeajeColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
