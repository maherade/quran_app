// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:islami_app/business_logic/app_cubit/app_cubit.dart';
// import 'package:islami_app/componants/componants.dart';
//
// import '../../../styles/color_manager.dart';
// import '../../../widgets/lower_row.dart';
//
// class AudioScreen extends StatefulWidget {
//   String ?surahName;
//   int ?index;
//
//
//   AudioScreen({super.key});
//
//   @override
//   State<AudioScreen> createState() => _AudioScreenState();
// }
//
// class _AudioScreenState extends State<AudioScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: ColorManager.grey,
//         appBar: defaultAppBar(
//           title: '44',
//           isSideMenuShawn: true,
//           context: context,
//         ),
//         body: BlocConsumer<AppCubit, AppState>(
//           builder: (context, state) {
//             var cubit = AppCubit.get(context);
//             return Container(
//               child: Center(
//                 child: GestureDetector(
//                   onTap: (){
//                      cubit.audioPlayerFunction();
//                   },
//                   child: Icon(
//                     Icons.play_arrow
//                   ),
//                 ),
//               )
//             );
//           },
//           listener: (context, state) {},
//         ),
//       ),
//     );
//   }
// }
