import 'dart:math';
import 'package:flutter/material.dart';
import '../../widgets/categories_card_widget.dart';
import '../../widgets/freelancer_miniphoto_widget.dart';
import '../../widgets/popular_task_card_widget.dart';
import '../../widgets/title_categories_widget.dart';
import '../home/search_page.dart';
import '../profile/user_profile_page.dart';

class HomePage extends StatelessWidget {
  final random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const _CustomAppBar(),
          const _CustomSearchButton(),
          const SizedBox(height: 20),
          TitleCategoriesWidget(title: 'Tareas populares', onPress: () {}),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) => PopularTaskWidget(
                onTap: () {},
                text: 'Item #$index',
                color: Color.fromRGBO(
                  random.nextInt(255),
                  random.nextInt(255),
                  random.nextInt(255),
                  1,
                ),
              ),
            ),
          ),
          TitleCategoriesWidget(title: 'Categorias', onPress: () {}),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 240,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) => CategoriesWidget(
                frelancersCounter: 20,
                name: 'House cleaning',
                onTap: () {},
              ),
            ),
          ),
          TitleCategoriesWidget(title: 'Freelancers', onPress: () {}),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) =>
                  const FreelancerMiniPhotoWidget(),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomSearchButton extends StatelessWidget {
  const _CustomSearchButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(SearchPage.route),
      child: Container(
        margin: const EdgeInsets.only(top: 25, left: 5, right: 7),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              offset: Offset(2, 3),
              color: Colors.grey,
            )
          ],
        ),
        child: Row(
          children: const [Icon(Icons.search), Text('   ¿Que necesitas?')],
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
        ),
        InkWell(
          onTap: () => Navigator.of(context).pushNamed(UserProfilePage.route),
          child: const CircleAvatar(
            radius: 28,
            child: Text('S', style: TextStyle(fontSize: 25)),
          ),
        ),
      ],
    );
  }
}
