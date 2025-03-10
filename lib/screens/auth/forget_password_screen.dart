import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_store/consts/contss.dart';
import 'package:grocery_store/services/utils.dart';
import 'package:grocery_store/widgets/auth_button.dart';
import 'package:grocery_store/widgets/text_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const routeName = '/ForgetPasswordScreen';
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _emailTextController = TextEditingController();
  //bool _isLoading = false;
  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  void _forgetPasswordFCT() async {}

  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      body: Stack(children: [ 
        Swiper(
          duration: 800,
          autoplayDelay: 1000,
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              Contss.authImagesPath[index],
              fit: BoxFit.fill, 
            );
          },
          autoplay: true,
          itemCount: Contss.authImagesPath.length,
        ),
        Container(
          color: Colors.black.withOpacity(0.7),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.1,  
              ),
              InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () =>
                    Navigator.canPop(context) ? Navigator.pop(context) : null,
                child: Icon(
                  IconlyLight.arrowLeft2, 
                  color: theme == true ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const TextWidget(
                text: 'Forget password',
                color: Colors.white, 
                textSize: 30,
              ),
              const SizedBox(
                height: 30, 
              ),  
              TextFormField( 
                controller: _emailTextController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration( 
                  hintText: 'Email address',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                textInputAction: TextInputAction.next,
                // onEditingComplete: () => FocusScope.of(context)
                //     .requestFocus(_passFocusNode),
              ),
              const SizedBox(
                height: 15,
              ),
              AuthButton(
                buttonText: 'Reset now',
                fct: () {
                  _forgetPasswordFCT();
                }, 
              )
            ],
          ),
        )
      ]),
    );
  }   
}
