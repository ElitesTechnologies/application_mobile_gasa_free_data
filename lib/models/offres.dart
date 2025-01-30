class AllOffres {
  bool? success;
  String? message;
  List<Offres>? offres;

  AllOffres({this.success, this.message, this.offres});

  AllOffres.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      offres = <Offres>[];
      json['data'].forEach((v) {
        offres!.add(Offres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['message'] = message;
    if (offres != null) {
      data['data'] = offres!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Offres {
  int? id;
  int? quantite;
  int? prix;

  Offres({this.id, this.quantite, this.prix});

  Offres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantite = json['quantité'];
    prix = json['prix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['quantité'] = quantite;
    data['prix'] = prix;
    return data;
  }
}
