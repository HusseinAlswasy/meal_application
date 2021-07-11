import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreeen extends StatefulWidget {
  static const routeName = '/Filters';

  final Function saveFilters;

 FilterScreeen(this.saveFilters);

  @override
  _FilterScreeenState createState() => _FilterScreeenState();
}

class _FilterScreeenState extends State<FilterScreeen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  Widget BuildswitchList(String title, String describtion, bool currentvalue,
      Function updatevalue) {
    return SwitchListTile(
        title: Text(title),
        value: currentvalue,
        subtitle: Text(describtion),
        onChanged: updatevalue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Settings"),actions: [
        IconButton(
          icon: Icon(Icons.save),
          onPressed: (){
            final Map<String,bool> selectedFilters ={
              'gluten' : _glutenFree,
              'vegetarian' : _vegetarian,
              'vegan' : _vegan,
              'lactose' : _lactoseFree,

            };

            widget.saveFilters(selectedFilters);
          },
        ),
      ],
      ),
      body: Column(
        children: [
          Container(
            child: Text("Adjust your meal selections",
                style: Theme.of(context).textTheme.title),
          ),
          Expanded(
            child: ListView(
              children: [
                BuildswitchList(
                    'Gluten-free', "one meal include gluten-Free", _glutenFree,
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
                ),
                BuildswitchList(
                  'Lactose-free', "one meal include Lactose-Free", _lactoseFree,
                      (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                BuildswitchList(
                  'Vegan-free', "one meal include vegan-Free", _vegan,
                      (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                BuildswitchList(
                  'Vegetarian-free', "one meal include vegetarian-Free", _vegetarian,
                      (newValue) {
                    setState(() {
                      _vegetarian= newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
