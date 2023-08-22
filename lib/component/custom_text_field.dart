import 'package:flutter/material.dart';

class CustomFormtextfield extends StatelessWidget {
   CustomFormtextfield({this.onChanged,this.hintText , this.obscureText = false}) ;

 String? hintText;
 bool? obscureText;
 Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: (data)
        {
        if(data!.isEmpty){
          return 'Feild is Required';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText ,
        hintStyle : TextStyle(
          color: Colors.white,
        ),
        enabledBorder:OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white
            )
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white
            )
        ),
      ),
    );
  }
}
