import 'package:core/domain/entities/domain_object.dart';

final class SeatsScheme extends DomainObject {
  final String xPos;
  final String yPos;
  final String seatNum;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        xPos,
        yPos,
        seatNum,
      ];

  const SeatsScheme({
    required this.xPos,
    required this.yPos,
    required this.seatNum,
  });

  @override
  SeatsScheme copyWith() {
    return SeatsScheme(
      xPos: xPos,
      yPos: yPos,
      seatNum: seatNum,
    );
  }
}
