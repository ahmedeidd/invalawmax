import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:inva_lawmax/core/utils/responsive.dart';
import 'package:provider/provider.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_text.dart';
import '../providers/tenant_provider.dart';

class TenantPage extends StatelessWidget {
  const TenantPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tenantProvider = Provider.of<TenantProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: AutoSizeText(
          'Tenants',
          style: AppTextTheme.textTheme.titleLarge?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: tenantProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding:
                  EdgeInsets.symmetric(vertical: Responsive.height(context, 2)),
              itemCount: tenantProvider.tenants.length,
              itemBuilder: (context, index) {
                final tenant = tenantProvider.tenants[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 4,
                  child: ListTile(
                    title: AutoSizeText(
                      tenant.name,
                      style: AppTextTheme.textTheme.titleLarge,
                      maxLines: 1,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.secondary,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
