import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String name;
  final String price;
  final String image;
  final String tag;
  final double rating;
  final bool isInCart;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    this.tag = '',
    this.rating = 4.5,
    required this.isInCart,
    required this.onAddToCart,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>
    with SingleTickerProviderStateMixin {
  bool _isFav = false;
  late AnimationController _cartAnimController;
  late Animation<double> _cartScaleAnim;

  @override
  void initState() {
    super.initState();
    _cartAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _cartScaleAnim = Tween<double>(begin: 1.0, end: 0.85).animate(
      CurvedAnimation(parent: _cartAnimController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _cartAnimController.dispose();
    super.dispose();
  }

  void _handleCartTap() async {
    await _cartAnimController.forward();
    await _cartAnimController.reverse();
    widget.onAddToCart();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1D1D22),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.05),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 135,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF252530),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Center(
                  child: Image.asset(
                    widget.image,
                    height: 55,
                    width: 55,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Tag badge
              if (widget.tag.isNotEmpty)
                Positioned(
                  left: 16,
                  top: 16,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: widget.tag == "SALE"
                          ? Colors.redAccent
                          : const Color(0xFF2D7DFF),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      widget.tag,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              // Favourite button
              Positioned(
                right: 16,
                top: 16,
                child: GestureDetector(
                  onTap: () => setState(() => _isFav = !_isFav),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _isFav ? Icons.favorite : Icons.favorite_border,
                      color: _isFav ? Colors.redAccent : Colors.white,
                      size: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 5),

                // Rating
                Row(
                  children: [
                    const Icon(Icons.star_rounded,
                        color: Color(0xFFFFC107), size: 14),
                    const SizedBox(width: 3),
                    Text(
                      widget.rating.toString(),
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.price,
                      style: const TextStyle(
                        color: Color(0xFF2D7DFF),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Cart button with animation
                    ScaleTransition(
                      scale: _cartScaleAnim,
                      child: GestureDetector(
                        onTap: _handleCartTap,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: widget.isInCart
                                ? Colors.green
                                : const Color(0xFF2D7DFF),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Icon(
                            widget.isInCart
                                ? Icons.check_rounded
                                : Icons.add_shopping_cart_rounded,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
