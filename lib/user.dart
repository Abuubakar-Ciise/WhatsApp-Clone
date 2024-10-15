class User {
  final String imageURL;
  final String name;
  final String role;
  final String message;
  final String time;
  final String subtitle;

  final String callTime; 
  final bool isOutgoingCall; 

  User({
    required this.imageURL,
    required this.name,
    required this.role,
    required this.message,
    required this.time,
    required this.subtitle,
    required this.callTime,
    required this.isOutgoingCall,
  });
}

class Data {
  final String imageURL;
  final String name;
  final String subtitle;

  Data({
    required this.imageURL,
    required this.name,
    required this.subtitle,
  });
}
