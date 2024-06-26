import 'dart:convert';

import 'package:http/http.dart';

import '../models/network_response.dart';

class NetworkCaller{
 static Future<NetworkResponse> getRequest(String url) async {
    try{
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(StatusCode:response.statusCode,
            isSuccess: true,
            responseData: decodedData,
          );

      } else {
        return NetworkResponse(StatusCode:response.statusCode,
            isSuccess: false,
            );

      }
    }catch(e){
      return NetworkResponse(StatusCode: -1,
          isSuccess: false,
          responseData: null,
          errorMessage: e.toString());

    }
  }

 static Future<NetworkResponse> postRequest(String url,Map<String ,dynamic>?body ) async {
    try{
      Response response = await post(Uri.parse(url),body: jsonEncode(body),headers: {
        'Content-type':'Application/json'
      },);
      if(response.statusCode ==200 || response.statusCode == 201 ){


        final decodedData = jsonDecode(response.body);
        return NetworkResponse(StatusCode:response.statusCode,
          isSuccess: true,
          responseData: decodedData,
        );

      } else {
        return NetworkResponse(StatusCode:response.statusCode,
          isSuccess: false,
        );

      }
    }catch(e){
      return NetworkResponse(StatusCode: -1,
          isSuccess: false,
          responseData: null,
          errorMessage: e.toString());

    }
  }


}