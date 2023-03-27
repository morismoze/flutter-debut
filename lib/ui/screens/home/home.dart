import 'package:debutapp/data/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context).homeAppBarTitle),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return <Widget>[
      _buildChallengeBuilderButton(),
    ];
  }

  Widget _buildChallengeBuilderButton() {
    return Placeholder();
  }

  Widget _buildBody() {
    return DoubleBackToCloseApp(
      snackBar:
          SnackBar(content: Text(AppLocalizations.of(context).homeAppExit)),
      child: Text("home"),
    );
  }
}
