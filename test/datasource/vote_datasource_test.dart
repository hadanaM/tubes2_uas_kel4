import 'package:flutter_test/flutter_test.dart';
import 'package:tubes2_uas_kel4/data/breeds/datasource/breeds_datasource.dart';
import 'package:tubes2_uas_kel4/data/favorite/datasource/favorite_datasource.dart';
import 'package:tubes2_uas_kel4/data/favorite/requestmodel/favorite_requestmodel.dart';
import 'package:tubes2_uas_kel4/data/vote/datasource/vote_datasource.dart';

void main() {
  group('Vote Datasource test', () {
    late VoteDatasource voteDatasource;

    setUp(() {
      voteDatasource = VoteDatasource();
    });

    test('get Vote return correct data when successfully', () async {
      final response = await voteDatasource.getVote();
      expect(response.length, greaterThan(0));
      expect(response[0].id, isNotNull);
    });

    test('create Vote return correct data when successfully', () async {
      final voteReqModel = VoteRequestsModel(
        imageId: 'abys',
        subId: 'fauzan_123',
        value: 1,
      );
      final response = await voteDatasource.createFavorite(voteReqModel);
      if (response != null) {
        expect(response.message, equals("SUCCESS"));
      } else {
        fail('response is null');
      }
    });

    test('search Vote return correct data when successfully', () async {
      final voteId = 232501209;
      final response = await voteDatasource.searchVote(voteId);
      if (response != null) {
        expect(response.id, equals(voteId));
      } else {
        fail('response is null');
      }
    });

    test('Delete vote return correct data when successfully', () async {
      final voteId = 232501209;
      final response = await voteDatasource.deleteVote(voteId);
      expect(response?.message, equals('SUCCESS'));
    });
  });
}
