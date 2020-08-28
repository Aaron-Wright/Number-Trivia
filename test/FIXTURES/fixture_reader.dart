import 'dart:io';

String fixture(String name) => File('test/FIXTURES/$name').readAsStringSync();
