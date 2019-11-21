# mock

A flutter package to easily mock requests.

## How to Use

```dart
import 'package:mock/mock.dart' as http;

http.onGet('/names', (Map params) {
    params.addAll({'name': ['Amy', 'Bob', 'Cindy']});
    return params;
});
final res = await http.get('/names', {'param': 'bla bla...'});
print('get: ' + res.body.toString());
```

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
