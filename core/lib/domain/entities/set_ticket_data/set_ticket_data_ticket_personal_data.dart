import 'package:core/domain/entities/domain_object.dart';

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
        this.caption,
        this.mandatory,
        this.personIdentifier,
        this.type,
        required this.valueVariants,
        this.inputMask,
        this.value,
        this.valueKind,
        this.defaultValueVariant,
        this.documentIssueDateRequired,
        this.documentIssueOrRequired,
        this.documentValidityDateRequired,
        this.documentInceptionDateRequired,
        this.documentIssuePlaceRequired,
        this.value1,
        this.value2,
        this.value3,
        this.value4,
        this.value5,
        this.group,
        this.readonly,
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
