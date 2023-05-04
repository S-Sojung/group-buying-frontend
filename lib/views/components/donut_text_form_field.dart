import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DonutTextFormField extends StatelessWidget {
  final String title;
  final String hint;
  final funValidator;
  final controller;

  const DonutTextFormField({
    required this.title,
    required this.hint,
    required this.funValidator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getScreenWidth(context)*0.05,vertical: 5),
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          Text("${title}",style: callout(),),
          TextFormField(
            controller: controller,
            validator: funValidator,

            obscureText: hint == "Password" || hint == "password" ? true : false,
            decoration: InputDecoration(
              hintText: "Enter $hint",
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: donutColorBasic),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: donutColorBasic),
                borderRadius: BorderRadius.circular(20),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: donutColorBasic),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: donutColorBasic),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class DonutTextFormFieldSlim extends StatelessWidget {
  final String title;
  final String hint;
  final funValidator;
  final controller;
  final readOnly;

  const DonutTextFormFieldSlim({
    this.readOnly = false,
    required this.title,
    this.hint = "",
    required this.funValidator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getScreenWidth(context)*0.05,vertical: 5),
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          Text("${title}",style: callout(),),
          Container(
            height: 40,
            child: TextFormField(
              readOnly: readOnly,
              textAlign: TextAlign.start,
              controller: controller,
              validator: funValidator,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: donutColorBasic),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: donutColorBasic),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: donutColorBasic),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: donutColorBasic),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class DonutCountFormField extends StatelessWidget {
  final String title;
  final funValidator;
  final controller;

  const DonutCountFormField({
    required this.title,
    required this.funValidator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getScreenWidth(context)*0.05,vertical: 5),
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          Text("${title}",style: callout(),),
          Container(
            height: 40,
            child: TextFormField(
              onSaved: (newValue) {
                controller.text = newValue;
              },
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              textAlign: TextAlign.start,
              controller: controller,
              validator: funValidator,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: donutColorBasic),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: donutColorBasic),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: donutColorBasic),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: donutColorBasic),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DonutAccountFormFieldSlim extends StatelessWidget {
  final bool readOnly;
  final funValidator;
  final controller;

  const DonutAccountFormFieldSlim({
    this.readOnly = true,
    required this.funValidator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: 40,
        child: TextFormField(
          readOnly: readOnly,
          textAlign: TextAlign.start,
          controller: controller,
          validator: funValidator,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
            hintText: "계좌번호 설정",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: donutColorBasic),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: donutColorBasic),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: donutColorBasic),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: donutColorBasic),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

