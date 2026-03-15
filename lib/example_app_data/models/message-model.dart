import 'package:practicee/example_app_data/models/user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message(this.sender, this.time, this.text, this.isLiked, this.unread);
}

//current user
final User currentUser = User(0, 'Vipul',
    'https://www.omgubuntu.co.uk/wp-content/uploads/2018/06/github-logo.jpeg');

//users
final User user1 = User(1, 'user1',
    'https://www.omgubuntu.co.uk/wp-content/uploads/2018/06/github-logo.jpeg');
final User user2 = User(2, 'user2',
    'https://www.omgubuntu.co.uk/wp-content/uploads/2018/06/github-logo.jpeg');
final User user3 = User(3, 'user3',
    'https://www.omgubuntu.co.uk/wp-content/uploads/2018/06/github-logo.jpeg');
final User user4 = User(4, 'user4',
    'https://www.omgubuntu.co.uk/wp-content/uploads/2018/06/github-logo.jpeg');
final User user5 = User(5, 'user5',
    'https://www.omgubuntu.co.uk/wp-content/uploads/2018/06/github-logo.jpeg');
final User user6 = User(6, 'user6',
    'https://www.omgubuntu.co.uk/wp-content/uploads/2018/06/github-logo.jpeg');
final User user7 = User(7, 'user7',
    'https://www.omgubuntu.co.uk/wp-content/uploads/2018/06/github-logo.jpeg');
final User user8 = User(8, 'user8',
    'https://www.omgubuntu.co.uk/wp-content/uploads/2018/06/github-logo.jpeg');
final User user9 = User(9, 'user9',
    'https://www.omgubuntu.co.uk/wp-content/uploads/2018/06/github-logo.jpeg');
final User user10 = User(10, 'user10',
    'https://www.omgubuntu.co.uk/wp-content/uploads/2018/06/github-logo.jpeg');
final User user11 = User(11, 'user11',
    'https://www.omgubuntu.co.uk/wp-content/uploads/2018/06/github-logo.jpeg');
final User user12 = User(12, 'user12',
    'https://www.omgubuntu.co.uk/wp-content/uploads/2018/06/github-logo.jpeg');
final User user13 = User(13, 'user13',
    'https://www.omgubuntu.co.uk/wp-content/uploads/2018/06/github-logo.jpeg');
final User user14 = User(14, 'user14',
    'https://www.omgubuntu.co.uk/wp-content/uploads/2018/06/github-logo.jpeg');
final User user15 = User(15, 'user15',
    'https://www.omgubuntu.co.uk/wp-content/uploads/2018/06/github-logo.jpeg');

//favourite contacts
List<User> favourite = [
  user1,
  user2,
  user3,
  user4,
  user5,
  user6,
  user7,
  user8,
  user9,
  user10,
  user11,
  user12,
  user13,
  user14,
  user15
];
