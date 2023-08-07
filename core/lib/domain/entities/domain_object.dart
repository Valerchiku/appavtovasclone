import 'package:equatable/equatable.dart';

abstract class DomainObject extends Equatable{
  const DomainObject();

  DomainObject copyWith();
}
