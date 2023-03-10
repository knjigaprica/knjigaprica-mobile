import 'package:flutter/material.dart';

class BookDescription extends StatefulWidget {
  const BookDescription({super.key});

  @override
  State<BookDescription> createState() => _BookDescriptionState();
}

class _BookDescriptionState extends State<BookDescription> {
  bool isExpanded = false;

  void expand() {
    setState(() {
      isExpanded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Opis',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          '"Živeti opasno, grubo liberalno u korist spostvene štete s refleksima rasipnog i pohotnog do dna uz odgovore na pitanja kako ići i glavom kroz zid jeste razgovorni i ključni vidokrug ove kratke romaneskne sage. Sve je ispričano sapeto i bez ostatka za naredni dn u svitanju. Zbitija su na rubu žileta gde se i haos hvata za rogove, tu nema cenovnika, sve je goli hazard. Ovo štivo je raskolničko, čisti bes i urnebes nemilosrdnog udara u pleksus dana, razgoličeni demoni gde se maske ljudskih lica osipaju u prah. Ne pamtim da sam iščitavao sirovije i surovije hronike jednog življenja..." - Milutin Ž. Pavlov',
          style: const TextStyle(fontSize: 18),
          overflow: isExpanded ? null : TextOverflow.ellipsis,
          maxLines: isExpanded ? null : 5,
        ),
        if (!isExpanded)
          const SizedBox(
            height: 24,
          ),
        if (!isExpanded)
          GestureDetector(
            onTap: expand,
            child: Row(
              children: const [
                Text('Prikaži više',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                Icon(Icons.chevron_right_rounded)
              ],
            ),
          )
      ],
    );
  }
}
