import 'package:flutter_test/flutter_test.dart';
import 'package:dokode_flutter/repository/event_repository.dart';

void main() {
  test('idキーが存在する', () {
    final eventRepository = EventRepository.fromJson({"id": 1, 'venues': [{}]});
    expect(eventRepository.id, 1);
  });
}
