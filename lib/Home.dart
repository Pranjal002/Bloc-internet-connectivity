import 'package:blocconnectivity/Bloc/internet_bloc.dart';
import 'package:blocconnectivity/Bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<InternetBloc, InternetState >(
        builder: (context, state) {
          if(state is InternetGainedState ){
            return Text("Connected");
          }
          else if( state is InternetLostState){
            return Text("Not Connected");

          }
          else{
            return Text("Loading....");
          }
            
          return Container(

          );
        },
      ),
    );
  }
}
