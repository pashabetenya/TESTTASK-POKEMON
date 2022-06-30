import 'package:application/ui/pages/autentity/index.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const DrawClip(),
          const TitleText(
            description: 'Create account to continue..',
            titleText1st: 'Welcome',
            titleText2nd: 'to HANDBOOK!',
          ),
          BottomAuthPanel(child: _buildRegisterForm()),
        ],
      ),
    );
  }

  Widget _buildRegisterForm() {
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
                const SizedBox(height: 25.0),
                _buildRegisterButton(),
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
        PasswordTextFormField(),
        SizedBox(
          height: 5.0,
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return PrimaryButton(
      title: 'Register',
      onPressed: () {
        // Home page.
      },
    );
  }

  Widget _buildQuestionPanel() {
    return QuestionPanel(
        onPressed: () {
          // Login page.
        },
        description: 'Already have an account?',
        title: 'Login!');
  }
}
