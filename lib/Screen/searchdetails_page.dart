import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _showSearchResult = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  void showResult() {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showSearchResult = true;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text('Search',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 16),
              const SearchForm(),
              const SizedBox(height: 16),
              Text(_showSearchResult ? "Search Results" : "Top Restaurants",
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _isLoading ? 2 : 5,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _isLoading
                        ? const BigCardScalton()
                        : RestaurantInfoBigCard(
                            images: demoBigImages,
                            name: "McDonald's",
                            rating: 4.3,
                            numOfRating: 200,
                            deliveryTime: 25,
                            foodType: const [
                              "Chinese",
                              "American",
                              "Deshi food"
                            ],
                            press: () {},
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RestaurantInfoBigCard extends StatelessWidget {
  final List<String> images, foodType;
  final String name;
  final double rating;
  final int numOfRating, deliveryTime;
  final bool isFreeDelivery;
  final VoidCallback press;

  const RestaurantInfoBigCard({
    super.key,
    required this.name,
    required this.rating,
    required this.numOfRating,
    required this.deliveryTime,
    this.isFreeDelivery = true,
    required this.images,
    required this.foodType,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigCardImageSlide(images: images),
          const SizedBox(height: 8),
          Text(name, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 4),
          PriceRangeAndFoodtype(foodType: foodType),
          const SizedBox(height: 4),
          Row(
            children: [
              RatingWithCounter(rating: rating, numOfRating: numOfRating),
              const SizedBox(width: 8),
              SvgPicture.string(clockIconSvg, height: 20, width: 20),
              const SizedBox(width: 8),
              Text("$deliveryTime Min"),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: SmallDot(),
              ),
              SvgPicture.string(deliveryIconSvg, height: 20, width: 20),
              const SizedBox(width: 8),
              Text(isFreeDelivery ? "Free" : "Paid"),
            ],
          ),
        ],
      ),
    );
  }
}

class BigCardScalton extends StatelessWidget {
  const BigCardScalton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AspectRatio(
          aspectRatio: 1.81,
          child: BigCardImageSlideScalton(),
        ),
        const SizedBox(height: 16),
        ScaltonLine(width: MediaQuery.of(context).size.width * 0.8),
        const SizedBox(height: 16),
        const ScaltonLine(),
        const SizedBox(height: 16),
        const ScaltonLine(),
      ],
    );
  }
}

class BigCardImageSlideScalton extends StatelessWidget {
  const BigCardImageSlideScalton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class ScaltonLine extends StatelessWidget {
  const ScaltonLine({
    super.key,
    this.height = 15,
    this.width = double.infinity,
  });

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Colors.black.withOpacity(0.08),
    );
  }
}

class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter your search query";
          }
          return null;
        },
        decoration: const InputDecoration(
          hintText: "Search on foodly",
        ),
      ),
    );
  }
}

//// ================= DUMMY =================

const List<String> demoBigImages = [];

class BigCardImageSlide extends StatelessWidget {
  final List<String> images;
  const BigCardImageSlide({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.grey[300],
      child: const Center(child: Text("Image Slider")),
    );
  }
}

class PriceRangeAndFoodtype extends StatelessWidget {
  final List<String> foodType;
  const PriceRangeAndFoodtype({super.key, required this.foodType});

  @override
  Widget build(BuildContext context) {
    return Text(foodType.join(", "));
  }
}

class RatingWithCounter extends StatelessWidget {
  final double rating;
  final int numOfRating;

  const RatingWithCounter({
    super.key,
    required this.rating,
    required this.numOfRating,
  });

  @override
  Widget build(BuildContext context) {
    return Text("$rating ($numOfRating)");
  }
}

class SmallDot extends StatelessWidget {
  const SmallDot({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("•");
  }
}

const String deliveryIconSvg = '''
<svg viewBox="0 0 24 24"></svg>
''';

const String clockIconSvg = '''
<svg viewBox="0 0 24 24"></svg>
''';