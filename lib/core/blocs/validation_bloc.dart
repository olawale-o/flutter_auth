import 'package:rxdart/rxdart.dart';
import '../mixins/validation_mixins.dart';

class ValidationBloc with ValidationMixin{
  //stream controllers
  final BehaviorSubject<String> _email = BehaviorSubject<String>();
  final BehaviorSubject<String> _password  = BehaviorSubject<String>();

  //Stream
  Stream<dynamic> get email$ => _email.stream.transform(validateEmail);
  Stream<dynamic> get password$ => _password.stream.transform(validatePassword);
  Stream<bool> get validSubmit => Rx.combineLatest2(email$, password$, (a, b) => true);

  //Sink
  Sink get _emailSink => _email.sink;
  Sink get _passwordSink => _password.sink;
  //Add value to sink
  void onChangeEmail(String value) => _emailSink.add(value);
  void onChangePassword(String value) => _passwordSink.add(value);
  //Clear sink
  void clearEmail() => _emailSink.add('');
  void clearPassword() => _passwordSink.add('');

  //Stream Value
  String get getEmailStr => _email.value;
  String get getPasswordStr => _password.value;

  void onSubmit(){
    print(getEmailStr);
    print(getPasswordStr);
    //clearEmail();
    //clearPassword();
  }

  void dispose () {
    _email.close();
    _password.close();
  }
}