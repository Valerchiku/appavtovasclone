import 'dart:convert';

import 'package:core/data/mappers/avibus/avibus_mapper.dart';
import 'package:core/domain/entities/avibus/avibus.dart';

abstract final class AvibusConverter {
  static List<Avibus>? avibusListFromEntries(
    List<String>? avibusEntries,
  ) {
    return avibusEntries
        ?.map(
          (entry) => AvibusMapper().fromJson(
            jsonDecode(entry),
          ),
        )
        .toList();
  }
}
