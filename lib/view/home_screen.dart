import 'package:dateandtime1/provider/date_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
 GlobalKey<ScaffoldState> scaffoldKey=GlobalKey();
class _HomeScreenState extends State<HomeScreen> {
  DateProvider? providerF;
  DateProvider? providerT;
  @override
  Widget build(BuildContext context) {
   providerF=Provider.of<DateProvider>(context,listen: false);
   providerT=Provider.of<DateProvider>(context,listen: true);
    return SafeArea(child:
    Scaffold(
      appBar: AppBar(title: Text("Bottom Sheet"),),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              showModalBottomSheet(context: context, builder: (context) {
                return BottomSheet(onClosing: () {

                }, builder: (context) {
                  return Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.lightBlueAccent.shade100,
                    child: Center(child: Text("Jay Shree Ram"),),
                  );
                },);
              },);
            }, child: Text("Showww"),style: ElevatedButton.styleFrom(backgroundColor: Colors.pink.shade300)),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${providerT!.curday.day} / ${providerT!.curday.month} / ${providerT!.curday.year}" ,style: TextStyle(fontSize: 30))
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () async {
              DateTime? pdate=await showDatePicker(context: context, initialDate: providerT!.seliday, firstDate: DateTime(2001), lastDate: DateTime(2050));
              providerF!.pDate(pdate!);
            }, child: Text("Date pick"),style: ElevatedButton.styleFrom(backgroundColor: Colors.pink.shade300)),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${providerT!.seliday.day} / ${providerT!.seliday.month} / ${providerT!.seliday.year}" ,style: TextStyle(fontSize: 30))
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${providerT!.current.hour} : ${providerT!.current.minute} " ,style: TextStyle(fontSize: 30))
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () async {
              TimeOfDay? ptime=await showTimePicker(context: context, initialTime: TimeOfDay(hour: providerT!.current.hour, minute: providerT!.current.minute));
              providerT!.ptime(ptime!);
            }, child: Text("Time Pick"),style: ElevatedButton.styleFrom(backgroundColor: Colors.pink.shade300)),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${providerT!.selitime.hour} : ${providerT!.selitime.minute} " ,style: TextStyle(fontSize: 30))
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
