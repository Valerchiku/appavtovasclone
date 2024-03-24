import 'dart:isolate';

import 'package:common/avtovas_utils.dart';
import 'package:core/avtovas_model.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

final class SuggestionsHelperIsolate {
  final List<BusStop>? suggestions;

  const SuggestionsHelperIsolate(this.suggestions);

  Future<List<String>?> spawnIsolate() {
    return Isolate.run<List<String>?>(_sortSuggestions);
  }

  List<String>? _sortSuggestions() {
    final busStopsSuggestions = suggestions
        ?.map(
          (busStop) => [
            busStop.name,
            if (busStop.district?.isNotEmpty ?? false) busStop.district,
            if (busStop.region?.isNotEmpty ?? false) busStop.region,
          ].where((value) => value != null).join(', '),
        )
        .toList()
      ?..sort();

    if (busStopsSuggestions != null) {
      for (final comparator in stationComparators) {
        busStopsSuggestions.whereMoveToTheFront(
          (busStop) => basicBusStopComparator(busStop, comparator),
        );
      }

      for (final comparator in cityComparators) {
        busStopsSuggestions.whereMoveToTheFront(
          (busStop) => basicBusStopComparator(busStop, comparator),
        );
      }
    }

    return busStopsSuggestions;
  }
}
