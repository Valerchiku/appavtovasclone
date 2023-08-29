import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/set_ticket_data/value_variant.dart';

final class SetTicketDataTicketPersonalData extends DomainObject {
  
final String name;
final String caption;
final String mandatory;
final String personIdentifier;
final String type;
final List<ValueVariant> valueVariants;
final String inputMask;
final String value;
final String valueKind;
final ValueVariant defaultValueVariant;
final String documentIssueDateRequired;
final String documentIssueOrRequired;
final String documentValidityDateRequired;
final String documentInceptionDateRequired;
final String documentIssuePlaceRequired;
final String value1;
final String value2;
final String value3;
final String value4;
final String value5;
final String group;
final String readonly;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        caption,
        mandatory,
        personIdentifier,
        type,
        valueVariants,
        inputMask,
        value,
        valueKind,
        defaultValueVariant,
        documentIssueDateRequired,
        documentIssueOrRequired,
        documentValidityDateRequired,
        documentInceptionDateRequired,
        documentIssuePlaceRequired,
        value1,
        value2,
        value3,
        value4,
        value5,
        group,
        readonly,
      ];

  const SetTicketDataTicketPersonalData({
        required this.name,
        required this.caption,
        required this.mandatory,
        required this.personIdentifier,
        required this.type,
        required this.valueVariants,
        required this.inputMask,
        required this.value,
        required this.valueKind,
        required this.defaultValueVariant,
        required this.documentIssueDateRequired,
        required this.documentIssueOrRequired,
        required this.documentValidityDateRequired,
        required this.documentInceptionDateRequired,
        required this.documentIssuePlaceRequired,
        required this.value1,
        required this.value2,
        required this.value3,
        required this.value4,
        required this.value5,
        required this.group,
        required this.readonly,
  });

  @override
  SetTicketDataTicketPersonalData copyWith() {
    return SetTicketDataTicketPersonalData(
        name: name,
        caption: caption,
        mandatory: mandatory,
        personIdentifier: personIdentifier,
        type: type,
        valueVariants: valueVariants,
        inputMask: inputMask,
        value: value,
        valueKind: valueKind,
        defaultValueVariant: defaultValueVariant,
        documentIssueDateRequired: documentIssueDateRequired,
        documentIssueOrRequired: documentIssueOrRequired,
        documentValidityDateRequired: documentValidityDateRequired,
        documentInceptionDateRequired: documentInceptionDateRequired,
        documentIssuePlaceRequired: documentIssuePlaceRequired,
        value1: value1,
        value2: value2,
        value3: value3,
        value4: value4,
        value5: value5,
        group: group,
        readonly: readonly,
    );
  }
}
