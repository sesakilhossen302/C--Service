import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../Core/AppRoute/app_route.dart';
import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/StaticString/static_string.dart';
import '../../Widgegt/CustomBackButton/custom_back_button.dart';
import 'Controller/service_provider_signup_controller.dart';

class ServiceProviderSignupScreen extends StatefulWidget {
  const ServiceProviderSignupScreen({super.key});

  @override
  State<ServiceProviderSignupScreen> createState() => _ServiceProviderSignupScreenState();
}

class _ServiceProviderSignupScreenState extends State<ServiceProviderSignupScreen> {
  late final ServiceProviderSignupController _controller;

  final List<String> expertiseList = [
    StaticString.expCleaning,
    StaticString.expElectric,
    StaticString.expPlumbing,
    StaticString.expPestControl,
    StaticString.expCooking,
  ];

  @override
  void initState() {
    super.initState();
    _controller = ServiceProviderSignupController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // Custom Circular Back Button
              const CustomBackButton(),

              const SizedBox(height: 28),

              // Header Title & Subtitle
              const Text(
                StaticString.serviceProviderTitle,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                StaticString.signupSubTitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textLightGrey,
                ),
              ),

              const SizedBox(height: 28),

              // Field 1: Full Name Label & Input
              const Text(
                StaticString.fullNameLabel,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.cardBorder, width: 1),
                ),
                child: TextField(
                  controller: _controller.nameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    hintText: StaticString.fullNameHint,
                    hintStyle: TextStyle(
                      color: AppColors.textLightGrey,
                      fontSize: 15,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Field 2: Mobile Number Label & Input
              const Text(
                StaticString.mobileLabel,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.cardBorder, width: 1),
                ),
                child: TextField(
                  controller: _controller.phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: StaticString.mobileHint,
                    hintStyle: TextStyle(
                      color: AppColors.textLightGrey,
                      fontSize: 15,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Field 3: Expertise Label & See More Link
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    StaticString.expertiseLabel,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: _controller.onSeeMorePressed,
                    child: const Text(
                      StaticString.seeMore,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Expertise Chips Wrap
              Wrap(
                spacing: 8.0,
                runSpacing: 10.0,
                children: expertiseList.map((item) {
                  final isSelected = _controller.selectedExpertise.contains(item);
                  return GestureDetector(
                    onTap: () {
                      _controller.toggleExpertise(item, () {
                        setState(() {});
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primaryColor.withAlpha(20)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 1.2,
                        ),
                      ),
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              // Field 4: Price Label & Input
              const Text(
                StaticString.priceLabel,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.cardBorder, width: 1.2),
                ),
                child: TextField(
                  controller: _controller.priceController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                  decoration: const InputDecoration(
                    hintText: StaticString.priceHint,
                    hintStyle: TextStyle(
                      color: AppColors.textLightGrey,
                      fontSize: 15,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Field 5: Password Label & Input
              const Text(
                StaticString.passwordLabel,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.cardBorder, width: 1),
                ),
                child: TextField(
                  controller: _controller.passwordController,
                  obscureText: !_controller.isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: StaticString.passwordSignupHint,
                    hintStyle: const TextStyle(
                      color: AppColors.textLightGrey,
                      fontSize: 15,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _controller.isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.textLightGrey,
                        size: 20,
                      ),
                      onPressed: () {
                        _controller.togglePasswordVisibility(() {
                          setState(() {});
                        });
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Send OTP Action Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () => _controller.onSendOtpPressed(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    StaticString.sendOtp,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Already have account? Login link
              Center(
                child: RichText(
                  text: TextSpan(
                    text: StaticString.alreadyHaveAccount,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textGrey,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: StaticString.login,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, AppRoute.loginScreen);
                          },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
