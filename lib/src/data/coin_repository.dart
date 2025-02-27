import 'package:shared_preferences/shared_preferences.dart';

import '../core/config/constants.dart';

abstract interface class CoinRepository {
  const CoinRepository();

  int getCoins();

  Future<void> saveCoins(int amount);
}

final class CoinRepositoryImpl implements CoinRepository {
  CoinRepositoryImpl({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  int getCoins() {
    return _prefs.getInt(Keys.coins) ?? 100000;
  }

  @override
  Future<void> saveCoins(int amount) async {
    await _prefs.setInt(Keys.coins, amount);
  }
}
