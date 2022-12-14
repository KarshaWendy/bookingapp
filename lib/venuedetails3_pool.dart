import 'package:flutter/material.dart';
import 'venuedetails_functionhall_food.dart';
//import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class VenueDetails3 extends StatefulWidget {
  @override
  _VenueDetailsState createState() => _VenueDetailsState();
}

class _VenueDetailsState extends State<VenueDetails3> {

 TextEditingController dateCtl = TextEditingController();
  TextEditingController timeCtl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime date = DateTime.now();
 
String _value;


  @override
  Widget build(BuildContext context) {
    
      String _formattedate = new DateFormat.yMd().format(date);
    return Scaffold(

      appBar:  AppBar(
     //   title: new Text(widget.title),
       backgroundColor: Color(0xFF18D191),
            automaticallyImplyLeading: true, 
            elevation: 0.0,
            title: Text("Reservation Form"),
      ),
      body: new SafeArea(
          // top: false,
          // bottom: false,
          child: new Form(
          
              autovalidateMode: AutovalidateMode.always, child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                 
                  SizedBox(height: 50.0,),
                
                 DropdownButton<String>(
                            items: [
                                        DropdownMenuItem<String>(
                                          child: Text('Whole'),
                                          value: 'Whole',
                                        ),
                                        DropdownMenuItem<String>(
                                          child: Text('Per head'),
                                          value: 'Per head',
                                        ),
                            ],
                            onChanged: (String value) 
                            {
                              setState(() {
                                _value = value;
                              });
                            },
                            hint: Text('Select category'),
                            value: _value,
              ),
              

                TextFormField(
                    controller: dateCtl,
                    decoration: const InputDecoration
                    (
                      labelText: 'Date of Function',
                    ),

                     onTap: () async {
                            FocusScope.of(context).requestFocus(new FocusNode());

                            DateTime picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2021));
                               dateCtl.text = _formattedate.toString();
                            if(picked != null && picked != date){
                              setState(() {
                                date = picked;
                                //timeCtl.text = picked.format(context); // add this line.
                              //  dateCtl.text=picked.format(context); 
                               //  dddate = new DateFormat.yMd().format(context);
                              });
                            }
                      },
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'Date of Function is required';
                      }
                    },
                  ),


                  const SizedBox(height: 16.0),


                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Guaranteed No. of Person',
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'Guaranteed No. of Person is required';
                      }
                    },
                  ), 

                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'No. of Cottages',
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'No. of cottages is required';
                      }
                    },
                  ), 
           
                  new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: new RaisedButton(
                        child: const Text('Submit'),
                        onPressed: (){  
                             Navigator.of(context).push(
                                 MaterialPageRoute(builder: (BuildContext context)=> VenueDetailsFood()), 
                            );
                        },
                        color: Color(0xFF18D191),
                        textColor: Colors.white,
                      )),
                ],
              ))),

    );
  }
}
