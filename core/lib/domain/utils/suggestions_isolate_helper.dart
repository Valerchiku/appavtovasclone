import 'dart:isolate';

import 'package:core/avtovas_model.dart';
import 'package:core/domain/utils/suggestions_comparators.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

final class SuggestionsHelperIsolate {
  final List<BusStop>? suggestions;

  const SuggestionsHelperIsolate(this.suggestions);

  Future<List<String>?> spawnIsolate() {
    return Isolate.run<List<String>?>(_sortSuggestions);
  }

  Future<List<String>?> asyncSorting() async => _sortSuggestions();

  List<String>? _sortSuggestions() {
    final uniqueBusStops = Set.of(suggestions ?? <BusStop>[]);

    final busStopsSuggestions = uniqueBusStops
        .map(
          (busStop) => [
            busStop.name,
            if (busStop.district?.isNotEmpty ?? false) busStop.district,
            if (busStop.region?.isNotEmpty ?? false) busStop.region,
          ].where((value) => value != null).join(', '),
        )
        .toList()
      ..sort();

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

    return busStopsSuggestions;
  }
}

final class DestinationSuggestionsHelperIsolate {
  final List<BusStop>? suggestions;

  const DestinationSuggestionsHelperIsolate(this.suggestions);

  Future<List<String>?> spawnIsolate() {
    return Isolate.run<List<String>?>(_sortSuggestions);
  }

  Future<List<String>?> asyncSorting() async => _sortSuggestions();

  List<String>? _sortSuggestions() {
    final retainedBusStops = List.of(suggestions ?? <BusStop>[])
      ..retainWhere(
        (element) => destinations.contains(element.name),
      );

    final uniqueBusStops = Set.of(retainedBusStops);

    final busStopsSuggestions = uniqueBusStops
        .map(
          (busStop) => [
            busStop.name,
            if (busStop.district?.isNotEmpty ?? false) busStop.district,
            if (busStop.region?.isNotEmpty ?? false) busStop.region,
          ].where((value) => value != null).join(', '),
        )
        .toList()
      ..sort();

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

    return busStopsSuggestions;
  }
}
