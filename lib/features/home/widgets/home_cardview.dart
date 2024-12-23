import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tubes2_uas_kel4/data/breeds/responsemodel/breeds_responsemodel.dart';

class HomeCard extends StatelessWidget {
  final BreedsResponseModel image;
  final VoidCallback onFavoritePressed;
  final VoidCallback onLikePressed;

  const HomeCard({
    super.key,
    required this.image,
    required this.onFavoritePressed,
    required this.onLikePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildTextSection(),
            const SizedBox(height: 10),
            _buildActionSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextSection() {
    return Column(
      children: [
        Text(
          "Nama Kucing : ${image.name}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Deskripsi Kucing : ${image.description}",
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildActionSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onFavoritePressed,
          icon: const Icon(Icons.favorite),
        ),
        IconButton(
          onPressed: onLikePressed,
          icon: const Icon(Icons.thumb_up),
        ),
      ],
    );
  }
}
