import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../models/github_model.dart';
import '../stores/github_store.dart';

class HomePage extends StatelessWidget {
  final store = GithubStore();

  HomePage({Key? key}) : super(key: key);

  Widget _buildSuccess(GithubModel model) {
    return Center(
      child: SizedBox(
        height: 300,
        width: 300,
        child: Column(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  model.avatarUrl,
                ),
              ),
            ),
            Text(
              model.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildError() {
    return const Center(
      child: Text(
        'Erro ao buscar dados!',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Triple Pattern'),
        centerTitle: true,
      ),
      body: ScopedBuilder<GithubStore, Exception, GithubModel>(
        store: store,
        onState: (_, model) => _buildSuccess(model),
        onError: (_, e) => _buildError(),
        onLoading: (_) => _buildLoading(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.fetchGithub();
        },
        child: const Icon(
          Icons.account_box,
        ),
      ),
    );
  }
}
