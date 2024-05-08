import 'package:flutter/material.dart';
import 'package:flutter_movie/main.dart';
import 'package:flutter_movie/models/user_account.dart';
import 'package:flutter_movie/services/account_service.dart';

class UserAccountHome extends StatefulWidget {
  const UserAccountHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return _UserAccountHomeState();
  }
}

class _UserAccountHomeState extends State<UserAccountHome> {
  late Future<UserAccount> userAccountFuture;
  final AccountService accountService = AccountService();

  @override
  void initState() {
    super.initState();
    userAccountFuture = accountService.getAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          FutureBuilder<UserAccount>(
            future: userAccountFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                UserAccount userAccount = snapshot.data!;
                return Column(
                  children: <Widget>[
                    Text('Email: ${userAccount.email}'),
                    Text('Password: ${userAccount.password}'),
                  ],
                );
              } else {
                return const Center(child: Text('No user account found.'));
              }
            },
          ),
          ElevatedButton(
            onPressed: () async {
              await accountService.logout();
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
