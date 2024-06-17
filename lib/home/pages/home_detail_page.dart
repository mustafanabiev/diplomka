import 'package:diplomka/home/cubit/home_cubit.dart';
import 'package:diplomka/models/plant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDetailPage extends StatefulWidget {
  const HomeDetailPage({
    super.key,
    required this.plantModel,
    required this.index,
  });

  final PlantModel plantModel;
  final int index;

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.plantModel.name),
        centerTitle: true,
        actions: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  context
                      .read<HomeCubit>()
                      .toggleFavorite(context, widget.plantModel);
                },
                icon: state.plantModel[widget.index].isFavorites
                    ? const Icon(
                        Icons.star,
                        color: Colors.amber,
                      )
                    : const Icon(
                        Icons.star_outline,
                        color: Colors.amber,
                      ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    'assets/images/${widget.plantModel.image}',
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                  child: Text(
                '${widget.plantModel.name}ны өстүрүү',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              )),
              const SizedBox(height: 10),
              const SizedBox(
                child: Text(
                  '''Алма багын өстүрүү сорт тандоого, отургузууга, бак-дарактарды багууга, зыянкечтерден жана илдеттерден коргоого кылдат мамиле жасоону талап кылат. Бул жерде алма дарагын ийгиликтүү өстүрүү үчүн негизги кадамдар: \n1. Сорт тандоо Климат: Сиздин климаттык аймакка ылайыктуу сортту тандаңыз. Максаты: Сизге алма кандай максатта керек экендигин чечиңиз - жегенге, кыям жасоого же сактоого.

2. Сайтты тандоо жана даярдоо
Күнөстүү жер: алма бактары жарык көп керек, күнөстүү жерлерди тандаңыз. Топурак: алма бактары түшүмдүү, жакшы дренаждуу топуракты жакшы көрүшөт. Суу токтоп калган жерлерден алыс болуңуз. 

3. Отургузуу убактысы: Алма бактарын жазында же күзүндө отургузуу жакшы.
Отургузулган тешик: тешикти кенен жана терең кылыңыз (болжол менен 60 см тереңдик жана 80 см туурасы).
Тамыр системасы: отургузуу алдында тамырларды текшерип, бузулган жерлерин алып салыңыз. Көчөттү тешикке салып, тамырларын түздөңүз.
Отургузуу тереңдиги: тамыр моюнчасы жер деңгээлинде болушу керек.
Сугаруу: Отургузулгандан кийин даракты жакшылап сугарыңыз.

4. Алма дарагына кам көрүү
Сугаруу: сууга дайыма, өзгөчө кургак мезгилде.
Азыктандыруу: Жазында жана күзүндө алма багын органикалык жана минералдык жер семирткичтер менен азыктандырыңыз.
Бутоо: Таажыны калыптандыруу үчүн дарактарды кыркыңыз жана оорулуу же бузулган бутактарды алып салыңыз.

5. Оорулардан жана зыянкечтерден коргоо
Алдын алуу: ооруларга жана зыянкечтерге каршы профилактикалык чараларды колдонуңуз, мисалы, фунгициддер жана инсектициддер менен чачуу.
Мульчирование: нымдуулукту сактоо жана отоо чөптөрдү басуу үчүн дарактын айланасындагы топуракты мульчалаңыз.
Тор баштыктар: курт-кумурскалар кирбеши үчүн жемиштерге тор баштыктарды колдонсо болот.

6. Түшүм жыйноо жана сактоо
Түшүм жыйноо: Мөмө-жемишке жана даракка зыян келтирбөө үчүн алмаларды кылдаттык менен алып салыңыз.
Сактоо: алманы салкын, кургак жерде сактаңыз. Погреб же атайын сактоочу жайлар эң ылайыктуу.
Бул кадамдарды аткаруу менен сиз дени сак жана жемиштүү алма бактарын өстүрө аласыз.''',
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
