import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class HomeAppointmentListComponent extends StatefulWidget {
  const HomeAppointmentListComponent({super.key, required this.name, required this.companyName, required this.dateTime});
  final String name;
  final String companyName;
  final DateTime dateTime;

  @override
  State<HomeAppointmentListComponent> createState() => _HomeAppointmentListComponentState();
}

class _HomeAppointmentListComponentState extends State<HomeAppointmentListComponent> {

  String getDay(){
    var formatter = DateFormat('yyyy-MM-dd');
    if(formatter.format(widget.dateTime) == formatter.format(DateTime.now())){
      return 'Hoy';
    }
    if(formatter.format(widget.dateTime) == formatter.format(DateTime.now().add(const Duration(days: 1)))){
      return 'Mañana';
    }
    Locale myLocale = Localizations.localeOf(context);
    if(myLocale.languageCode == 'es'){
      String formattedDate = DateFormat("EEEE, d 'de' MMMM 'de' y", 'es_ES').format(widget.dateTime);
      return formattedDate.replaceRange(0, 1, formattedDate[0].toUpperCase());
    }
    if(myLocale.languageCode == 'fr'){}
    return DateFormat('EEEE, MMMM d, y').format(widget.dateTime);
  }

  String getTime(){
    return DateFormat.Hm().format(widget.dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          color: Colors.blue[700]!,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Material(
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Ink.image(
                height: 50,
                image: const NetworkImage(
                  'https://cdn2.melodijolola.com/media/files/styles/nota_imagen/public/field/image/banff-4331689_1920.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(getDay()),
                Text('${widget.name} de ${widget.companyName} a las ${getTime()}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
