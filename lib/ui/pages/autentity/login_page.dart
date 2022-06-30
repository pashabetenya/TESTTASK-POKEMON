import 'package:application/ui/pages/autentity/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      children: const <Widget>[
        EmailTextFormField(),
        SizedBox(
          height: 5,
        ),
        PasswordTextFormField(),
      ],
    );
  }

  Widget _buildForgotPasswordText() {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {
          // Forgot password page.
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
        // Login page.
      },
      title: 'Login',
    );
  }

  Widget _buildQuestionPanel() {
    return QuestionPanel(
      onPressed: () {
        // Register page.
      },
      description: 'Don`t have an account?',
      title: 'Register!',
    );
  }
}
