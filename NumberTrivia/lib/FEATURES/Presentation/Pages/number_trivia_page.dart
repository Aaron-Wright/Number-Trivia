import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../Widgets/message_display.dart';
import '../Widgets/widgets.dart';
import '../bloc/bloc.dart';
import '../bloc/number_trivia_bloc.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Trivia'),
      ),
      body: SingleChildScrollView(child: buildbody(context)),
    );
  }

  BlocProvider<NumberTriviaBloc> buildbody(BuildContext context) {
    return BlocProvider(
      builder: (_) => sl<NumberTriviaBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: <Widget>[
            SizedBox(
              height: 10,
            ),
            //Top Half
            BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
              builder: (context, state) {
                if (state is Empty) {
                  return MessageDisplay(
                    message: 'Start Searching!',
                  );
                } else if (state is Loading) {
                  return LoadingWidget(message: null,); //!might remove the message: null form this function
                } else if (state is Loaded) {
                  return TriviaDisplay(numberTrivia: state.trivia);
                } else if (state is Error) {
                  return MessageDisplay(
                    message: state.message,
                  );
                }
              },
            ),
            SizedBox(height: 20),
            //Bottom Half
            TriviaControls(),
          ]),
        ),
      ),
    );
  }
}

