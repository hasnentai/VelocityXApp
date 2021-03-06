import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:velocityx_app/pages/home_page.dart';
import 'package:velocityx_app/velocity_app.dart';

class SplashPage extends StatelessWidget {
  static const String routeName = "/";
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: ZStack(
        [
          [
            [
              "Velocity".text.white.xl.bold.size(50).make().box.make(),
              "X".text.yellow400.xl.bold.size(60).make().box.make(),
            ].hStack(crossAlignment: CrossAxisAlignment.center),
            VelocityApp.utilityText.text.xl3.light.black.center.make(),
            VelocityApp.rapidText.text.xl3.light.black.center.make(),
            20.heightBox,
            RaisedButton(
              onPressed: () => context.nav.pushReplacementNamed(HomePage.routeName),
              padding: const EdgeInsets.symmetric(
                vertical: VelocityX.dp20,
                horizontal: VelocityX.dp64,
              ),
              shape: VelocityX.roundedSm,
              color: VelocityX.tealColor700,
              // borderSide: BorderSide(color: Colors.white),
              child: VelocityApp.getStartedText.text.light.white.make(),
            ),
          ].vStack(crossAlignment: CrossAxisAlignment.center, alignment: MainAxisAlignment.center).p16().box.radialGradient([
            VelocityX.redColor400,
            VelocityX.redColor400,
            VelocityX.redColor500,
            VelocityX.redColor500,
          ]).make(),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: ClipPath(
              clipper: MyCustomClipper(),
              clipBehavior: Clip.antiAlias,
              child: VelocityBox(
                  child: Icon(
                LineAwesomeIcons.github,
                size: 50,
                color: Colors.white,
              )).width(120).height(120).alignTopRight.p8.black.make().click(() {
                launch("https://github.com/iampawan/VelocityX");
              }).make(),
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: ClipPath(
              clipper: MyCustomClipper2(),
              clipBehavior: Clip.antiAlias,
              child: VelocityBox(
                  child: Icon(
                LineAwesomeIcons.code,
                size: 50,
                color: Colors.white,
              )).width(120).height(120).alignBottomRight.p8.black.make().click(() {
                launch("https://github.com/iampawan/VelocityXApp");
              }).make(),
            ),
          ),
          Banner(
            message: "Open Source",
            color: VelocityX.tealColor700,
            location: BannerLocation.topStart,
          ),
          Positioned(
            child: "Made with Flutter using VelocityX 💙".text.xl.black.center.make().p16(),
            bottom: 0.0,
          )
        ],
        fit: StackFit.expand,
      ).p16(),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = Path();
    p.lineTo(size.width, 0.0);
    p.lineTo(size.width, size.height);
    p.lineTo(0, 0);
    return p;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class MyCustomClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = Path();
    p.moveTo(size.width, 0.0);
    p.lineTo(0.0, size.height);
    p.lineTo(size.width, size.height);

    return p;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
