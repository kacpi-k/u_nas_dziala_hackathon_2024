import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/common/widgets/appbar/app_bar.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/course/pages/course_page_signed.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/home/pages/home.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/questionnaire/widgets/starRating.dart';



class Questionnaire extends StatelessWidget {
  const Questionnaire({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text(
                'Przejrzystość',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              const SizedBox(
                height: 10,
              ),
              StarRating(),
              const SizedBox(
                height: 10,
              ),
              const Center(
                  child: Text('Komunikacja z prelegentem',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 10,
              ),
              StarRating(),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text('Dostepność materiałów szkoleniowych',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 10,
              ),
               StarRating(),
              SizedBox(height: 10,),
              const Center(
                child: Text('Czy uwazasz kurs za wartościowy?',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Nie',
                        style: TextStyle(color: Colors.black54),
                      )),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text('Tak',
                          style: TextStyle(color: Colors.black54)))
                ],
              ),
              SizedBox(height: 10,),
              const Center(
                child: Text('Czy poleciłbyś naszą aplikację znajomym?',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Nie',
                        style: TextStyle(color: Colors.black54),
                      )),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text('Tak',
                          style: TextStyle(color: Colors.black54)))
                ],
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Ankieta została wysłana!'),
                      behavior: SnackBarBehavior.floating,
                      duration: Duration(seconds: 3),)
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                    return HomePage();
                  }));
                }, 
                child: Text('Wyslij ankietę',
                          style: TextStyle(color: Colors.black54, fontSize: 20)))
            ],
          ),
        ),
      ),
    );
  }
}
