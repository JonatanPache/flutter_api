import 'package:flutter/material.dart';
import 'package:flutter_api/models/Category.dart';

import '../services/api.dart';

class CategoryEdit extends StatefulWidget {
  final Category category;
  const CategoryEdit(this.category, {Key? key}) : super(key: key);

  @override
  State<CategoryEdit> createState() => _CategoryEditState();
}

class _CategoryEditState extends State<CategoryEdit> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final categoryNameController = TextEditingController();
  ApiService apiService=ApiService();
  String errorMessage='';

  @override
  void initState() {
    super.initState();
    categoryNameController.text=widget.category.name;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                onChanged: (text)=>setState(() => errorMessage=''),
                controller: categoryNameController,
                validator: (String? value){
                  if(value!.isEmpty){
                    return 'Enter name';
                  }
                  return null;
                },
                //initialValue: category.name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Category name'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () => saveCategory(),
                      child: Text('Save')
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel')
                  )
                ],
              ),
              Text(errorMessage,style: TextStyle(color: Colors.red))
            ],
          ),
        )
    );
  }

  Future saveCategory() async {
    final form=_formKey.currentState;
    if(!form!.validate()) return;
    apiService.updateCategory(
        widget.category.id.toString(),
        categoryNameController.text)
        .then((Category category) => Navigator.pop(context))
        .catchError((exception){
          setState(() {
            errorMessage=exception.toString();
          });
        });
  }
}
