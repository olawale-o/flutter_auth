import 'dart:async';

mixin ValidationMixin {
  final validateEmail = StreamTransformer<String, dynamic>.fromHandlers(handleData:(value, sink) {
    if(value.length == 0) {sink.addError("Please enter an email");}
    else if(!value.contains("@")) {sink.addError("Please enter a valid email");}
    else {sink.add(true);}
  });

  final validatePassword = StreamTransformer<String, dynamic>.fromHandlers(handleData: (value, sink) {
    if(value.length == 0)  {sink.addError("please enter a password");}
    else if(value.length < 4) {sink.addError("password is too short");}
    else if(value.length > 6) {sink.addError("password is too long");}
    else {sink.add(true);}
  });
}