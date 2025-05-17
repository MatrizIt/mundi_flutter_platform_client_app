import 'modality.dart';

class Schedule {
  int id;
  String scheduledDate;
  int userUserId;
  int entrepreneurEntrepreneurId;
  Modality modality;
  String cep;
  String entrepreneurPhone;
  String? status;

  Schedule(
      {required this.id,
      required this.entrepreneurEntrepreneurId,
      required this.scheduledDate,
      required this.userUserId,
      required this.status,
      required this.modality,
      required this.cep,
      required this.entrepreneurPhone});

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
        id: map['id'],
        userUserId: map['user']['userId'],
        entrepreneurEntrepreneurId: map['entrepreneur']['entrepreneurId'],
        scheduledDate: map['scheduledDate'],
        status: map['status'],
        cep: map['entrepreneur']['cep'],
        modality: Modality.fromMap(map['modality']),
        entrepreneurPhone: map['entrepreneur']['phone']);
  }

  @override
  String toString() {
    return 'Schedule{id: $id, scheduledDate: $scheduledDate, userUserId: $userUserId, entrepreneurEntrepreneurId: $entrepreneurEntrepreneurId, modality: $modality, cep: $cep, entrepreneurPhone: $entrepreneurPhone, status: $status}';
  }
}
