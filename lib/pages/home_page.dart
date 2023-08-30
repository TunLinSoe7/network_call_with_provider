import 'package:flutter/material.dart';
import 'package:network_call_provider/bloc/home_page_bloc.dart';
import 'package:network_call_provider/network/product_response/response.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>HomePageBloc(),
      child: Scaffold(
        appBar: AppBar(),
        body: Selector<HomePageBloc,List<ProductResponse>?>(
          selector: (_,bloc)=>bloc.getProductResponse,
          builder: (_,product,__){
            return  Column(
                children: [
            Expanded(child:
            product==null?Center(child: const CircularProgressIndicator()):
            ListView.builder(
            itemCount:product.length,
            itemBuilder: (_,index){
              return Container(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: CachedNetworkImage(
                    width: 100,
                    height: 100,
                    imageUrl: "${product[index].image}",
                    placeholder: (_,url)=>const Icon(Icons.account_balance),
                    errorWidget: (_,url,error)=> const Icon(Icons.error),
                  ),
                  title: Text("${product[index].title}"),
                ),
              );
             }))
            ],
            );
          },
        ),
      ),
    );
  }
}
