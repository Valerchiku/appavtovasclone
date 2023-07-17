// ignore_for_file: directives_ordering
// ignore_for_file: dangling_library_doc_comments

/// REGION - entities.

export 'package:core/src/domain/entities/trip.dart';

/// EMD REGION.

/// REGION - repository interfaces.

export 'package:core/src/domain/interfaces/i_trips_repository.dart';

/// END REGION.

/// REGION - data source interfaces.

export 'package:core/src/data/data_sources/interfaces/i_trip_data_source.dart';

/// END REGION.

/// REGION - data source implementations.

export 'package:core/src/data/data_sources/trip_data_source.dart';

/// END REGION.

/// REGION - repository implementations.

export 'package:core/src/data/repositories/trip_repository.dart';

/// END REGION.

/// REGION - interactors.

export 'package:core/src/domain/interactors/main_search_interactor.dart';

/// END REGION.
