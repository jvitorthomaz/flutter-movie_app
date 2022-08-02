import 'package:flutter/material.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/utils/api_utils.dart';
import 'package:movie_app/utils/glassmorphism_utils.dart';
import 'package:movie_app/widgets/glassmorphism_card_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;
  const DetailsPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title!),
        backgroundColor: const Color.fromRGBO(22, 45, 87, 1),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/wallpaper5.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                  width: double.infinity,
                ),
                Hero(
                  tag: movie.id!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: API.REQUEST_IMG(movie.posterPath!),
                      height: 400,
                      progressIndicatorBuilder:
                          (context, url, loadingProgress) {
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.progress != null
                                ? loadingProgress.downloaded /
                                    loadingProgress.totalSize!
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: GlassmorphismCardWidget(
                    blur: GLASSMORPHISM.blur,
                    opacity: GLASSMORPHISM.opacity,
                    radius: GLASSMORPHISM.radius,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text("Titulo: " + movie.title! +
                                  "\n\nSobre: " + movie.overview! + 
                                  "\n\nLançamento: " + movie.releaseDate! +
                                  "\n\nPopularidade: " + movie.popularity!,
                                  style: const TextStyle(fontSize: 18)
                                  ),
                            
                    ),
                    
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
