import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_request/controllers/logincontroller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => Text(
                        (controller.register.value) ? 'Register' : 'Login',
                        style: const TextStyle(fontSize: 30),
                      )),
                  const SizedBox(height: 20),
                  Obx(() {
                    if (controller.register.value) {
                      return TextFormField(
                        controller: controller.usernameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
                  Obx(() {
                    if (controller.register.value) {
                      return const SizedBox(height: 20);
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
                  Obx(() {
                    if (controller.register.value) {
                      return TextFormField(
                        controller: controller.phoneController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
                  Obx(() {
                    if (controller.register.value) {
                      return const SizedBox(height: 20);
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty || !value.isEmail) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    controller: controller.passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Obx(() {
                    if (controller.register.value) {
                      return TextFormField(
                        obscureText: true,
                        controller: controller.confirmPasswordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Confirm Password',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          } else if (value !=
                              controller.passwordController.text) {
                            return 'Password doesn\'t match';
                          }
                          return null;
                        },
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
                  Obx(() {
                    if (controller.register.value) {
                      return const SizedBox(height: 20);
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text((!controller.register.value)
                            ? 'Don\'t have an account?'
                            : 'Already have an account?'),
                        TextButton(
                          onPressed: controller.changeRegister,
                          child: Text((!controller.register.value)
                              ? 'Register'
                              : 'Login'),
                        ),
                      ],
                    );
                  }),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: controller.submit,
                    child: Obx(() {
                      if (controller.register.value) {
                        return const Text('Register');
                      } else {
                        return const Text('Login');
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
