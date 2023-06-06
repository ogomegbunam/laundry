class CarouselModel{
  String image;
  String title;
  String description;

  CarouselModel(this.image, this.title, this.description);

  static List<CarouselModel> getCarousels() => [
    CarouselModel("assets/baseapp/slideEat.png", "Hungry?", "With ieat you can source for the food of your choice and get it deliver to you."),
    CarouselModel("assets/baseapp/slideDrive.png", "Got an occassion to go?", "iRide is currently trending in taking you to any location of your choice."),
    CarouselModel("assets/baseapp/slideChat.png", "You can do a lot!", "From a single app you can make your daily living hassile-free, explore."),
  ];
}