#!/bin/bash
flutter test test/creadorPersonajes_test.dart --coverage && genhtml coverage/lcov.info --output=resultado
