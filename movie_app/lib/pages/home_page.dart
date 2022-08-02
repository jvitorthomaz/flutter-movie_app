import 'package:flutter/material.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/utils/glassmorphism_utils.dart';
import 'package:movie_app/widgets/custom_list_card_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/widgets/glassmorphism_card_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final MovieController _controller;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void dispose() {
    _controller.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _controller = context.read<MovieController>();

    _controller.scrollController.addListener(
      _controller.infiniteScrolling,
    );

    return Scaffold(
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            "assets/wallpaper5.jpg",
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: RefreshIndicator(
            onRefresh: () async => await _controller.onRefresh(),
            child: SingleChildScrollView(
              controller: _controller.scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValueListenableBuilder<Movies?>(
                      valueListenable: _controller.movies,
                      builder: (_, movies, __) {
                        return Visibility(
                          visible: movies != null,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  child: Text(
                                    'Lista de Filmes',
                                    style: GoogleFonts.lato(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        color: Colors.white),
                                  ),
                                ),
                                GlassmorphismCardWidget(
                                  blur: GLASSMORPHISM.blur,
                                  opacity: GLASSMORPHISM.opacity,
                                  radius: GLASSMORPHISM.radius,
                                  child: TextField(
                                    autocorrect: true,
                                    onChanged: _controller.onChanged,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.search),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      // fillColor: Colors.grey.shade500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                  Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Stack(
                        children: [
                          ValueListenableBuilder<Movies?>(
                            valueListenable: _controller.movies,
                            builder: (_, movies, __) {
                              return movies != null
                                  ? ListView.separated(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: movies.listMovie?.length ?? 0,
                                      shrinkWrap: true,
                                      itemBuilder: (_, idx) =>
                                          CustomListCardWidget(
                                        movie: movies.listMovie![idx],
                                      ),
                                      // Text(movies.results![idx].title!),
                                      separatorBuilder: (_, __) =>
                                          const Divider(),
                                    )
                                  : Center(
                                      child: Lottie.asset(
                                          'assets/lottie_movie.json'),
                                    );
                            },
                          ),
                          ValueListenableBuilder<bool>(
                              valueListenable: _controller.loading,
                              builder: (_, isLoading, __) {
                                return isLoading &&
                                        _controller.movies.value != null
                                    ? Positioned(
                                        bottom: 0,
                                        left:
                                            (MediaQuery.of(context).size.width /
                                                    2) -
                                                20,
                                        child:
                                            const CircularProgressIndicator(),
                                      )
                                    : Container();
                              }),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
