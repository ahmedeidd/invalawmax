import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_text.dart';
import '../../../../core/resources/custom_textField.dart';
import '../../../../core/utils/responsive.dart';
import '../../../tenants/presentation/pages/tenant_page.dart';
import '../../../tenants/presentation/providers/tenant_provider.dart';
import '../providers/auth_provider.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  //------------------------------------
  final _formKey = GlobalKey<FormState>();
  //--------------------------------------
  String? username;
  String? password;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  //------------------------------------
  bool showPassword = true;
  IconData suffixIcon = Icons.visibility_off_outlined;
  void changeSuffixIcon(context) {
    showPassword = !showPassword;
    if (showPassword) {
      setState(() {
        suffixIcon = Icons.visibility_off_outlined;
      });
    } else {
      setState(() {
        suffixIcon = Icons.visibility_outlined;
      });
    }
  }

  //------------------------------------

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: AutoSizeText(
          'Login',
          style: AppTextTheme.textTheme.titleLarge?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.width(context, 6),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Username
              CustomTextField(
                controller: usernameController,
                labelText: 'Username',
                onSaved: (value) {
                  username = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
              ),

              // pass
              CustomTextField(
                labelText: "Password",
                controller: passController,
                keyboardType: TextInputType.emailAddress,
                obscureText: showPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    suffixIcon,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    changeSuffixIcon(context);
                  },
                ),
                onSaved: (value) {
                  password = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
              ),

              SizedBox(height: Responsive.height(context, 2)),

              // Login
              InkWell(
                onTap: () async {
                  bool result = await InternetConnectionChecker().hasConnection;
                  if (result == true) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      var success = authProvider.login(
                        username!,
                        password!,
                      );
                      success.then((_) {
                        final tenantProvider =
                            Provider.of<TenantProvider>(context, listen: false);
                        // Fetch tenants when the screen is loaded
                        tenantProvider.fetchTenants(authProvider.accessToken!);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => TenantPage()),
                        );
                      }).catchError((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Invalid username or password'),
                          ),
                        );
                      });
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No Internet'),
                      ),
                    );
                  }
                },
                child: Container(
                  height: Responsive.height(context, 5),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: authProvider.isLoading
                        ? const CircularProgressIndicator(
                            strokeWidth: 1,
                          )
                        : AutoSizeText(
                            "Login",
                            style: AppTextTheme.textTheme.labelLarge?.copyWith(
                              color: Colors.white,
                            ),
                            maxLines: 1,
                          ),
                  ),
                ),
              ),

              if (authProvider.error != null)
                Padding(
                  padding: EdgeInsets.only(top: Responsive.height(context, 2)),
                  child: AutoSizeText(
                    "Invalid username or password",
                    style: AppTextTheme.textTheme.labelLarge?.copyWith(
                      color: AppColors.error,
                    ),
                    maxLines: 1,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
