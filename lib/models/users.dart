class Users {
  int? id;
  String? matricule;
  String? email;
  String? name;
  String? prenom;
  String? numTel;
  String? numMomo;
  String? numMomo2;

  Users(
      {this.id,
        this.matricule,
        this.email,
        this.name,
        this.prenom,
        this.numTel,
        this.numMomo,
        this.numMomo2});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matricule = json['matricule'];
    email = json['email'];
    name = json['name'];
    prenom = json['prenom'];
    numTel = json['numTel'];
    numMomo = json['numMomo'];
    numMomo2 = json['numMomo2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['matricule'] = this.matricule;
    data['email'] = this.email;
    data['name'] = this.name;
    data['prenom'] = this.prenom;
    data['numTel'] = this.numTel;
    data['numMomo'] = this.numMomo;
    data['numMomo2'] = this.numMomo2;
    return data;
  }
}
