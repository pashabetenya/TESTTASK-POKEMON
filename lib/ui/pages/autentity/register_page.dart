import 'package:application/ui/pages/autentity/index.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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

  Future<void> registration() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Fluttertoast.showToast(
        msg: 'Registered successfully.',
      );
      navigationService.navigateTo(Pages.home);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
          msg: 'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
          msg: 'The account already exists for that e-mail.',
        );
      }
    } catch (e) {
      debugPrint('Error: ${e.toString()}');
    }
  }

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
      children: <Widget>[
        EmailTextFormField(
          textController: emailController,
        ),
        PasswordTextFormField(
          textController: passwordController,
        ),
        const SizedBox(
          height: 5.0,
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return PrimaryButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          setState(
            () {
              email = emailController.text;
              password = passwordController.text;
            },
          );
          registration();
        }
      },
      title: 'Register',
    );
  }

  Widget _buildQuestionPanel() {
    return QuestionPanel(
        onPressed: () {
          navigationService.navigateTo(Pages.login);
        },
        description: 'Already have an account?',
        title: 'Login!');
  }
}
