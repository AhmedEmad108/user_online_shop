import 'package:user_online_shop/contants.dart';
import 'package:user_online_shop/core/helper_functions/valid_input.dart';
import 'package:user_online_shop/core/utils/app_color.dart';
import 'package:user_online_shop/core/utils/app_style.dart';
import 'package:user_online_shop/core/widgets/custom_button.dart';
import 'package:user_online_shop/core/widgets/custom_dialog.dart';
import 'package:user_online_shop/core/widgets/custom_dropdown_button_search.dart';
import 'package:user_online_shop/core/widgets/custom_image_picker.dart';
import 'package:user_online_shop/core/widgets/custom_password_text_field.dart';
import 'package:user_online_shop/core/widgets/custom_text_field.dart';
import 'package:user_online_shop/features/2-auth/presentation/cubit/signup_cubit/sign_up_cubit.dart';
import 'package:user_online_shop/features/2-auth/presentation/views/sign_in_view.dart';
import 'package:user_online_shop/features/2-auth/presentation/views/widgets/custom_terms_and_condition.dart';
import 'package:user_online_shop/features/2-auth/presentation/views/widgets/have_or_dont_have_accont.dart';
import 'package:user_online_shop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:country_state_city/country_state_city.dart' as c;

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  late bool isTermsAccepted = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  late String email, password, confirmPassword, userName, phone;
  String? urlImage;

  String? _selectedCountry;
  String? _selectedCity;
  List<c.Country> countries = [];
  List<c.State> cities = [];
  bool isCountriesLoading = false;
  bool isCitiesLoading = false;

  @override
  void initState() {
    super.initState();
    loadCountries();
  }

  void loadCountries() async {
    try {
      setState(() {
        isCountriesLoading = true;
      });
      List<c.Country> allCountries = await c.getAllCountries();
      List<c.Country> countriesWithCities = [];

      for (var country in allCountries) {
        List<c.State> states = await c.getStatesOfCountry(country.isoCode);
        if (states.isNotEmpty) {
          countriesWithCities.add(country);
        }
      }

      setState(() {
        countries = countriesWithCities;
      });
    } catch (e) {
      // TODO
    } finally {
      setState(() {
        isCountriesLoading = false;
      });
    }
  }

  void loadCities(String countryName) async {
    try {
      setState(() {
        isCitiesLoading = true;
      });
      List<c.Country> allCountries = await c.getAllCountries();
      c.Country? selectedCountry = allCountries.firstWhere(
        (country) => country.name == countryName,
      );
      List<c.State> allCities =
          await c.getStatesOfCountry(selectedCountry.isoCode);
      setState(() {
        cities = allCities;
      });
    } catch (e) {
      // TODO
    } finally {
      setState(() {
        isCitiesLoading = false;
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomImagePicker(
                onFileChanged: (url) => urlImage = url,
                auth: true,
                radius: 70,
              ),
              const SizedBox(
                height: 33,
              ),
              CustomTextField(
                hintText: S.of(context).enter_name,
                labels: S.of(context).name,
                controller: nameController,
                validator: (value) {
                  return validInput(
                    context: context,
                    val: value!,
                    type: 'name',
                    max: 20,
                    min: 3,
                  );
                },
                keyboardType: TextInputType.name,
                suffixIcon: const Icon(Icons.person_outline),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                hintText: S.of(context).enter_email,
                labels: S.of(context).email,
                controller: emailController,
                validator: (value) {
                  return validInput(
                    context: context,
                    val: value!,
                    type: 'email',
                    max: 30,
                    min: 10,
                  );
                },
                keyboardType: TextInputType.emailAddress,
                suffixIcon: const Icon(Icons.email_outlined),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                hintText: S.of(context).enter_phone,
                labels: S.of(context).phone,
                controller: phoneController,
                validator: (value) {
                  return validInput(
                    context: context,
                    val: value!,
                    type: 'phone',
                    max: 30,
                    min: 9,
                  );
                },
                keyboardType: TextInputType.phone,
                suffixIcon: const Icon(Icons.phone_android_outlined),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomDropdownButtonSearch(
                labels: S.of(context).country,
                hint: S.of(context).select_country,
                value: _selectedCountry,
                onChanged: (newValue) {
                  setState(() {
                    _selectedCountry = newValue;

                    _selectedCity = null; // Reset city when country changes
                    loadCities(newValue!);
                  });
                },
                items: countries.map((country) => country.name).toList(),
              ),
              SizedBox(
                height: 16,
              ),
              CustomDropdownButtonSearch(
                labels: S.of(context).city,
                hint: _selectedCountry != null
                    ? S.of(context).select_city
                    : S.of(context).select_country_first,
                value: _selectedCity,
                onChanged: (newValue) {
                  setState(() {
                    _selectedCity = newValue;
                  });
                },
                items: cities.map((city) => city.name).toList(),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPasswordTextField(
                label: S.of(context).password,
                controller: passwordController,
                hintText: S.of(context).enter_your_password,
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPasswordTextField(
                label: S.of(context).confirm_password,
                controller: confirmPasswordController,
                hintText: S.of(context).enter_confirm_your_password,
                onSaved: (value) {
                  confirmPassword = value!;
                },
              ),
              SizedBox(
                height: 16,
              ),
              CustomTermsAndCondition(onChanged: (value) {
                setState(() {
                  isTermsAccepted = value;
                });
              }),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                title: S.of(context).sign_up,
                buttonColor: AppColor.primaryColor,
                textStyle: AppStyle.styleBold24().copyWith(
                  color: AppColor.white,
                ),
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (password == confirmPassword) {
                      if (isTermsAccepted) {
                        context
                            .read<SignUpCubit>()
                            .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: password,
                              name: nameController.text,
                              phone: phoneController.text,
                              image: urlImage ?? imageProfile,
                              address: '$_selectedCountry  -  $_selectedCity',
                            );
                      } else {
                        customDialog(
                          context,
                          title:
                              S.of(context).please_accept_terms_and_conditions,
                        );
                      }
                    } else {
                      customDialog(
                        context,
                        title: S
                            .of(context)
                            .password_and_confirm_password_not_match,
                      );
                    }
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              HaveOrDontHaveAccont(
                text: S.of(context).already_have_an_account,
                text2: S.of(context).signin,
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    SignInView.routeName,
                    (route) => false,
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
