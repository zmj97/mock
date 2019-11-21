import 'package:mock/mock.dart' as http;

void main() {
  (() async {
    http.onGet('/names', (Map params) {
      params.addAll({'name': ['Amy', 'Bob', 'Cindy']});
      return params;
    });
    final res = await http.get('/names', {'param': 'bla bla...'});
    print('get: ' + res.body.toString());
    assert(res.body.toString() == {'param': 'bla bla...', 'name': ['Amy', 'Bob', 'Cindy']}.toString());
  })();
}
