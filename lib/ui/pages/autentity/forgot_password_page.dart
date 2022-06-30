import 'package:application/ui/pages/autentity/index.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({
    Key? key,
  }) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
      child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35.0,
              vertical: 35.0,
            ),
            child: Column(
              children: <Widget>[
                const EmailTextFormField(),
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
      title: 'Send',
      onPressed: () {},
    );
  }

  Widget _buildGoBackButton() {
    return PrimaryButton(
        onPressed: () {
          // Login page.
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
