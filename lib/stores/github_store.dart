import 'package:flutter_triple/flutter_triple.dart';

import '../models/github_model.dart';
import '../repositories/github_repository.dart';

class GithubStore extends NotifierStore<Exception, GithubModel> {
  final repository = GithubRepository();

  GithubStore() : super(GithubModel(name: '', avatarUrl: ''));

  Future<void> fetchGithub() async {
    execute(() => repository.fetchGithub());
  }
}
