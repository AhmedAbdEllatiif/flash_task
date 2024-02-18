import 'package:flash_task/currency_exchange/data/data_source/currency_data_source.dart';
import 'package:flash_task/currency_exchange/data/models/exchange_rate_model.dart';
import 'package:flash_task/currency_exchange/data/params/exchange_rate_params.dart';
import 'package:flash_task/currency_exchange/domain/repositories/currency_remote_repository.dart';
import 'package:flash_task/currency_exchange/domain/use_cases/get_exchange_rate_case.dart';
import 'package:flash_task/currency_exchange/logic/latest_exchange_rate/get_exchange_rate_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('Currency Exchange DataSource', () {
    // init ExchangeRateParams
    final params = MockExchangeRateParams.createMock();

    // mock dataSource
    final mockDataSource = MockCurrencyDataSource();

    ///
    ///
    /// test fetching Currency Exchange
    ///
    test("""
          Test the return type  of function "getLatestExchangeRate" 
    """, () async {
      //>>>> arrange
      when(() => mockDataSource.getLatestExchangeRate(params))
          .thenAnswer((_) async => ExchangeRateModel.empty());

      //>>>> action
      final result = await mockDataSource.getLatestExchangeRate(params);

      //>>>> assert
      expect(result, isA<ExchangeRateModel>());
    });

    ///
    ///
    /// test fetching Currency Exchange using cubit
    ///
    test("""
          Test calling "getLatestExchangeRate" from the cubit
    """, () async {
      // repository
      final repository =
          MockCurrencyExchangeRepository.createMock(mockDataSource);

      // useCase
      final useCase = GetExchangeRateCase(remoteRepository: repository);

      // system under test
      final sut = GetExchangeRateCubit(useCase: useCase);

      //>>>> arrange
      when(() => mockDataSource.getLatestExchangeRate(params))
          .thenAnswer((_) async => ExchangeRateModel.empty());

      //>>>> action
      sut.tryToFetchExchangeRate(baseCurrency: "EUR", rateCurrencies: ['EGP']);

      //>>> assert
      verify(() => mockDataSource.getLatestExchangeRate(params)).called(2);
    });
  });
}

///
///
///
/// mock for [CurrencyDataSource]
///
class MockCurrencyDataSource extends Mock implements CurrencyDataSource {}

///
///
///
/// mock for [CurrencyRemoteRepo]
///
class MockCurrencyExchangeRepository {
  static CurrencyRemoteRepo createMock(CurrencyDataSource dataSource) {
    return CurrencyRemoteRepoImpl(dataSource: dataSource);
  }
}

///
///
///
/// mock for [ExchangeRateParams]
///
class MockExchangeRateParams {
  static ExchangeRateParams createMock() {
    return ExchangeRateParams(
      baseCurrency: 'EUR',
      rateCurrencies: const ['EGP'],
    );
  }
}
