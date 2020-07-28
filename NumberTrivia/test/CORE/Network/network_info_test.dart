import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  NetworkInfoImpl networkInfoImpl;
  MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockDataConnectionChecker);
  });
}
