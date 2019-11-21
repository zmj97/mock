import 'package:flutter_test/flutter_test.dart';
import 'package:mock/mock.dart' as http;

void main() {
  test('mock get request', () async {
    http.onGet('/names', (Map params) {
      params.addAll({'name': ['Amy', 'Bob', 'Cindy']});
      return params;
    });
    final res = await http.get('/names', {'param': 'bla bla...'});
    print('get: ' + res.body.toString());
    assert(res.body.toString() == {'param': 'bla bla...', 'name': ['Amy', 'Bob', 'Cindy']}.toString());
  });

  test('mock post request', () async {
    http.onPost('/names', (Map body) {
      body.addAll({'name': ['Amy', 'Bob', 'Cindy']});
      return body;
    });
    final res = await http.post('/names', {'param': 'bla bla...'});
    print('post: ' + res.body.toString());
    assert(res.body.toString() == {'param': 'bla bla...', 'name': ['Amy', 'Bob', 'Cindy']}.toString());
  });
}
