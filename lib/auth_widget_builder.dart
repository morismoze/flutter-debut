import 'package:debutapp/data/providers/auth_provider.dart';
import 'package:debutapp/models/user_model.dart';
import 'package:debutapp/services/firestore_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
* This class is mainly to help with creating user dependent object that
* needs to be available by all downstream widgets.
* Thus, this widget has to be above the [MaterialApp].
* As we rely on uid to decide which main screen to display (eg: Home or Sign In),
* this class will help us to create all providers needed that depend on
* the user uid.
 */
class AuthWidgetBuilder extends StatelessWidget {
  const AuthWidgetBuilder(
      {Key? key, required this.builder, required this.databaseBuilder})
      : super(key: key);

  final Widget Function(BuildContext, AsyncSnapshot<UserModel>) builder;
  final FirestoreDatabase Function(BuildContext context, String uid)
      databaseBuilder;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthProvider>(context, listen: false);

    return StreamBuilder<UserModel>(
      stream: authService.user,
      builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
        final UserModel? user = snapshot.data;

        if (user != null && user.uid != null) {
          /*
          * Any other Provider that relies on user data can be
          * added to the following MultiProvider list.
          * Once a user has been detected, a re-build will be initiated.
           */
          return MultiProvider(
            providers: [
              Provider<UserModel>(create: (context) => user),
              Provider<FirestoreDatabase>(
                create: (context) => databaseBuilder(context, user.uid!),
              ),
            ],
            child: builder(context, snapshot),
          );
        }

        return builder(context, snapshot);
      },
    );
  }
}
