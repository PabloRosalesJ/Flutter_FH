import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Counter functions')),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => setState(() => counter = 0),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$counter',
                style: const TextStyle(
                    fontSize: 160, fontWeight: FontWeight.w100)),
            Text(
              'Click${(counter != 1) ? 's' : ''}',
              style: const TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        CustomButton(
            icon: Icons.refresh_outlined,
            onPressed: () => setState(() => counter = 0)),
        const SizedBox(height: 10),
        CustomButton(
            icon: Icons.plus_one, onPressed: () => setState(() => counter++)),
        const SizedBox(height: 10),
        CustomButton(
            icon: Icons.exposure_minus_1_outlined,
            onPressed: () => setState(() {
                  if (counter == 0) return;
                  counter--;
                }))
      ]),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      /* botones redondeados */
      // shape: const StadiumBorder(),
      enableFeedback: false,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
