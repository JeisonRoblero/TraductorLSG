import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_language_translator/features/auth/presentation/provider/authentication_provider.dart';
import 'package:sign_language_translator/features/auth/presentation/screens/login_screen.dart';
import 'package:sign_language_translator/features/auth/presentation/widgets/divider_with_text.dart';
import 'package:sign_language_translator/shared/widgets/blur_app_bar.dart';
import 'package:sign_language_translator/shared/widgets/platform_button.dart';
import 'package:sign_language_translator/shared/widgets/platform_textfield.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confPasswordController = TextEditingController();

  bool _isPasswordMatched = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_checkPasswords);
    _confPasswordController.addListener(_checkPasswords);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confPasswordController.dispose();
    super.dispose();
  }

  void _checkPasswords() {
    setState(() {
      _isPasswordMatched = _passwordController.text == _confPasswordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final paddingBottom = MediaQuery.of(context).padding.bottom;
    final auth = Provider.of<AuthenticationProvider>(context, listen: false);
    final isLoading = context.select<AuthenticationProvider, bool>((provider) => provider.isLoading);
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      extendBodyBehindAppBar: true,
      appBar: BlurAppBar(title: "Traductor LSG", centerTitle: true, backgroundColor: colorScheme.surface.withOpacity(0.5)),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 110,
              ),
              
              // logo
              Image.asset("assets/imgs/auth_background.png", width: 200,),
          
              const SizedBox(
                height: 50,
              ),
          
              // Mnesaje de bienvenida
              Text("Crear una cuenta", style: TextStyle(color: colorScheme.onPrimaryContainer, fontSize: 25, fontWeight: FontWeight.w700),),
      
              const SizedBox(
                height: 30,
              ),

              // Campo de nombres
              PlatformTextfield(
                controller: _nameController,
                backgroundColor: colorScheme.surfaceContainer,
                keyboardType: TextInputType.name,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                fontSize: 17,
                hintText: "Nombres",
              ),
      
              const SizedBox(
                height: 15,
              ),

              // Campo de apellidos
              PlatformTextfield(
                controller: _lastNameController,
                backgroundColor: colorScheme.surfaceContainer,
                keyboardType: TextInputType.name,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                fontSize: 17,
                hintText: "Apellidos",
              ),
      
              const SizedBox(
                height: 15,
              ),
              
              // Campo de correo
              PlatformTextfield(
                controller: _emailController,
                backgroundColor: colorScheme.surfaceContainer,
                keyboardType: TextInputType.emailAddress,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                fontSize: 17,
                hintText: "Correo",
              ),
      
              const SizedBox(
                height: 15,
              ),
      
              // Campo de contraseña
              PlatformTextfield(
                controller: _passwordController,
                backgroundColor: colorScheme.surfaceContainer,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                obscureText: true,
                fontSize: 17,
                hintText: "Contraseña",
              ),

              const SizedBox(
                height: 15,
              ),

              // Confirmar contraseña
              PlatformTextfield(
                controller: _confPasswordController,
                backgroundColor: colorScheme.surfaceContainer,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                obscureText: true,
                fontSize: 17,
                hintText: "Confirma la contraseña",
              ),
      
              const SizedBox(
                height: 30,
              ),
      
              // Botón de crear cuenta
              SizedBox(
                width: double.infinity,
                child: PlatformButton(
                  onPressed: () {
                    auth.createUser(context, _nameController.text, _lastNameController.text, _emailController.text, _passwordController.text);
                  },
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  borderRadius: BorderRadius.circular(10.0),
                  backgroundColor: colorScheme.primary,
                  physicalModel: true,
                  isActive: _isPasswordMatched && !_isLoading,
                  child: isLoading ? Center(child: CircularProgressIndicator(strokeWidth: 3.0, color: colorScheme.onPrimaryFixed),) : Text("Crear cuenta", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: colorScheme.onPrimary),),
                ),
              ),
      
              const SizedBox(
                height: 30,
              ),
      
              // Continuar con otras alternativas
              const DividerWithText(
                text: "O continúa con",
                margin: EdgeInsets.symmetric(horizontal: 20.0),
              ),
      
              const SizedBox(
                height: 25,
              ),
      
              // Autenticación de otras plataformas
              // const PlatformsAuth(),
      
              // const SizedBox(
              //   height: 30,
              // ),
      
              // Registrar ahora
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "¿Ya tienes una cuenta? ",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: colorScheme.onSurface, fontSize: 13.5),
                    ),
                    TextSpan(
                      text: "Inicia sesión",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.deepPurpleAccent, fontWeight: FontWeight.w600, fontSize: 13.5),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                            (Route<dynamic> route) => false,
                          );
                        },
                    ),
                  ],
                ),
              ),
      
              SizedBox(
                height: paddingBottom + 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}