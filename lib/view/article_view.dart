import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_elisoft_task/components/article_horiz_skeleton.dart';
import 'package:flutter_elisoft_task/components/article_vert_skeleton.dart';
import 'package:flutter_elisoft_task/components/welcome_user_skeleton.dart';
import 'package:flutter_elisoft_task/constant/color.dart';
import 'package:flutter_elisoft_task/cubit/article_cubit.dart';
import 'package:flutter_elisoft_task/cubit/auth_cubit.dart';
import 'package:intl/intl.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    BlocProvider.of<ArticleCubit>(context).getArticle();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
                child: BlocBuilder<ArticleCubit, ArticleState>(
                  builder: (context, state) {
                    if (state is! ArticleFilled) {
                      return const WelcomeUserSkeleton();
                    }

                    return RichText(
                      text: TextSpan(
                        text: 'Welcome,',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' ${authCubit.userModel!.name}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder<ArticleCubit, ArticleState>(
                builder: (context, state) {
                  if (state is! ArticleFilled) {
                    return const ArticleHorizSkeleton();
                  }

                  final articles = state.article;

                  return Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: (articles.length / 2).round(),
                      itemBuilder: (context, index) {
                        index = index + 10;
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: greenSecondaryColor),
                          ),
                          padding: const EdgeInsets.all(8),
                          width: 220,
                          child: RichText(
                            text: TextSpan(
                              text: '${articles[index].title},',
                              style: TextStyle(
                                color: greenSecondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '\n${articles[index].content}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 20);
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<ArticleCubit, ArticleState>(
                builder: (context, state) {
                  if (state is! ArticleFilled) {
                    return const ArticleVertSkeleton();
                  }

                  final articles = state.article;

                  return Expanded(
                    flex: 2,
                    child: ListView.separated(
                      itemCount: (articles.length / 2).round(),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: greenQuaternaryColor,
                          ),
                          padding: const EdgeInsets.all(8.0),
                          height: 190,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      articles[index].image!,
                                      fit: BoxFit.cover,
                                      height: 80,
                                      width: 80,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      '${articles[index].title}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 60,
                                child: Text(
                                  '${articles[index].content}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: Text(
                                  DateFormat('dd MMMM yyyy, hh:mm:ss')
                                      .format(articles[index].created!.date!)
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 18);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
