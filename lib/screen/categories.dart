import 'package:flutter/material.dart';
import 'package:flutter_api/models/Category.dart';
import 'package:flutter_api/services/api.dart';
import 'package:flutter_api/widgets/CategoryEdit.dart';
import 'package:flutter_api/providers/CategoryProvider.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late Future<List<Category>> futureCategories;
  ApiService apiService=ApiService();

  @override
  void initState() {
    // TODO: implement initState
    futureCategories = apiService.fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<CategoryProvider>(context);
    List<Category> categories=provider.categories;
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: FutureBuilder<List<Category>>(
        future: futureCategories,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Category category = snapshot.data![index];
                  return ListTile(
                    title: Text(category.name),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: false,
                            context: context,
                            builder: (context) {
                              return CategoryEdit(category);
                            });
                      },
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('algo malo sucedio');
          }
          return CircularProgressIndicator();
        },
      ),
      /*body: Container(
        color: Theme.of(context).primaryColorDark,
        child: Center(
          child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index){
            return ListTile(
              title: Text(
                categories[index],
                style: TextStyle(
                  color: Colors.black
                ),
              ),
            );
          })
        ),
      ),*/
    );
  }
}
