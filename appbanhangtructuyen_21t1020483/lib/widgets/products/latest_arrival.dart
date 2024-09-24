import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product_model.dart';
import '../../providers/cart_provider.dart';
import '../../providers/viewed_recently_provider.dart';
import '../../screens/inner_screen/product_details.dart';
import '../subtitle_text.dart';
import 'heart_btn.dart';

class LatestArrivalProductsWidget extends StatelessWidget {
  const LatestArrivalProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productsModel = Provider.of<ProductModel>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final viewedProdProvider = Provider.of<ViewedProdProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          viewedProdProvider.addViewedProd(productId: productsModel.productId);
          await Navigator.pushNamed(context, ProductDetailsScreen.routName,
              arguments: productsModel.productId);
        },
        child: Container(
          width: size.width * 0.45,
          height: size.height * 0.3, // Đặt chiều cao cố định
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: FancyShimmerImage(
                  imageUrl: productsModel.productImage,
                  height: size.height * 0.22,
                  width: size.width * 0.22,
                  boxFit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productsModel.productTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HeartButtonWidget(
                          productId: productsModel.productId,
                        ),
                        IconButton(
                          onPressed: () {
                            if (cartProvider.isProdinCart(
                                productId: productsModel.productId)) {
                              return;
                            }
                            cartProvider.addProductToCart(
                                productId: productsModel.productId);
                          },
                          icon: Icon(
                            cartProvider.isProdinCart(
                              productId: productsModel.productId,
                            )
                                ? Icons.check
                                : Icons.add_shopping_cart_outlined,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    SubtitleTextWidget(
                      label: "${productsModel.productPrice}\$",
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
