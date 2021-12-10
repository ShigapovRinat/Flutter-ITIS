import 'package:dio/dio.dart';
import 'package:flutter_hw/src/second_hw/chat.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://itis-chat-app-ex.herokuapp.com/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/chat")
  Future<List<Chat>> getChat();

  @POST("/chat")
  Future<Chat> sendMessage(@Body() Chat chat);
}