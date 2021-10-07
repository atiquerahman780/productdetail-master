class Petagory{
  late int id;
  late String image;
  late String name;
  late String size;
  late String price;
  late String quantity;
 // late String quantity;

  petagoryMap(){
    var mapping=Map<String,dynamic>();
    mapping['id']=id;
    mapping['image']=image;
    mapping['name']=name;
    mapping['size']=size;
    mapping['price']=price;
    mapping['quantity']=quantity;


    return mapping;
  }
}