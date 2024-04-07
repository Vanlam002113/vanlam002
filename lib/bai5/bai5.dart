import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: AuthScreen(),
      ),
    );
  }
}

enum FormType {
  login,
  register,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  var _formType = FormType.login;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.pink, Colors.purple])),
        ),
        Column(
          children: [
            const Spacer(),
            Transform.rotate(
              angle: -3.14 / 12,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                margin: const EdgeInsets.symmetric(vertical: 30),
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: const Text(
                  'MyShop',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                        label: Text('E-mail'),
                        prefixIcon: Icon(Icons.email_rounded)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        label: Text('Password'),
                        prefixIcon: Icon(Icons.email_rounded)),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    child: SizedBox(
                      height: _formType == FormType.register ? null : 0.0,
                      child: _formType == FormType.register
                          ? const TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  label: Text('Re-Password'),
                                  prefixIcon: Icon(Icons.email_rounded)),
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecondRoute()));
                      setState(() {
                        _formType = FormType.login;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20)),
                    child: const Text('Login'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _formType = FormType.register;
                        });
                      },
                      child: const Text('Register')),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        )
      ],
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text("Your Products"),
          leading: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ThirRoute()));
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 50,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Demo"),
                    Row(
                      children: [
                        Icon(Icons.create),
                        Icon(Icons.delete_outline)
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Product 2"),
                    Row(
                      children: [
                        Icon(Icons.create),
                        Icon(Icons.delete_outline)
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: double.infinity,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Ao Thun"),
                    Row(
                      children: [
                        Icon(Icons.create),
                        Icon(Icons.delete_outline)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class ThirRoute extends StatelessWidget {
  const ThirRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text("Edit Product"),
          leading: IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()));
            },
          ),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Tittle",
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Price",
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Desrcition",
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Image URL",
                ),
              ),
            ],
          ),
        ));
  }
}
