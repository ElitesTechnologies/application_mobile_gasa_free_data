class AllPayments {
  bool? success;
  String? message;
  List<Payments>? payments;

  AllPayments({this.success, this.message, this.payments});

  AllPayments.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    payments = [];

    if (json['data'] != null) {
      json['data'].forEach((key, value) {
        payments!.add(Payments.fromJson(value));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['message'] = message;
    if (payments != null) {
      data['data'] = payments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Payments {
  int? id;
  int? montant;
  String? status;
  String? methode;
  String? date;
  int? idEtudiant;

  Payments({
    this.id,
    this.montant,
    this.status,
    this.methode,
    this.date,
    this.idEtudiant,
  });

  Payments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    montant = json['montant'];
    status = json['status'];
    methode = json['methode'];
    date = json['date'];
    idEtudiant = json['id_etudiant'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'montant': montant,
      'status': status,
      'methode': methode,
      'date': date,
      'id_etudiant': idEtudiant,
    };
  }
}
