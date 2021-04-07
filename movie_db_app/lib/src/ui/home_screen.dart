import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/src/bloc/moviebloc/movie_bloc.dart';
import 'package:movie_db_app/src/bloc/moviebloc/movie_bloc_event.dart';
import 'package:movie_db_app/src/bloc/moviebloc/movie_bloc_state.dart';
import 'package:movie_db_app/src/bloc/personbloc/person_bloc.dart';
import 'package:movie_db_app/src/bloc/personbloc/person_event.dart';
import 'package:movie_db_app/src/bloc/personbloc/person_state.dart';
import 'package:movie_db_app/src/model/movie.dart';
import 'package:movie_db_app/src/model/person.dart';
import 'package:movie_db_app/src/ui/category_screen.dart';
import 'package:movie_db_app/src/ui/movie_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (_) => MovieBloc()..add(MovieEventStarted(0, '')),
        ),
        BlocProvider<PersonBloc>(
          create: (_) => PersonBloc()..add(PersonEventStated()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(
            Icons.menu,
            color: Colors.black45,
          ),
          title: Text(
            'Movies-db'.toUpperCase(),
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: Colors.black45,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'muli',
                ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 15),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.jpg'),
              ),
            ),
          ],
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BlocBuilder<MovieBloc, MovieState>(
                  builder: (context, state) {
                    if (state is MovieLoading) {
                      return Center(
                        child: Platform.isAndroid
                            ? CircularProgressIndicator()
                            : CupertinoActivityIndicator(),
                      );
                    } else if (state is MovieLoaded) {
                      List<Movie> movies = state.movieList;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider.builder(
                            itemCount: movies.length,
                            itemBuilder: (BuildContext context, int index) {
                              Movie movie = movies[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetailScreen(movie: movie),
                                    ),
                                  );
                                },
                                child: Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: <Widget>[
                                    ClipRRect(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Platform.isAndroid
                                                ? CircularProgressIndicator()
                                                : CupertinoActivityIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/img_not_found.jpg'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 15,
                                        left: 15,
                                      ),
                                      child: Text(
                                        movie.title.toUpperCase(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          fontFamily: 'muli',
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            options: CarouselOptions(
                              enableInfiniteScroll: true,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 5),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              pauseAutoPlayOnTouch: true,
                              viewportFraction: 0.8,
                              enlargeCenterPage: true,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 12,
                                ),
                                BuildWidgetCategory(),
                                Text(
                                  'Trending persons on this week'.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                    fontFamily: 'muli',
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Column(
                                  children: <Widget>[
                                    BlocBuilder<PersonBloc, PersonState>(
                                      builder: (context, state) {
                                        if (state is PersonLoading) {
                                          return Center();
                                        } else if (state is PersonLoaded) {
                                          List<Person> personList =
                                              state.personList;
                                          //print(personList.length);
                                          return Container(
                                            height: 110,
                                            child: ListView.separated(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: personList.length,
                                              separatorBuilder:
                                                  (context, index) =>
                                                      VerticalDivider(
                                                color: Colors.transparent,
                                                width: 5,
                                              ),
                                              itemBuilder: (context, index) {
                                                Person person =
                                                    personList[index];
                                                return Container(
                                                  child: Column(
                                                    children: <Widget>[
                                                      Card(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                        ),
                                                        elevation: 3,
                                                        child: ClipRRect(
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                'https://image.tmdb.org/t/p/w200${person.profilePath}',
                                                            imageBuilder: (context,
                                                                imageProvider) {
                                                              return Container(
                                                                width: 80,
                                                                height: 80,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                            100),
                                                                  ),
                                                                  image:
                                                                      DecorationImage(
                                                                    image:
                                                                        imageProvider,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            placeholder:
                                                                (context,
                                                                        url) =>
                                                                    Container(
                                                              width: 80,
                                                              height: 80,
                                                              child: Center(
                                                                child: Platform
                                                                        .isAndroid
                                                                    ? CircularProgressIndicator()
                                                                    : CupertinoActivityIndicator(),
                                                              ),
                                                            ),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    Container(
                                                              width: 80,
                                                              height: 80,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  image: AssetImage(
                                                                      'assets/images/img_not_found.jpg'),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Center(
                                                          child: Text(
                                                            person.name
                                                                .toUpperCase(),
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 8,
                                                              fontFamily:
                                                                  'muli',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Center(
                                                          child: Text(
                                                            person
                                                                .knowForDepartment
                                                                .toUpperCase(),
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 8,
                                                              fontFamily:
                                                                  'muli',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        } else {
                                          return Container();
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Container(
                        child: Text('Something went wrong!!!'),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
