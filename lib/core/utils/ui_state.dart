import 'packages.dart';

abstract class StatelessView<T1, T2> extends StatelessWidget {
  final T2 state;

  T1 get widget => (state as State).widget as T1;

  const StatelessView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context);
}