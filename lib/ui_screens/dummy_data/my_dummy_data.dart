
class Content {
  final String title, description, imagePath;

  bool isLiked;

  Content(
      {required this.title,
      required this.isLiked,
      required this.description,
      required this.imagePath});
}

final List<Content> myContents = [
  Content(
    title: 'title1',
    description:
        'A good muslim is one who is always nice to everyone, and forgive him those who are wrong with, and who per his/ her prayers and recite the holy Quran five times a day.',
    imagePath: 'assets/images/opinion_image (1).jpg',
  isLiked: false,),
  Content(
      title: 'title2',
      description: 'description2',
      imagePath: 'assets/images/opinion_image (2).jpg',
    isLiked: false,),
  Content(
      title: 'title3',
      description: 'description3',
      imagePath: 'assets/images/opinion_image (3).jpg',
    isLiked: false,),
  Content(
      title: 'title4',
      description: 'description4',
      imagePath: 'assets/images/opinion_image (4).jpg',
    isLiked: false,),
  Content(
      title: 'title5',
      description: 'description5',
      imagePath: 'assets/images/opinion_image (5).jpg',
    isLiked: false,),
  Content(
      title: 'title6',
      description: 'description6',
      imagePath: 'assets/images/opinion_image (6).jpg',
    isLiked: false,),
];

class EventDescriptionData{

  final String title,desc,date,time,eventImagePath,eventHostPath,location;
  final num price, totalTime,totalSlots,filledSlots;

  EventDescriptionData(
      {required this.title, required this.date, required this.time, required this.eventImagePath, required this.eventHostPath, required this.price, required this.totalSlots, required this.filledSlots, required this.desc, required this.location, required this.totalTime});
}

List<EventDescriptionData> myEventsDummyData =[
EventDescriptionData(title: 'title1', date: 'Jun 16, 2022 Thursday', time: '22:12', eventImagePath: 'eventImagePath', eventHostPath: 'eventHostPath', price: 55, totalSlots: 33, filledSlots: 11, desc: 'desc', location: 'location', totalTime: 90),
EventDescriptionData(title: 'title', date: 'date', time: 'time', eventImagePath: 'eventImagePath', eventHostPath: 'eventHostPath', price: 55, totalSlots: 33, filledSlots: 11, desc: 'desc', location: 'location', totalTime: 90),
EventDescriptionData(title: 'title', date: 'date', time: 'time', eventImagePath: 'eventImagePath', eventHostPath: 'eventHostPath', price: 55, totalSlots: 33, filledSlots: 11, desc: 'desc', location: 'location', totalTime: 90),
EventDescriptionData(title: 'title', date: 'date', time: 'time', eventImagePath: 'eventImagePath', eventHostPath: 'eventHostPath', price: 55, totalSlots: 33, filledSlots: 11, desc: 'desc', location: 'location', totalTime: 90),
EventDescriptionData(title: 'title', date: 'date', time: 'time', eventImagePath: 'eventImagePath', eventHostPath: 'eventHostPath', price: 55, totalSlots: 33, filledSlots: 11, desc: 'desc', location: 'location', totalTime: 90),
  ];


class User{
  User(this.name,this.imagePath,this.countryFlag,this.isProfileImage);
  String name,imagePath,countryFlag;
  bool isProfileImage;
}


List<User> usersDemoData=[
  User('Luis Suarez', 'assets/images/suarez.jpg','assets/icons_png/us_flag.png', true),
  User('Mike Posner', 'assets/images/suarez.jpg','assets/icons_png/us_flag.png', false),
  User('Tye Tremblay', 'assets/images/suarez.jpg','assets/icons_png/us_flag.png', false),
  User('Nilesh Katatiya', 'assets/images/suarez.jpg','assets/icons_png/us_flag.png', false),
  User('Test User', 'assets/images/suarez.jpg','assets/icons_png/us_flag.png', false),
  User('Mathew Gill', 'assets/images/suarez.jpg','assets/icons_png/us_flag.png', false),
  User('Sam Beck', 'assets/images/suarez.jpg','assets/icons_png/us_flag.png', false),
  User('Adeel Ahmed', 'assets/images/suarez.jpg','assets/icons_png/us_flag.png', false),
  User('Muhammad Bilal', 'assets/images/suarez.jpg','assets/icons_png/us_flag.png', false),
];