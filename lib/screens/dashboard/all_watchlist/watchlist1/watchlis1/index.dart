import 'package:flutter/material.dart';

class Watchlist1 extends StatefulWidget {
  const Watchlist1({super.key});

  @override
  State<Watchlist1> createState() => _Watchlist1State();
}

class _Watchlist1State extends State<Watchlist1> {
  List<bool> _selectedItems = List<bool>.filled(100, false);
  int _selectedCount = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedItems[index] = !_selectedItems[index];
      _selectedCount = _selectedItems.where((item) => item).length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search & add',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text('$_selectedCount/100'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item $index'),
                trailing: _selectedItems[index]
                    ? IconButton(
                  icon: const Icon(Icons.check_box),
                  onPressed: () {
                    _onItemTapped(index);
                  },
                )
                    : IconButton(
                  icon: const Icon(Icons.add_box),
                  onPressed: () {
                    _onItemTapped(index);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

