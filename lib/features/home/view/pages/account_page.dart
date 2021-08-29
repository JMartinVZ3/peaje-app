import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:peaje_client/colors.dart';
import 'package:peaje_client/common.dart';
import 'package:peaje_client/core/services/auth_service.dart';
import 'package:peaje_client/features/auth/domain/entities/user.dart';
import 'package:peaje_client/features/auth/view/controllers/user_controller.dart';
import 'package:peaje_client/routes/app_pages.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PeajeColors.darkGrey,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            _DisplayUserImage(),
            _DisplayUserInformation(),
          ],
        ),
      ),
    );
  }
}

/// Este widget muestra la imagen del usuario
class _DisplayUserImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Importamos el controlador que contiene el usuario
    final UserController userController = Get.find<UserController>();
    final User user = userController.user;

    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      color: PeajeColors.darkGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: kDefaultPadding,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.175,
            width: MediaQuery.of(context).size.height * 0.175,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius * 2.5),
              image: DecorationImage(
                image: Image.network(user.photoUrl).image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            '${user.name} ${user.lastName}',
            style: Get.textTheme.bodyText1!.copyWith(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          Text(
            '${user.city}',
            style: Get.textTheme.bodyText2!
                .copyWith(color: PeajeColors.grey, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _DisplayUserInformation extends StatelessWidget {
  const _DisplayUserInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.25,
      decoration: BoxDecoration(
          color: PeajeColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kBorderRadius * 3),
            topRight: Radius.circular(kBorderRadius * 3),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: kDefaultPadding,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              bottom: 20,
            ),
            child: Text(
              "Información",
              style: Get.textTheme.bodyText1,
            ),
          ),
          Container(
            height: 80,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                _CustomCard(
                  svg: 'assets/icons/identifier.svg',
                  title: 'Cédula',
                  onTap: () {
                    Get.toNamed(Routes.USER_IDENTIFIER);
                  },
                ),
                _CustomCard(
                  svg: 'assets/icons/datos.svg',
                  title: 'Datos',
                  onTap: () {
                    Get.toNamed(Routes.USER_INFORMATION);
                  },
                ),
                _CustomCard(
                  svg: 'assets/icons/soporte.svg',
                  title: 'Soporte',
                  onTap: () {
                    print('Hola');
                  },
                ),
                _CustomCard(
                  svg: 'assets/icons/calificar.svg',
                  title: 'Calificar',
                  onTap: () {
                    print('Hola');
                  },
                ),
                _CustomCard(
                  svg: 'assets/icons/close.svg',
                  title: 'Cerrar Sesión',
                  onTap: () async {
                    await AuthService.deleteToken();
                    Get.back();
                    Get.back();
                    Get.back();
                    Get.toNamed(Routes.SLIDESHOW);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              bottom: 20,
            ),
            child: Text(
              "Viajes",
              style: Get.textTheme.bodyText1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomCard extends StatelessWidget {
  final String svg;
  final String title;
  final Function() onTap;
  const _CustomCard({
    Key? key,
    required this.svg,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 20),
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius * 2.5),
          color: PeajeColors.yellow,
        ),
        child: Column(children: [
          Expanded(
            child: SvgPicture.asset(
              this.svg,
            ),
          ),
          Text(
            this.title,
            style: Get.textTheme.bodyText2!.copyWith(fontSize: 14),
          ),
        ]),
      ),
    );
  }
}
