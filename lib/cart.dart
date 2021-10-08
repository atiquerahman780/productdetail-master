import 'package:flutter/material.dart';

import 'checkout.dart';
import 'localStorage/Category_Services.dart';
import 'localStorage/category1.dart';
class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {


  //int sum=0;




   // _pategorylist= as List;

   // print("sum="+sum.toString());
    //assignlistvaluefunction();












  var pategory;
  var _petagory=Petagory();
  var _PetagoryServices=PetagoryServices();
  var _editpategoryquantitycontroler=TextEditingController();
  TextEditingController tec=TextEditingController();
  List<Petagory> _pategorylist=<Petagory>[];
  _showFormDialog(BuildContext context, petagoryId,int index){
    return showDialog(context: context,barrierDismissible: true, builder: (p) {
      return AlertDialog(
        actions: <Widget>[
          FlatButton(onPressed: () async {
            var result  =  _petagoryServices.deletePetagory(petagoryId);
            setState(() {
              print("size"+_pategorylist.length.toString());
              _pategorylist.removeAt(index);
              //u.r=_pategorylist.length.toString();
              print("size"+_pategorylist.length.toString());
              _pategorylist = _pategorylist;

              print("pategory"+index.toString());
              Navigator.pop(p);
              getAllPategory();



            });
          }, child: Text("Delete")),
          FlatButton(onPressed: (){
            Navigator.pop(p);
            },
              child: Text("Cancel")),
        ],
        title: Text("Are You Sure"),
      );
    },);
  }


  /*_editFormDialog(BuildContext context){
    return showDialog(context: context,barrierDismissible: true, builder: (pragma) {
      return SingleChildScrollView(
        child: AlertDialog(

          actions: <Widget>[

            FlatButton(onPressed: ()  async{

              _petagory.id=pategory[0]['id'];
              _petagory.quantity=_editpategoryquantitycontroler.text;
              int updateprice= int.parse(_editpategoryquantitycontroler.text)*400;
              String price=updateprice.toString();
              _petagory.name="atique";
              _petagory.size="large size unit";
              _petagory.price=price;
              _petagory.image="https://picsum.photos/seed/picsum/200/300";
              print(_editpategoryquantitycontroler.text);

              var result  = await _petagoryServices.updatePetagory(_petagory);
              setState(() {

                if (result>0){
                  Navigator.pop(pragma);
                  getAllPategory();
                }
                print(result);
              });
            }, child: Text("update")),
            FlatButton(onPressed: (){
              Navigator.pop(pragma);
            }, child: Text("Cancel")),
          ],
          title: Text("Are You Sure"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _editpategoryquantitycontroler,
                )
              ],
            ),
          ),
        ),
      );
    },);
  }*/

  @override
  void initState(){
    super.initState();
    getAllPategory();

  }
  getAllPategory() async{
    int sum =0;
    _pategorylist =<Petagory>[];
   // u.r=_pategorylist.length.toString();
   // print("size"+u.r);
    var categories=await _petagoryServices.readCategories();
    categories.forEach((petagory){
      setState(() {

        var petagoryModel1=Petagory();
        petagoryModel1.image=petagory['image'];
        petagoryModel1.name=petagory['name'];
        petagoryModel1.size=petagory['size'];
        petagoryModel1.price=petagory['price'];
        petagoryModel1.quantity=petagory['quantity'];

        petagoryModel1.id=petagory['id'];
        _pategorylist.add(petagoryModel1);
        u.r=_pategorylist.length.toString();
        print("size"+u.r);
        print(petagoryModel1.price);



          int a=int.parse(petagoryModel1.price);

           sum=sum+a;


        print("sum="+sum.toString());
        i.m=sum.toString();
      });
    });
  }

  _editPategory(BuildContext context, pategoryId) async{
    pategory= await _petagoryServices.readCategoriesById(pategoryId);
    setState(() {
     // _editpategoryquantitycontroler.text=pategory[0]['quantity']??'No Name';
    });
   // _editFormDialog(context);
  }
  var _petagoryServices=PetagoryServices();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Cart"),
          ),
          body: Container(
              child:Column(
                children: [
                  Expanded(

                    child:
                    Center(
                      child: ListView.builder(
                        itemCount: _pategorylist.length,
                        itemBuilder: (context, index){
                          String quantity=(_pategorylist[index].quantity);
                          staticquantity.quantity=quantity;
                          return Container(

                            child: Card(
                                child:ListTile(
                                    title: Text(_pategorylist[index].name),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(_pategorylist[index].size),
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  color: Theme.of(context).accentColor),
                                              child: SingleChildScrollView(
                                                child: Row(
                                                  children: [
                                                    InkWell(
                                                        onTap: () async{
                                                         // _editPategory(context, _pategorylist[index].id);
                                                          int qu=int.parse(_pategorylist[index].quantity);
                                                          if (qu > 1) {
                                                            qu--;
                                                          }


                                                            print("ooooo"+qu.toString());
                                                            _petagory.id=_pategorylist[index].id;
                                                            _petagory.quantity=qu.toString();
                                                            int updateprice= qu*400;
                                                            String price=updateprice.toString();
                                                            _petagory.name="atique";
                                                            _petagory.size="large size unit";
                                                            _petagory.price=price;
                                                            _petagory.image="https://picsum.photos/seed/picsum/200/300";
                                                            print(_editpategoryquantitycontroler.text);

                                                            var result  = await _petagoryServices.updatePetagory(_petagory);
                                                            setState(() {


                                                              getAllPategory();

                                                              print(result);
                                                            });

                                                          },
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: Colors.white,
                                                          size: 16,
                                                        )),
                                                    Container(
                                                      margin: EdgeInsets.symmetric(horizontal: 3),
                                                      padding:
                                                      EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(3),
                                                          color: Colors.white),
                                                      child: Text(
                                                        staticquantity.quantity,
                                                        style: TextStyle(color: Colors.black, fontSize: 16),
                                                      ),
                                                    ),
                                                    InkWell(
                                                        onTap: () async{
                                                        int qu=int.parse(_pategorylist[index].quantity)+1;
                                                        print(qu);
                                                        _petagory.id=_pategorylist[index].id;
                                                        _petagory.quantity=qu.toString();
                                                        int updateprice= qu*400;
                                                        String price=updateprice.toString();
                                                        _petagory.name="atique";
                                                        _petagory.size="large size unit";
                                                        _petagory.price=price;
                                                        _petagory.image="https://picsum.photos/seed/picsum/200/300";
                                                        print(_editpategoryquantitycontroler.text);

                                                        var result  = await _petagoryServices.updatePetagory(_petagory);
                                                        setState(() {


                                                            getAllPategory();

                                                          print(result);
                                                        });

                                                        },
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                          size: 16,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),


                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(_pategorylist[index].price)
                                          ],
                                        )


                                      ],
                                    ),
                                    leading: Image.network(_pategorylist[index].image),
                                    trailing: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {
                                            var ind = index;
                                            setState(() {
                                              _showFormDialog(context,_pategorylist[index].id,ind);
                                            });
                                          },
                                        ),
                                      ],
                                    )

                                )

                            ),

                          );
                        },
                      ),
                    ),
                  ),

                  Container(
                    height: 150,
                    child: Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(" Item(s)")
                              ),
                              Expanded(child: SizedBox()),
                              Align(
                                  alignment: Alignment.topRight,
                                  child:Text(u.r)
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(" Item Total")
                              ),
                              Expanded(child: SizedBox()),
                              Align(
                                  alignment: Alignment.topRight,
                                  child:Text(i.m)
                              ),

                            ],
                          ),

                          Row(

                            children: [

                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(" Deliver Charges")
                              ),
                              Expanded(child: SizedBox()),
                              Align(
                                  alignment: Alignment.topRight,
                                  child:Text("0")
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(" Discount")
                              ),
                              Expanded(child: SizedBox()),
                              Align(
                                  alignment: Alignment.topRight,
                                  child:Text("0")
                              ),
                            ],
                          ),
                          const Divider(
                            height: 5,
                            thickness: 2,
                            indent: 5,
                            endIndent: 5,
                          ),
                          Row(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(" Total Price")
                              ),
                              Expanded(child: SizedBox()),
                              Align(
                                  alignment: Alignment.topRight,
                                  child:Text(i.m)
                              ),
                            ],
                          ),
                          ElevatedButton(onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => checkout()),
                            );
                          }, child: Text("Proceed to Check Out"))
                        ],
                      ),
                    ),
                  )

                ],
              )
          )


      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
class staticquantity{
  static String quantity='';
}
class u{
  static String r='';
}
class i{
  static String m ='';
}
