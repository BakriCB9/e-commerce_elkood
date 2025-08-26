import 'package:dio/dio.dart';
import 'package:ecommerce_elk/core/network/remote/api_constants.dart';
import 'package:ecommerce_elk/features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:ecommerce_elk/features/home/data/model/product_response_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource  {
 final Dio _dio;
const   HomeRemoteDataSourceImpl(this._dio);
  
  @override
  Future<ProductResponseModel> getAllProduct() async{
    final response=await _dio.get(ApiConstants.product);
    print("the response is ${response.data}");
    return ProductResponseModel.fromJson(response.data); 
  }
}