import 'package:dalal_admin/custom_widgets/custom_button.dart';
import 'package:dalal_admin/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthView extends StatelessWidget {
  AuthView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value != "123") {
                    return "Wrong Password";
                  }
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(width: 2)),
                    hintText: "Enter Password"),
                maxLines: 1,
                maxLength: 8,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Get.off(() => HomeView());
                  }
                },
                btnText: "GO"),
          )
        ],
      )),
    );
  }
}
