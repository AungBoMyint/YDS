/* 
import 'package:flutter/material.dart';

class ColumnForm extends StatefulWidget {
  const ColumnForm({
    Key? key,
    required this.controller,
    this.label,
    required this.isUnderlineBorder,
    this.textFieldPaddingLeft,
    this.stringKey,
    this.height,
    this.validator,
    this.isLabel = true,
    this.padding = 25,
    this.hintText,
    this.error,
  }) : super(key: key);

  final TextEditingController controller;
  final String? label;
  final bool isUnderlineBorder;
  final double? textFieldPaddingLeft;
  final double? height;
  final bool isLabel;
  final double padding;
  final String? hintText;
  final String? Function(String?)? validator;
  final String? error;
  final String? stringKey;

  @override
  State<ColumnForm> createState() => _ColumnFormState();
}

class _ColumnFormState extends State<ColumnForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.only(left: 20,right: 10,top: 10),
       child: SizedBox(
        height: widget.height ?? 55,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             //Label
             widget.isLabel ? Text(
               widget.label ?? "",
               style: Theme.of(context).textTheme
               .bodyText1,
             ) : const SizedBox(),
             //TextField
             Expanded(
               child: Padding(
                   padding:  EdgeInsets.only(left: widget.padding),
                   child: TextFormField(
                     controller: widget.controller,
                     validator:dataController.inputMap[widget.stringKey]
                     ?.validator,
                     decoration: InputDecoration(
                      counter: null,
                      counterText: "",
                      labelText: widget.hintText,
                      labelStyle: const TextStyle(color: Colors.black,),
                      contentPadding:  EdgeInsets.only(
                        left: widget.textFieldPaddingLeft ?? 0
                      ),
                       border: widget.isUnderlineBorder ? 
                       const UnderlineInputBorder(
                         borderSide: BorderSide(
                           color: Colors.black,
                         )
                       ) : const OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.black)
                       ),
                       focusedBorder: widget.isUnderlineBorder ? 
                       const UnderlineInputBorder(
                         borderSide: BorderSide(
                           color: Colors.black,
                         )
                       ) : const OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.black)
                       ),
                     ),
                   ),
                 ),
             ),
           ],
         ),
       ),
     );
  }
}  */