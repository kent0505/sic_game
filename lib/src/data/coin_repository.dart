import 'package:shared_preferences/shared_preferences.dart';

import '../core/config/constants.dart';

abstract interface class CoinRepository {
  const CoinRepository();

  double getCoins();

  Future<void> addCoins(double amount);
}

final class CoinRepositoryImpl implements CoinRepository {
  CoinRepositoryImpl({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  double getCoins() {
    return _prefs.getDouble(Keys.coins) ?? 100000;
  }

  @override
  Future<void> addCoins(double amount) async {
    await _prefs.setDouble(Keys.coins, amount);
  }
}
