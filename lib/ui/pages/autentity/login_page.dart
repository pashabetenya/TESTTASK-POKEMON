import 'package:application/ui/pages/autentity/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Future<void> login() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Fluttertoast.showToast(
        msg: 'Logged successfully.',
      );
      navigationService.navigateTo(Pages.home);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
          msg: 'No user found for that e-mail.',
        );
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
          msg: 'Wrong password provided for that user.',
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
          titleText1st: 'Welcome',
          titleText2nd: 'back!',
          description: 'Sign-in to continue..',
        ),
        BottomAuthPanel(
          child: _buildLoginForm(),
        ),
      ],
    ));
  }

  Widget _buildLoginForm() {
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
                _buildInputForm(),
                const SizedBox(height: 5.0),
                _buildForgotPasswordText(),
                const SizedBox(height: 5.0),
                _buildLoginButton(),
                const SizedBox(height: 5.0),
                _buildQuestionPanel(),
              ],
            )),
      ),
    );
  }

  Widget _buildInputForm() {
    return Column(
      children: <Widget>[
        EmailTextFormField(
          textController: emailController,
        ),
        const SizedBox(
          height: 5,
        ),
        PasswordTextFormField(
          textController: passwordController,
        ),
      ],
    );
  }

  Widget _buildForgotPasswordText() {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {
          navigationService.navigateTo(Pages.forgot);
        },
        child: const Text(
          'Forgot password',
          style: TextStyle(
            color: kGreen,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return PrimaryButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          setState(
            () {
              email = emailController.text;
              password = passwordController.text;
            },
          );
          login();
        }
      },
      title: 'Login',
    );
  }

  Widget _buildQuestionPanel() {
    return QuestionPanel(
      onPressed: () {
        navigationService.navigateTo(Pages.register);
      },
      description: 'Don`t have an account?',
      title: 'Register!',
    );
  }
}
