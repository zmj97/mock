library mock;

/// A package to easily mock requests.

/// Response class, has body getter
/// where response data stored
class Response {
  final Map body;
  Response(this.body);
}

/// store get requests' response functions
Map<String, Function> getResFuns = {};
/// store post requests' response functions
Map<String, Function> postResFuns = {};

/// get method
Future<Response> get(String url, Map params) {
  return Future.delayed(const Duration(milliseconds: 200), () {
    if (getResFuns.containsKey(url)) {
      return Response(getResFuns[url](params));
    } else {
      return Response({'err': 'This request has no mock data'});
    }
  });
}

/// post method
Future<Response> post(String url, Map body) {
  return Future.delayed(const Duration(milliseconds: 200), () {
    if (getResFuns.containsKey(url)) {
      return Response(postResFuns[url](body));
    } else {
      return Response({'err': 'This request has no mock data'});
    }
  });
}

/// config get requests' response data
void onGet(String url, Map Function(Map params) resFun) {
  getResFuns[url] = resFun;
}

/// config post requests' reponse data
void onPost(String url, Map Function(Map body) resFun) {
  postResFuns[url] = resFun;
}