import 'package:application/ui/pages/autentity/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

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
        // Home page.
        navigationService.navigateTo(Pages.home);
      },
      title: 'Login',
    );
  }

  Widget _buildQuestionPanel() {
    return QuestionPanel(
      onPressed: () {
        // Register page.
        navigationService.navigateTo(Pages.register);
      },
      description: 'Don`t have an account?',
      title: 'Register!',
    );
  }
}
