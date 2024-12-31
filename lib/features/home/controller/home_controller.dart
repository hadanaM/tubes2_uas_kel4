import 'package:get/get.dart';
import 'package:tubes2_uas_kel4/data/breeds/datasource/breeds_datasource.dart';
import 'package:tubes2_uas_kel4/data/favorite/datasource/favorite_datasource.dart';
import 'package:tubes2_uas_kel4/data/vote/datasource/vote_datasource.dart';
import 'package:tubes2_uas_kel4/data/vote/requestmodel/vote_requests_model.dart';
import '../../../data/breeds/responsesmodel/breeds_responses_model.dart';

class HomeController extends GetxController {
  final BreedsDatasource _datasource = BreedsDatasource();
  final VoteDatasource _voteDatasource = VoteDatasource();
  final FavoriteDatasource _favoriteDatasource = FavoriteDatasource();
  var images = <BreedsResponsesModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchImages();
  }

  Future<void> fetchImages() async {
    try {
      final response = await _datasource.getBreeds();
      images.value = response;
    } catch (e) {
      PrintLog.printLog("catch error $e");
    }
  }

  void onFavoritePressed(String imageId) {
    final favorite = FavoriteRequestsModelPost(
      imageId: imageId,
      subId: "1234",
    );
    _favoriteDatasource.createFavorite(favorite);
  }

  void onLikePressed(String imageId) {
    final vote = VoteRequestsModel(
      imageId: imageId,
      subId: "1234",
      value: 1,
    );
    _voteDatasource.createVote(vote);
  }
}
