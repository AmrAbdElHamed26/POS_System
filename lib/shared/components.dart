import 'package:flutter/material.dart';

Widget customizedTextFormField(
    {
      required TextEditingController textEditingController,
      required String hintText,
      required TextInputType textInputType,
      bool secure = false,
      Icon? suffix,
      Icon? pre,
      void Function()? show,
    }
    )=>Material(
        elevation: 10.0,
        shadowColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.transparent, ),
        ),
       child: TextFormField(
        decoration:
        InputDecoration(

            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[500],
            ),
            prefixIcon: pre,
            suffixIcon: suffix != null? IconButton(
              icon: suffix,
              onPressed: show
          ) : null,
        ),
        controller: textEditingController,
        keyboardType: textInputType,
        obscureText: secure,
      ),
);
class CustomizedButton extends StatelessWidget {
  Widget text;
  void Function()? onPressed;
  double height;
  double? width;
  CustomizedButton({
    required this.text,
    required this.onPressed,
    this.height=60,
    this.width,
});

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap:onPressed ,
        child: SizedBox(
          width: width??MediaQuery.sizeOf(context).width,
          height: height,
          child:   Material(
              elevation: 10.0,
              shadowColor: Colors.grey[200],
              color: Colors.black,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.transparent, ),
          ),
          child:   text,
        ),
     ),
      );
  }
}

class GoogleButton extends StatelessWidget {
  final void Function()? onPressed;

  const GoogleButton(this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 60,
        child:   Material(
          elevation: 10.0,
          shadowColor: Colors.grey[200],
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.transparent, ),
          ),
          child:  const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/google.jpg'),
                width: 28,
                height: 28,
              ),
              Text(
                '   Continue with Google',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
class CustomizedAppBar extends StatelessWidget {
  const CustomizedAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 88,right: 88,top: 26,bottom: 26),
        child: Row(

          children: [
            const Text(
              'POS System',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),

            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width/7,
            ),
            GestureDetector(
              onTap: (){

              },
              child: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width/12,
            ),
            GestureDetector(
              onTap: (){},
              child: const Text(
                'Help',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width/12,
            ),
            GestureDetector(
              onTap: (){},
              child: const Text(
                'Payment',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width/7,
            ),
            GestureDetector(
              onTap: (){},
              child: const Text(
                'Sign in',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width/12,
            ),
            GestureDetector(
              onTap: (){},
              child: const Text(
                'Register',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
