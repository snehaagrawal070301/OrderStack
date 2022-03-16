import 'package:flutter/material.dart';
import 'package:order_stack/Widgets.dart';
import 'package:order_stack/extras/AddCustomerExtra.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({Key? key}) : super(key: key);

  @override
  _AddCustomerScreenState createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController memberId = TextEditingController();
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
        backgroundColor: Theme.of(context).backgroundColor,
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
                  myText("Hey, Admin",
                      size: Mq.height(context) * 0.03,
                      color: Theme.of(context).textTheme.headline1?.color),
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
                  Padding(
                    padding: EdgeInsets.only(
                        top: Mq.height(context) * 0.03,
                        bottom: Mq.height(context) * 0.04),
                    child: myText("Add New Members",
                        size: Mq.height(context) * 0.024,
                        color: Theme.of(context).textTheme.headline1?.color,
                        fontWeight: FontWeight.w400),
                  ),
                  myText("Enter Mobile Number",
                      size: Mq.height(context) * 0.020,
                      color: Theme.of(context).textTheme.headline1!.color,
                      fontWeight: FontWeight.w300),
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
                        controller: phonenumber,
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
                  myText("Member ID",
                      size: Mq.height(context) * 0.020,
                      color: Theme.of(context).textTheme.headline1!.color,
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
                        controller: memberId,
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
                  
                  myText("Upload CSV",
                      size: Mq.height(context) * 0.020,
                      color: Theme.of(context).textTheme.headline1!.color,
                      fontWeight: FontWeight.w500),
                  Container(
                      height: Mq.height(context) * 0.16,
                      width: Mq.width(context),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.upload_file,
                            color: Colors.blue,
                          ),
                          myText("Upload Document less than 3 mb",
                              size: Mq.height(context) * 0.019,
                              color: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .color
                                  ?.withOpacity(0.5),
                              fontWeight: FontWeight.w300),
                        ],
                      )),
                  SizedBox(
                    height: Mq.height(context) * 0.03,
                  ),
                  GestureDetector(
                      onTap: () {
                      },
                      child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                            child: myText("Add Member",
                                size: Mq.height(context) * 0.024,
                                color: Colors.white,
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
