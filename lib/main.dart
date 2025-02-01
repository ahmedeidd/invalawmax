import 'package:flutter/material.dart';
import 'package:inva_lawmax/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:inva_lawmax/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:inva_lawmax/features/authentication/domain/use_cases/authenticate_user.dart';
import 'package:inva_lawmax/features/authentication/presentation/providers/auth_provider.dart';
import 'package:inva_lawmax/features/tenants/data/datasources/api_remote_data_source.dart';
import 'package:inva_lawmax/features/tenants/data/repositories/tenant_repository_impl.dart';
import 'package:inva_lawmax/features/tenants/domain/use_cases/get_tenants.dart';
import 'package:provider/provider.dart';

import 'features/Splash/presentation/pages/splash_page.dart';
import 'features/tenants/presentation/providers/tenant_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(
            AuthenticateUser(
              AuthRepositoryImpl(AuthRemoteDataSource()),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => TenantProvider(
            GetTenants(
              TenantRepositoryImpl(ApiRemoteDataSource()),
            ),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LawMax',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFd05d35),
        colorScheme: ColorScheme.light(
          secondary: Color(0xFF06495f),
        ),
      ),
      home: SplashPage(),
    );
  }
}
