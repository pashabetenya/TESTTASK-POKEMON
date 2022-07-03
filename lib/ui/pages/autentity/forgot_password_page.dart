import 'package:application/ui/pages/autentity/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({
    Key? key,
  }) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final emailContoller = TextEditingController();

  @override
  void dispose() {
    emailContoller.dispose();

    super.dispose();
  }

  String email = '';

  Future<void> send() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(
        msg: 'Password reset e-mail has been sent.',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
          msg: 'No user found for that e-mail.',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const DrawClip(),
          const TitleText(
            description: 'Enter the data to continue..',
            titleText1st: 'Password',
            titleText2nd: 'recovery page',
          ),
          BottomAuthPanel(child: _buildForgotPasswordForm()),
        ],
      ),
    );
  }

  Widget _buildForgotPasswordForm() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35.0,
              vertical: 35.0,
            ),
            child: Column(
              children: <Widget>[
                EmailTextFormField(
                  textController: emailContoller,
                ),
                const SizedBox(height: 10.0),
                _emailDescriptionText(),
                const SizedBox(height: 40.0),
                _buildSendButton(),
                const SizedBox(height: 10.0),
                _buildGoBackButton(),
              ],
            )),
      ),
    );
  }

  Widget _buildSendButton() {
    return PrimaryButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          setState(
            () {
              email = emailContoller.text;
            },
          );
          send();
        }
      },
      title: 'Send',
    );
  }

  Widget _buildGoBackButton() {
    return PrimaryButton(
        onPressed: () {
          navigationService.navigateTo(Pages.login);
        },
        title: 'Go back',
        color: const Color(0xFFA9A9A9));
  }

  Widget _emailDescriptionText() {
    return Container(
      alignment: Alignment.topLeft,
      child: const Text('Enter the data to continue..',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w100,
            color: Colors.black,
          )),
    );
  }
}
