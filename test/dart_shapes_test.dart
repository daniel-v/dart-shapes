// Copyright (c) 2017, AndrÃ¡s SzepeshÃ¡zi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:math';
import 'package:dart_shapes/shapes.dart';
import 'package:test/test.dart';

void main() {
  test('Circle area', () {
    expect(new Circle(1).area(), PI);
  });
  test('Circle circumference', () {
    expect(new Circle(1).circumference(), 2 * PI);
  });
}
