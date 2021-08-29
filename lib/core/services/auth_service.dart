import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:peaje_client/core/global/environment.dart';

/// Este servicio sirve para manejar el secure storage del token
class AuthService {
  /// Direccion principal de nuestro servidor
  final String uri = Environment.apiUrl;

  /// Funcion que obtiene el token del dispositivo
  static Future<String> getToken() async {
    final FlutterSecureStorage _storage = new FlutterSecureStorage();

    String? token = await _storage.read(key: 'token');

    return token!;
  }

  /// Funcion que borra el token del dispositivo
  static Future<void> deleteToken() async {
    final FlutterSecureStorage _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }
}
