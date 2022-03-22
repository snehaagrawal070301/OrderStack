import 'package:flutter/material.dart';
import 'package:order_stack/Widgets.dart';
import 'package:order_stack/components/colorValues.dart';
import 'package:order_stack/extras/AddCustomerExtra.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({Key? key}) : super(key: key);

  @override
  _AddCustomerScreenState createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController cusNumber = TextEditingController();
  TextEditingController cusName = TextEditingController();
  TextEditingController cusEmail = TextEditingController();
  TextEditingController shopName = TextEditingController();
  TextEditingController shopAddress = TextEditingController();
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
        backgroundColor: Color(ColorValues.THEME_COLOR).withOpacity(0.9),
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
                    Padding(padding: EdgeInsets.only(left: 10),child:myText("Add Customer",
                      size: Mq.height(context) * 0.03,
                      color:  Color(ColorValues.WHITE_COLOR),)),]),
                  SizedBox(
                    height: Mq.height(context) * 0.025,
                  ),
                  GestureDetector(
                    onTap: () {
                  },
                    child: const HomeScreenOptions(
                        optionTitle: "View All Contacts",
                        leadingColor: Color(0xffF9C910)),
                  ),
                  SizedBox(height: Mq.height(context)*0.02,),
                  myText("Enter Mobile Number",
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
                        controller: cusNumber,
                        style: inputStyle(context),
                        decoration: InputDecoration(
                          hintText: "234234536",
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color:
                                  Theme.of(context).textTheme.headline5!.color),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  myText("Enter Customer Name",
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
                        controller: cusName,
                        style: inputStyle(context),
                        decoration: InputDecoration(
                          hintText: "name",
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color:
                                  Theme.of(context).textTheme.headline5!.color),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  myText("Enter Customer Email",
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
                        keyboardType: TextInputType.emailAddress,
                        autofocus: false,
                        controller: cusEmail,
                        style: inputStyle(context),
                        decoration: InputDecoration(
                          hintText: "email",
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color:
                                  Theme.of(context).textTheme.headline5!.color),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  myText("Shop Name",
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
                        controller: shopName,
                        style: inputStyle(context),
                        decoration: InputDecoration(
                          hintText: "shop name",
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color:
                                  Theme.of(context).textTheme.headline5!.color),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  myText("Shop Address",
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
                        controller: shopAddress,
                        style: inputStyle(context),
                        decoration: InputDecoration(
                          hintText: "shop address",
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
                            child: myText("Add Member",
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
