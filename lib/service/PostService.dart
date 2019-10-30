import 'package:dog_source/model/PostModel.dart';
import 'package:dog_source/repository/PostRepository.dart';

class PostService{
    var repository = PostRepository();
    Future<List<PostModel>> getPostList() async{
      List<PostModel> postList = await repository.getPost();
      return postList;
    }
}