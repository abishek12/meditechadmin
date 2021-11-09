import 'package:flutter/material.dart';
import 'package:medi_tect_admin/constants/colors.dart';
import 'package:medi_tect_admin/constants/routes.dart';
import 'package:medi_tect_admin/screen/addLabTest.dart';
import 'package:medi_tect_admin/screen/add_hospital.dart';
import 'package:medi_tect_admin/screen/add_vaccine.dart';
import 'package:medi_tect_admin/screen/appointment.dart';
import 'package:medi_tect_admin/screen/landing_screen.dart';
import 'package:medi_tect_admin/screen/beds.dart';
import 'package:medi_tect_admin/screen/chat_screen.dart';
import 'package:medi_tect_admin/screen/dashboard_screen.dart';
import 'package:medi_tect_admin/screen/doctors_screen.dart';
import 'package:medi_tect_admin/screen/home_screen.dart';
import 'package:medi_tect_admin/screen/hospital_screen.dart';
import 'package:medi_tect_admin/screen/lab_payment_screen.dart';
import 'package:medi_tect_admin/screen/lab_screen.dart';
import 'package:medi_tect_admin/screen/login_screen.dart';
import 'package:medi_tect_admin/screen/register_patient.dart';
import 'package:medi_tect_admin/screen/register_screen.dart';
import 'package:medi_tect_admin/screen/settings.dart';
import 'package:medi_tect_admin/screen/test_landingScreen.dart';
import 'package:medi_tect_admin/screen/test_loginScreen.dart';
import 'package:medi_tect_admin/screen/test_registration.dart';
import 'package:medi_tect_admin/screen/vaccine.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: MyRoutes.landingScreen,
        theme: ThemeData(
          scaffoldBackgroundColor: Color(MyColor.backgroundColor),
        ),
        routes: {
          MyRoutes.landingScreen: (context) => LandingScreen(),
          MyRoutes.loginScreen: (context) => LoginScreen(),
          MyRoutes.registerScreen: (context) => RegisterScreen(),
          MyRoutes.registerPatientScreen: (context) => RegisterPatientScreen(),
          MyRoutes.homeScreen: (context) => HomeScreen(),
          MyRoutes.chatScreen: (context) => ChatScreen(),
          MyRoutes.doctorScreen: (context) => DoctorScreen(),
          MyRoutes.bedScreen: (context) => BedScreen(),
          MyRoutes.dashboardScreen: (context) => DashboardScreen(),
          MyRoutes.labScreen: (context) => LabScreen(),
          MyRoutes.addLabTest: (context) => AddLabTest(),
          MyRoutes.settingsScreen: (context) => SettingsScreen(),
          MyRoutes.labPaymentScreen: (context) => LabPaymentScreen(),
          MyRoutes.vaccineScreen: (context) => VaccineScreen(),
          MyRoutes.addVaccine: (context) => AddVaccine(),
          MyRoutes.hospitalScreen: (context) => HospitalScreen(),
          MyRoutes.addHospital: (context) => AddHospital(),
          MyRoutes.appointment: (context) => AppointmentScreen(),
          MyRoutes.testLanding: (context) => TestLanding(),
          MyRoutes.testLogin: (context) => TestLogin(),
          MyRoutes.testRegister: (context) => TestRegistration(),
        });
  }
}
