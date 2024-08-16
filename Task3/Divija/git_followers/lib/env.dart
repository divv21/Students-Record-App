import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied(path: '.env') // Specify the path to your .env file
abstract class Env {
  @EnviedField(varName: 'BEARER_TOKEN')
  static final String bearerToken = _Env.bearerToken;
}