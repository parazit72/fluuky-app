enum RequestMethod { get, post, put, delete }

extension RequestMethodString on RequestMethod {
  String get string {
    switch (this) {
      case RequestMethod.get:
        return 'get';
      case RequestMethod.post:
        return 'post';
      case RequestMethod.put:
        return 'put';
      case RequestMethod.delete:
        return 'delete';
    }
  }
}

abstract class APIRequestRepresentable {
  String get url;
  String get endpoint;
  String get path;
  RequestMethod get method;
  Map<String, String>? get headers;
  Map<String, dynamic>? get query;
  dynamic get body;
}
