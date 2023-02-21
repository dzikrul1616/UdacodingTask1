import 'dart:convert';
import 'package:crud/app/modules/models/usermodels.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiView extends StatefulWidget {
  @override
  _ApiViewState createState() => _ApiViewState();
}

class _ApiViewState extends State<ApiView> {
  late List<User> _users;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    setState(() {
      _isLoading = true;
    });

    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<User> users = [];

      for (var item in jsonData['data']) {
        users.add(User.fromJson(item));
      }

      setState(() {
        _users = users;
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users API'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _users.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(_users[index].avatar)),
                  title: Text(
                      '${_users[index].id},${_users[index].firstName},${_users[index].lastName}'),
                  subtitle: Text(_users[index].email),
                );
              },
            ),
    );
  }
}
