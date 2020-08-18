class CustomUser{

  String id;
  String phoneNumber;
  String name;
  String email;

  CustomUser(this.id, this.phoneNumber, this.name, this.email);

  CustomUser.fromMap(Map snapshot, String id) :
      id = id ?? '',
      phoneNumber = snapshot['phoneNumber'] ?? '',
      name = snapshot['name'] ?? '',
      email = snapshot['email'] ?? '';

  toJson(){
    return{
      "name":name,
      "phoneNumber":phoneNumber,
      "email":email
    };
  }

}