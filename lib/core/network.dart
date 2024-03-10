import 'package:http/http.dart' as http;

const String baseUrl = "";

class NetworkController {
  static Future<String> myHttpClient(
    HttpMethod method, {
    EndPoint? endPoint,
    String defaultUrl = "",
    Iterable? body,
    Map<String, String> parameters = const {},
    Map<String, String> header = const {},
  }) async {
    http.Response response;

    Uri url = Uri.parse(defaultUrl.isEmpty ? "$baseUrl/${endPoint!.name}" : defaultUrl);
    url.replace(queryParameters: parameters);

    switch (method) {
      case HttpMethod.get:
        response = await http.get(url, headers: header);
        break;
      case HttpMethod.post:
        response = await http.post(url, headers: header, body: body);
        break;
      case HttpMethod.put:
        response = await http.put(url, headers: header, body: body);
        break;
      case HttpMethod.delete:
        response = await http.delete(url, headers: header, body: body);
        break;
      case HttpMethod.patch:
        response = await http.patch(url, headers: header, body: body);
        break;
    }

    switch (response.statusCode) {
      case 200:
        return response.body;
      case 404:
        return throw ("Not Found");
      default:
        return "";
    }
  }
}

enum HttpMethod {
  get,
  post,
  put,
  delete,
  patch,
}

enum EndPoint {
  a,
}
