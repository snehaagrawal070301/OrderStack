import 'package:flutter/material.dart';
import 'package:order_stack/Widgets.dart';
import 'package:order_stack/components/colorValues.dart';
import 'package:order_stack/extras/AddCustomerExtra.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController ItemName = TextEditingController();
  TextEditingController ItemPrice = TextEditingController();
  TextEditingController ItemType = TextEditingController();
  TextEditingController ItemUnit = TextEditingController();
  TextEditingController ItemQuantity = TextEditingController();
  /*String code="";
  String mobile = "";
  String memberID="";
  QuerySnapshot? querySnapshot;
  TextEditingController phonenumber = TextEditingController();
  TextEditingController memberId = TextEditingController();
  DatabaseMethods databaseMethods = DatabaseMethods();
  addMemberDetails() async {
    if (formKey.currentState!.validate()) {
      await databaseMethods.getMemberMobile(code,mobile).then((val) {
        setState(() {         
          querySnapshot = val;
          print(querySnapshot?.docs.length);
        });
      });
      if (querySnapshot?.docs.length == 0) {
        CollectionReference users =
        FirebaseFirestore.instance.collection('members');
    await users.doc().set({
      'profile_photo_url': "",
      'admin_add_date':Timestamp.now(),
      'profile_add_date':Timestamp.now(),
      'full_name': "",
      'organization_name': "",
      'club_id': "",
      'member_id': memberID,
      'role': 'member',
      'mobile_number':{
        'code':code,
        'number':mobile,
      },
      'email': "",
      'gender': '',
      'bio': "",
       'professional_details': 
         {
           'occupation': '',
           'address': 
             {
               'line': '',
               'city': '',
               'state': '',
               'pincode': '',
               'country': '',
               'landmark': ''
             },
           'qualification': '',
           'website_link': '',
         },
       'personal_details': 
         {
           'date_of_birth_member': {
             'day_member':'',
             'month_member':'',
             'year_member':'',
           },
           'marital_status': '',
           'date_of_marriage': {
             'marriage_day':'',
             'marriage_month':'',
             'marriage_year':'',
           },
           'current_address': 
             {
               'line': '',
               'city': '',
               'state': '',
               'pincode': '',
               'country': '',
               'landmark': ''
             },
            'permanent_address': 
             {
               'line': '',
               'city': '',
               'state': '',
               'pincode': '',
               'country': '',
               'landmark': ''
             },
           'spouse': 
             {
               'full_name': '',
               'date_of_birth_spouse': {
                  'day_spouse':'',
                  'month_spouse':'',
                  'year_spouse':'',
                },
               'gender': '',
             },
           'children': 
             {
               'full_name': '',
               'date_of_birth_children': {
                  'day_children':'',
                  'month_children':'',
                  'year_children':'',
                },
               'gender': '',
             },
         }
    });
    getToast(context, "Member successfully added");
      } else {
        print("already added");
        getToast(context,"Already Registered");
      }
    }
  }*/
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color(ColorValues.THEME_COLOR),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: Mq.width(context) / 23.43, vertical: 20),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children:[
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: Mq.height(context)*0.06,
                        width: Mq.height(context)*0.06,
                        decoration: BoxDecoration(
                          color: Color(ColorValues.WHITE_COLOR),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.arrow_back,color: Color(ColorValues.THEME_COLOR),)),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10),child:myText("Add Item",
                      size: Mq.height(context) * 0.03,
                      color:  Color(ColorValues.WHITE_COLOR),)),]),
                  SizedBox(
                    height: Mq.height(context) * 0.04,
                  ),
                  myText("Enter Product Name",
                      size: Mq.height(context) * 0.020,
                      color: Color(ColorValues.WHITE_COLOR),
                      fontWeight: FontWeight.w500),
                  Container(
                    height: MediaQuery.of(context).size.height / 14,
                    margin: EdgeInsets.only(
                        top: Mq.height(context) * 0.015,
                        bottom: Mq.height(context) * 0.02),
                    padding: EdgeInsets.only(
                        left: Mq.width(context) * 0.02,
                        top: Mq.height(context) * 0.01,
                        bottom: Mq.height(context) * 0.01,
                        right: Mq.width(context) * 0.01),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).dividerColor, width: 0.4),
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        autofocus: false,
                        controller: ItemName,
                        style: inputStyle(context),
                        decoration: InputDecoration(
                          hintText: "Product name",
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color:
                                  Theme.of(context).textTheme.headline5!.color),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  myText("Enter Product Type",
                      size: Mq.height(context) * 0.020,
                      color: Color(ColorValues.WHITE_COLOR),
                      fontWeight: FontWeight.w500),
                  Container(
                    height: MediaQuery.of(context).size.height / 14,
                    margin: EdgeInsets.only(
                        top: Mq.height(context) * 0.015,
                        bottom: Mq.height(context) * 0.02),
                    padding: EdgeInsets.only(
                        left: Mq.width(context) * 0.02,
                        top: Mq.height(context) * 0.01,
                        bottom: Mq.height(context) * 0.01,
                        right: Mq.width(context) * 0.01),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).dividerColor, width: 0.4),
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        autofocus: false,
                        controller: ItemType,
                        style: inputStyle(context),
                        decoration: InputDecoration(
                          hintText: "Product type",
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color:
                                  Theme.of(context).textTheme.headline5!.color),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  myText("Enter Product Price",
                      size: Mq.height(context) * 0.020,
                      color: Color(ColorValues.WHITE_COLOR),
                      fontWeight: FontWeight.w500),
                  Container(
                    height: MediaQuery.of(context).size.height / 14,
                    margin: EdgeInsets.only(
                        top: Mq.height(context) * 0.015,
                        bottom: Mq.height(context) * 0.02),
                    padding: EdgeInsets.only(
                        left: Mq.width(context) * 0.02,
                        top: Mq.height(context) * 0.01,
                        bottom: Mq.height(context) * 0.01,
                        right: Mq.width(context) * 0.01),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).dividerColor, width: 0.4),
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        controller: ItemPrice,
                        style: inputStyle(context),
                        decoration: InputDecoration(
                          hintText: "Product price",
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color:
                                  Theme.of(context).textTheme.headline5!.color),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  myText("Enter Product Unit",
                      size: Mq.height(context) * 0.020,
                      color: Color(ColorValues.WHITE_COLOR),
                      fontWeight: FontWeight.w500),
                  Container(
                    margin: EdgeInsets.only(
                        top: Mq.height(context) * 0.015,
                        bottom: Mq.height(context) * 0.02),
                    padding: EdgeInsets.only(
                        left: Mq.width(context) * 0.02,
                        top: Mq.height(context) * 0.005,
                        bottom: Mq.height(context) * 0.005,
                        right: Mq.width(context) * 0.01),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).dividerColor, width: 0.4),
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        autofocus: false,
                        controller: ItemUnit,
                        style: inputStyle(context),
                        decoration: InputDecoration(
                          hintText: "Product unit",
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color:
                                  Theme.of(context).textTheme.headline5!.color),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  myText("Enter Product Quantity",
                      size: Mq.height(context) * 0.020,
                      color: Color(ColorValues.WHITE_COLOR),
                      fontWeight: FontWeight.w500),
                  Container(
                    margin: EdgeInsets.only(
                        top: Mq.height(context) * 0.015,
                        bottom: Mq.height(context) * 0.02),
                    padding: EdgeInsets.only(
                        left: Mq.width(context) * 0.02,
                        top: Mq.height(context) * 0.005,
                        bottom: Mq.height(context) * 0.005,
                        right: Mq.width(context) * 0.01),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).dividerColor, width: 0.4),
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        controller: ItemQuantity,
                        style: inputStyle(context),
                        decoration: InputDecoration(
                          hintText: "Product quantity",
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color:
                                  Theme.of(context).textTheme.headline5!.color),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  
                  SizedBox(
                    height: Mq.height(context) * 0.03,
                  ),
                  GestureDetector(
                      onTap: () {
                      },
                      child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                              color: Color(ColorValues.WHITE_COLOR),
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                            child: myText("Add Item",
                                size: Mq.height(context) * 0.024,
                                color: Color(ColorValues.THEME_COLOR),
                                fontWeight: FontWeight.w400),
                          )))
                ],
              ),
            ),
          ),
        ),
      );
  }
}
