class HomeModel {}

class HomePageData {
  List<RestaurantDataModel> restaurants = [];
  List<ServiceModel> services = [];
  HomePageData.fromJson(List<dynamic> json){
    json.forEach((element){
      restaurants.add( RestaurantDataModel.fromJson(element));
    });

    // json['services'].forEach((element){
    //   services.add(element);
    // });
  }
}

class RestaurantDataModel {
    int? restaurantId;
    String? restaurantName;
    String? restaurantDescription;
    String? restaurantCoverImage;
    String? restaurantLogoImage;


    RestaurantDataModel.fromJson(Map<String, dynamic> json){
      restaurantId = json['restaurantId'];
      restaurantName = json['restaurantName'];
      restaurantDescription = json['restaurantDescription'];
      restaurantCoverImage = json['restaurantCoverImage'];
      restaurantLogoImage = json['restaurantLogoImage'];
    }
}

class ServiceModel {

}
