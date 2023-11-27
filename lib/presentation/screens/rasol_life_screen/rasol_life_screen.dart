import 'package:flutter/material.dart';
import 'package:islami_app/componants/componants.dart';
import 'package:islami_app/styles/color_manager.dart';

class RasolLifeScreen extends StatelessWidget {
  const RasolLifeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grey,
      appBar: defaultAppBar(
      context: context, title: "سيرة الرسول", isSideMenuShawn: false),
      body: Padding(
    padding: const EdgeInsets.all(15),
    child: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "نسب النبي ومولده",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Text(
                "كان رسول الله -صلّى الله عليه وسلّم- أشرف الناس نسباً وأعظمهم مكانةً وفضلاً، فهو محمد بن عبد الله بن عبد المطلب بن هاشم بن عبد مناف بن قصي بن كلاب بن مرة بن كعب بن لؤي بن غالب بن فهر بن مالك بن النضر بن كنانة بن خزيمة بن مدركة بن إلياس بن مضر بن نزار بن معد بن عدنان.[١] وقد تزوّج والد النبي عبد الله من آمنة بنت وهب، ووُلد النبي -عليه الصلاة والسلام- يوم الاثنين الثاني عشر من شهر ربيع الأول من عام الفيل، وهو العام الذي توجّه فيه أبرهة لهدم الكعبة، إلّا أنّ العرب تصدّت له، وأخبره عبد المطلّب بأنّ للبيت ربٌّ يحميه، فقدم أبرهة مع الفيلة، فأرسل عليهم الله طيوراً تحمل حجارةً من نارٍ أهلكتهم، وبذلك حمى الله البيت من أي أذى،[٢] وقد توفي والده وهو حملٌ في بطن أمه على الصحيح من أقوال العلماء، فوُلد الرسول يتيماً، قال -تعالى-: (أَلَمْ يَجِدْكَ يَتِيمًا فَآوَى).",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                    )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              "حياته في الأربعين عامًا قبل النبوة رضاعته",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Text(
                'رضع محمدٌ -عليه الصلاة والسلام- من حليمة السعدية بعد أن قدمت إلى قريش تلتمس أيٍ من الرضعاء، وكان لها ابناً رضيعاً لا تجد ما يسدّ جوعه، ذلك بعد أن رفضت نساء بن سعد إرضاع النبي -عليه السلام- بسبب فقده لوالده؛ ظنّاً منهنّ أن لا تعود عليهنّ رضاعته بالخير والأجر، وبسبب ذلك نالت حليمة السعدية بركةً في حياتها وخيراً عظيماً لم ترَ مثله قطّ، ونشأ محمّد -عليه السلام- بخلاف غيره من الشباب من حيث القوة والشدة.[٢] وعادت به إلى أمّه بعد أن بلغ العامين من عمره واستأذنتها ببقاء محمدٍ عندها خوفاً عليه من الأمراض في مكة، وعاد معها بالفعل، وفي أحد الأيام أتاه جبريل وشقّ صدره واستخرجه، واستخرج من قلبه علقةً وقال إنها حظّ الشيطان منه، فغسلها بماء زمزم في طست من ذهب، ثمّ لأمه وأعاده مكانه، فكانت حادثة شقّ الصدر، وكان ذلك الأمر الفاصل في عودته إلى أمه.[٢] أخرج الإمام مسلم عن أنس بن مالك -رضي الله عنه-: (أنَّ رَسولَ اللهِ صَلَّى اللَّهُ عليه وسلَّمَ أتاهُ جِبْرِيلُ صَلَّى اللَّهُ عليه وسلَّمَ وهو يَلْعَبُ مع الغِلْمانِ، فأخَذَهُ فَصَرَعَهُ، فَشَقَّ عن قَلْبِهِ، فاسْتَخْرَجَ القَلْبَ، فاسْتَخْرَجَ منه عَلَقَةً، فقالَ: هذا حَظُّ الشَّيْطانِ مِنْكَ، ثُمَّ غَسَلَهُ في طَسْتٍ مِن ذَهَبٍ بماءِ زَمْزَمَ، ثُمَّ لأَمَهُ، ثُمَّ أعادَهُ في مَكانِهِ...).',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                    )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              "كفالته",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Text(
                'توفيت والدة النبي -عليه السلام- آمنة بنت وهب وهو ابن ست سنواتٍ، وكانت عائدةً به من منطقة الأبواء؛ وهي منطقةٌ واقعةٌ بين مكة والمدينة، إذ كانت في زيارةٍ لأخواله من بني عدي من بني النجار، فانتقل بعدها للعيش في كفالة جدّه عبد المطلب حيث كان يعتني به اعتناءً شديداً؛ ظانّاً فيه الخير والشأن العظيم، ثمّ توفي جدّه والنبي في الثامنة من عمره، وانتقل بعدها للعيش في كفالة عمه أبي طالب، وكان يأخذه معه في رحلاته التجارية، وفي إحدى الرحلات أخبره إحدى الرهبان بأنّ محمداً سيكون ذو شأنٍ عظيمٍ.',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                    )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              "عمله برعي للأغنام",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Text(
                "عمل الرسول -عليه الصلاة والسلام- في رعي أغنام أهل مكة، وفي ذلك يقول -عليه الصلاة والسلام-: (ما بَعَثَ اللَّهُ نَبِيًّا إلَّا رَعَى الغَنَمَ، فقالَ أصْحابُهُ: وأَنْتَ؟ فقالَ: نَعَمْ، كُنْتُ أرْعاها علَى قَرارِيطَ -جزء من الدينار والدرهم- لأهْلِ مَكَّةَ)،[٦] وبذلك كان النبي -عليه السلام- قدوةً في كسب الرزق.",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                    )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              "عمله بالتجارة",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Text(
                "كانت خديجة بنت خويلد -رضي الله عنها- ذات مالٍ كثيرٍ ونسبٍ رفيعٍ، وكانت تعمل في التجارة، وحين بلغها أن محمداً رجلٌ صادقٌ في قوله أمينٌ في عمله كريمٌ في أخلاقه استأمنته على الخروج تاجراً بأموالها مع غلامٍ لها يُدعى ميسرة مقابل الأجر، فخرج -عليه الصلاة والسلام- تاجراً إلى بلاد الشام، وجلس في الطريق تحت ظلّ شجرةٍ قريبةٍ من راهبٍ، فأخبر الراهب ميسرة أنّ مَن نزل تحت تلك الشجرة لم يكن إلّا نبياً، وأخبر ميسرة خديجة بقول الراهب، ممّا كان سبباً في طلبها الزواج من الرسول، فخطبها له عمّه حمزة، وتزوّجا.[٢]",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                    )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              "مشاركته في بناء الكعبة",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Text(
                "عقدت قريش العزم على تجديد بناء الكعبة؛ لحمايتها من الهدم بسبب السيول، واشترطوا بناءها من الأموال الطيبة التي لم يدخلها أي نوعٍ من الربا أو الظلم، وتجرّأ الوليد بن المغيرة على الهدم، ثم شرعوا بالبناء شيئاً فشيئاً إلى أن وصلوا إلى موضع الحجر الأسود، إذ وقع الخلاف بينهم في مَن سيضعه في موضعه، وتراضوا على قبول حكم أول داخلٍ عليهم، وكان الرسول -عليه الصلاة والسلام-، وأشار عليهم بأن يضع الحجر الأسود على ثوبٍ تحمله كل قبيلةٍ من طرفٍ ليضعه في مكانه، وقبلوا بحكمه دون خلافٍ، وبذلك كان رأي الرسول -عليه الصلاة والسلام- عاملاً في عدم تنازع قبائل قريش وعدم خلافها فيما بينها.[٢]",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                    )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              "بداية الوحي",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Text(
                "كان الرسول -عليه الصلاة والسلام- يخلو بنفسه في غار حراء في شهر رمضان تاركاً كلّ من حوله؛ مبتعداً عن كلّ باطلٍ، محاولاً التقرّب من كلّ صوابٍ قدر ما استطاع، متفكّراً في خلق الله وإبداعه في الكون، وكانت رؤياه واضحةً لا لبس فيها، وبينما هو في الغار جاءه ملكٌ قائلاً: (اقرأ)، فردّ الرسول قائلاً: (ما أنا بقارئ)، وتكررّ الطلب ثلاث مرّاتٍ، وقال الملك في المرة الأخيرة: (اقرأ باسم ربك الذي خلق)، فعاد إلى خديجة وهو في حالة فزعٍ شديدٍ ممّا حصل معه، فطمأنته.[٨] وفي ذلك روت أم المؤمنين عائشة -رضي الله عنها-: (أَوَّلُ ما بُدِئَ به رَسولُ اللَّهِ صَلَّى اللهُ عليه وسلَّمَ مِنَ الوَحْيِ الرُّؤْيَا الصَّادِقَةُ في النَّوْمِ، فَكانَ لا يَرَى رُؤْيَا إلَّا جَاءَتْ مِثْلَ فَلَقِ الصُّبْحِ، فَكانَ يَأْتي حِرَاءً فَيَتَحَنَّثُ فِيهِ، وهو التَّعَبُّدُ، اللَّيَالِيَ ذَوَاتِ العَدَدِ، ويَتَزَوَّدُ لذلكَ، ثُمَّ يَرْجِعُ إلى خَدِيجَةَ فَتُزَوِّدُهُ لِمِثْلِهَا، حتَّى فَجِئَهُ الحَقُّ وهو في غَارِ حِرَاءٍ، فَجَاءَهُ المَلَكُ فِيهِ، فَقالَ: اقْرَأْ، فَقالَ له النبيُّ صَلَّى اللهُ عليه وسلَّمَ: فَقُلتُ: ما أنَا بقَارِئٍ، فأخَذَنِي فَغَطَّنِي حتَّى بَلَغَ مِنِّي الجَهْدُ، ثُمَّ أرْسَلَنِي فَقالَ: اقْرَأْ، فَقُلتُ: ما أنَا بقَارِئٍ، فأخَذَنِي فَغَطَّنِي الثَّانِيَةَ حتَّى بَلَغَ مِنِّي الجَهْدُ، ثُمَّ أرْسَلَنِي فَقالَ: اقْرَأْ، فَقُلتُ: ما أنَا بقَارِئٍ، فأخَذَنِي فَغَطَّنِي الثَّالِثَةَ حتَّى بَلَغَ مِنِّي الجَهْدُ، ثُمَّ أرْسَلَنِي فَقالَ: {اقْرَأْ باسْمِ رَبِّكَ الذي خَلَقَ} [العلق: 1]- حتَّى بَلَغَ - {عَلَّمَ الإنْسَانَ ما لَمْ يَعْلَمْ} [العلق: 5]).[٩][٨] ثمّ أخذت به خديجة -رضي الله عنها- إلى ابن عمّها ورقة بن نوفل، وكان شيخاً كبيراً لا يُبصر يكتب الإنجيل بالعبرية، وأخبره الرسول بما حصل، فقال ورقة: (هذا النَّامُوسُ الذي أُنْزِلَ علَى مُوسَى، يا لَيْتَنِي فِيهَا جَذَعًا، أكُونُ حَيًّا حِينَ يُخْرِجُكَ قَوْمُكَ، فَقالَ رَسولُ اللَّهِ صَلَّى اللهُ عليه وسلَّمَ: أوَمُخْرِجِيَّ هُمْ فَقالَ ورَقَةُ: نَعَمْ، لَمْ يَأْتِ رَجُلٌ قَطُّ بمِثْلِ ما جِئْتَ به إلَّا عُودِيَ، وإنْ يُدْرِكْنِي يَوْمُكَ أنْصُرْكَ نَصْرًا مُؤَزَّرًا).[٩] ثمّ توفي ورقة، وانقطع الوحي عن الرسول -عليه الصلاة والسلام- فترةً من الزمن،[٨] وقيل إنّها استمرت لأيامٍ فقط، والغاية من ذلك طمأنة الرسول وتشويقه للوحي مرةً أخرى، إلّا أنّ النبي -عليه السلام- لم ينقطع عن الخلوة بنفسه في غار حراء، بل استمرّ على ذلك، وفي إحدى الأيام سمع صوتاً من السماء وكان جبريل -عليه السلام-، ونزل بقول الله -تعالى-: (يَا أَيُّهَا الْمُدَّثِّرُ* قُمْ فَأَنذِر* وَرَبَّكَ فَكَبِّرْ* وَثِيَابَكَ فَطَهِّرْ* وَالرُّجْزَ فَاهْجُرْ)،[١٠] وبذلك أمر الله -تعالى- نبيّه بالدعوة إلى توحيده وعبادته وحده.[١١]",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                    )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              '''العهد المكي
الدعوة السرية''',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Text(
                '''لم تستقر أحوال الدعوة في مكة بسبب انتشار عبادة الأصنام والإشراك بالله؛ لذلك كان من الصعب الدعوة إلى توحيد الله فيها بشكلٍ مباشرٍ في بداية الأمر، فما كان من رسول الله إلّا الإسرار بالدعوة، وبدأ بدعوة أهل بيته ومن رأى فيه الصدق والرغبة بمعرفة الحقّ، فكانت زوجته خديجة ومولاه زيد بن حارثة وعلي بن أبي طالبٍ وأبو بكر الصديق أوّل من آمن بدعوته، ثمّ ساند أبو بكر الرسول في دعوته فأسلم على يديه:عثمان بن عفان، والزبير بن العوّام، وعبد الرحمن بن عوف، وسعد بن أبي وقاص، وطلحة بن عبيد الله، ثمّ انتشر الإسلام في مكة شيئاً فشيئاً إلى أن جهر بالدعوة بعد ثلاث سنواتٍ من الإسرار بها.''',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                    )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              "بداية الدعوة الجهرية",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Text(
                '''بدأ رسول الله -عليه السلام- بدعوة عشيرته جهراً، قال تعالى: (وَأَنذِرْ عَشِيرَتَكَ الْأَقْرَبِينَ)،[١٣] فصعد الرسول على جبل الصفا ودعا قبائل قريش إلى توحيد الله فاستهزؤا به، إلّا أنّ الرسول لم يتوانَ في الدعوة، وأخذ أبو طالب على نفسه حماية الرسول، ولم يلتفت إلى أقوال قريش بصدّ الرسول عن دعوته.[١٢]''',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                    )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              "المقاطعة",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Text(
                '''اتّفقت قبائل قريش على مقاطعة الرسول ومن آمن به ومحاصرتهم في شِعب بني هاشم، وكانت تلك المقاطعة بعدم التعامل معهم في البيع أو الشراء، إضافةً إلى عدم تزويجهم أو الزواج منهم، وقد وُثّقت تلك البنود على لوحةٍ وعُلّقت على جدار الكعبة، واستمرّ الحصار مدة ثلاث سنواتٍ، وانتهى بعد أن تشاور هشام بن عمرو مع زهير بن أبي أميّة وغيره في إنهاء الحصار، وهمّوا بشقّ وثيقة المقاطعة ليجدوا بأنّها قد اندثرت إلّا "باسمك اللهم" منها، وبذلك فُكّ الحصار.[١٤]''',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                    )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              "عام الحزن",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Text(
                "توفيّت السيدة خديجة التي كانت بمثابة السند لرسول الله قبل هجرته إلى المدينة بثلاث سنواتٍ، وفي ذات العام مرض أبو طالب الذي كان يحمي الرسول من أذى قريش مرضاً شديداً، واستغلّت قريش موقف مرضه وبدأت بالتعرّض للرسول بالأذى الشديد، وذهبت مجموعة من أشراف قريش إلى أبي طالب حين اشتدّ مرضه وطلبت منه أن يكفّ الرسول عن دعوته، فحدّثه أبو طالب بما يريدون، ولم يلتفت لذلك، وقبل وفاة أبي طالب حاول معه الرسول بنطق الشهادتين إلّا أنّه لم يستجب، وتوفي على حاله، وبوفاته ووفاة خديجة -رضي الله عنها- حزن الرسول حزناً شديداً؛ إذ كانا بمثابة السند والدعم والحماية له، وسمّي ذلك العام بعام الحزن.[١٥]",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                    )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              "الدعوة خارج مكة",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Text(
                "توجّه رسول الله -عليه السلام- إلى الطائف في سبيل دعوة قبيلة ثقيف إلى توحيد الله بعد وفاة عمّه وزوجته، وتعرّض للأذى من قريش، طالباً من ثقيف نصرته وحمايته، والإيمان بما جاء، راجياً منهم القبول، إلّا أنهّم لم يستجيبوا وقابلوه بالسخرية والاستهزاء.[١٦]",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                    )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              "الهجرة إلى الحبشة",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Text(
                "حثّ رسول الله أصحابه على الهجرة إلى أرض الحبشة؛ نظراً لما تعرّضوا له من التعذيب والأذى، مخبراً إيّاهم بأنّ فيها ملكاً لا يُظلم عنده أحدٌ، فخرجوا مهاجرين، وكانت تلك أوّل هجرةٍ في الإسلام، وقد بلغ عددهم ثلاثاً وثمانين رجلاً، وحين علمت قريش بأمر الهجرة أرسلوا عبد الله بن أبي ربيعة وعمرو بن العاص بالهدايا والعطايا إلى النجاشي ملك الحبشة وطلبوا منه ردّ المسلمين المهاجرين؛ احتجاجاً بأنّهم فارقوا دينهم الذي كانوا عليه، إلّا أنّ النجاشي لم يستجب لهم.[١٧] طلب النجاشي من المسلمين بيان موقفهم، فتكلّم عنهم جعفر بن أبي طالب، وحدّث النجاشي بأنّ الرسول أرشدهم إلى طريق الصلاح والحق بعيداً عن طريق الفواحش والرذائل فآمنوا به، وتعرّضوا للأذى والسوء بسبب ذلك، وقرأ عليه جعفر بداية سورة مريم فبكى النجاشي بكاءً شديداً، وأخبر رسل قريش بأنّه لن يسلّم أحداً منهم، وردّ هداياهم إليهم، إلّا أنّهما عادا إلى النجاشي في اليوم التالي يخبرانه بأنّ المسلمين يتأوّلون القول على عيسى بن مريم، وسمع من المسلمين رأيهم بعيسى فأخبروه بأنّه عبد الله ورسوله، وبذلك صدّق النجاشي المسلمين وردّ عبد الله وعمرو.[١٧]",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                    )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              "الإسراء والمعراج",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Text(
                "اختلفت الروايات التي حدّدت تاريخ رحلة الإسراء والمعراج؛ فقيل إنّها كانت في ليلة السابع والعشرين من شهر رجب من السنة العاشرة من النبوة، ومنهم من قال بأنّها كانت بعد البعثة بخمس سنواتٍ، وكانت الرحلة بحيث أُسري برسول الله من البيت الحرام في مكة المكرمة إلى بيت المقدس على دابةٍ تسمّى البراق برفقة جبريل -عليه السلام-.[١٨] ثمّ عُرج به إلى السماء الدنيا حيث التقى بآدم -عليه السلام-، ثمّ إلى السماء الثانية والتقى بيحيى بن زكريا وعيسى بن مريم -عليهما السلام-، ثمّ إلى السماء الثالثة التي رأى فيها يوسف -عليه السلام-، ثمّ التقى بإدريس -عليه السلام- في السماء الرابعة، وهارون بن عمران -عليه السلام- في السماء الخامسة، وموسى بن عمران في السماء السادسة، وإبراهيم -عليه السلام- في السماء السابعة، وتمّ السلام بينهم وإقرارهم بنبوّة محمّدٍ -عليه السلام-، ثمّ رُفع بمحمدٍ إلى سدرة المنتهى، وفرض الله عليه خمسين صلاة، ثمّ خففّها إلى خمسٍ.[١٨]",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                    )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              "بيعة العقبة الأولى والثانية",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Text(
                "أتى وفدٌ من الأنصار يبلغ عددهم اثني عشر رجلاً إلى الرسول ليبايعوه على توحيد الله -سبحانه- وعدم السرقة وعدم الوقوع في الزنا أو المعاصي أو القول الزور، وتمّت تلك البيعة في مكانٍ يسمّى العقبة؛ ولذلك سمّيت ببيعة العقبة الأولى، وأرسل معهم الرسول مصعب بن عمير يعلّمهم القرآن ويبيّن لهم أمور الدين، وفي العام التالي في موسم الحج قدم إلى رسول الله ثلاث وسبعون رجلاً وامرأتين؛ ليبايعوه، وتمّت بذلك بيعة العقبة الثانية.[١٩]",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                    )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              "الهجرة النبوية",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Text(
                "هاجر المسلمون إلى المدينة المنورة؛ حفاظاً على دينهم وأنفسهم، ولإقامة وطنٍ آمنٍ يعيشون فيه وفق أصول الدعوة، وكان أبو سلمة وعائلته أول من هاجر، وتبعه صهيب بعد أن تنازل عن كلّ ما يملك من مالٍ لقريش في سبيل توحيد الله والهجرة في سبيله، وهكذا تبع المسلمون بعضهم البعض في الهجرة حتى كادت مكّة أن تصبح خاليةً من المسلمين، ممّا أدّى بقريش إلى الخوف على نفسها من عواقب هجرة المسلمين، فاجتمع نفرٌ منها في دار الندوة بحثاً عن طريقةٍ للتخلّص بها من الرسول -عليه الصلاة والسلام-، وانتهى بهم الأمر إلى أن يأخذوا من كل قبيلةٍ شاباً ويضربون الرسول ضربة رجلٍ واحدٍ؛ ليتفرّق دمه بين القبائل ولا يستطيع بنو هاشم على الثأر منهم.[٢٠] في ذات الليلة أذِن الله لرسوله بالهجرة فاتّخذ أبا بكرٍ رفيقاً له، وجعل عليّاً في فراشه وأوصاه بردّ الأمانات التي كانت عنده إلى أصحابها، واستأجر الرسول عبد الله بن أريقط ليدلّه على الطريق إلى المدينة، فخرج الرسول مع أبي بكرٍ قاصدَين غار ثور، وحين علمت قريش بفشل خطّتها وهجرة الرسول بدأوا بالبحث عنه، إلى أن وصل أحدهم إلى الغار فأصاب أبو بكر الخوف الشديد على الرسول، إلّا أنّ الرسول طمأنه، وبقيا في الغار ثلاثة أيامٍ إلى أن استقرّت الأحوال وتوقّف البحث عنهما، ثمّ استأنفا مسيرهما إلى المدينة ووصلا إليها في السنة الثالثة عشر من البعثة، في اليوم الثاني عشر من شهر ربيع الأول، وأقام أربعة عشر ليلة في بني عمرو بن عوف، أسّس خلالها مسجد قباء أول مسجدٍ بُني في الإسلام، وبدأ بعدها بإقامة أسس الدولة الإسلامية.[٢٠]",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                    )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              '''العهد المدني''',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Text(
              '''بناء المسجد''',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            Text(
                'أمر رسول الله ببناء المسجد على أرضٍ اشتراها من غلامين يتيمين، وبدأ الرسول مع أصحابه بالبناء، وجُعلت قبلته إلى بيت المقدس، وكانت للمسجد أهميةٌ عظيمةٌ؛ إذ كان مكان لقاء المسلمين للصلاة وغيرها من الأمور، بالإضافة إلى تعلّم العلوم الشرعية، وتعميق الصلات والعلاقات بين المسلمين.[٢١]',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                    )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              '''المؤاخاة''',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            Text(
                "آخى رسول الله بين المهاجرين والأنصار من المسلمين وفق أسس العدل والمساواة، فالدولة لا يُمكن أن تُقام إلّا بتوحّد أفرادها، وإقامة العلاقة بينهم على أساس حبّ الله ورسوله والبذل في سبيل الدعوة، وبذلك جعل رسول الله مؤاخاتهم مرتبطةً بعقيدتهم، ومنحت المؤاخاة للأفراد تحمّل مسؤولية بعضهم البعض.[٢١]",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                    )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              '''وثيقة المدينة''',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            Text(
                '''كانت المدينة المنورة بحاجةٍ إلى أمرٍ ينظمّها ويضمن حقوق أفرادها، فكتب الرسول وثيقةً كانت بمثابة دستورٍ بين المهاجرين والأنصار واليهود، وكانت لتلك الوثيقة أهميّةٌ عظيمةٌ؛ إذ كانت بمثابة الدستور الذي ينظّم أمور الدولة في الداخل والخارج، وأقام الرسول البنود بحسب أحكام الشريعة الإسلامية، كما كانت عادلةً من حيث المعاملة مع اليهود، وقد دلّت بنودها على أربعةٍ من الأحكام الخاصة بالشريعة الإسلامية، وهي:[٢١] 
- إنّ دين الإسلام هو الذي يعمل على وحدة المسلمين وتماسكهم.
- إنّ المجتمع الإسلامي لا يقوم إلّا بتكافل وتضامن جميع الأفراد، وتحمّل كلٍّ منهم المسؤولية الخاصة به.
- إنّ العدالة ظاهرةٌ بشكلٍ مفصّلٍ ودقيقٍ.
- إنّ مردّ المسلمين دائماً إلى حكم الله -تعالى- المبيّن في شريعته.''',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                    )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              '''الغزوات والسرايا''',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            Text(
                " خاض النبي -عليه الصلاة والسلام- عدداً من الغزوات والمعارك بهدف إقامة الحق ودعوة الناس إلى توحيد الله -تعالى- بإزالة العوائق التي تُحيل دون نشر الدعوة، وتجدر الإشارة إلى أنّ الغزوات التي خاضها الرسول كانت نموذجاً عملياً في بيان صورة المُحارب الفاضل واحترام الإنسانية.[٢٢] ذلك بعد أن بدأت العلاقات تشتدّ بين رسول الله في المدينة والقبائل من خارجها، ممّا أدّى إلى وقوعٍ عددٍ من المواجهات القتالية بين الأطراف المختلفة، وسمّي القتال الذي شهده الرسول بالغزوة والذي لم يشهده بالسرية، وفيما يأتي بيان بعض تفاصيل الغزوات التي خاضها الرسول -عليه الصلاة والسلام- مع من معه من المسلمين:[٢٣]",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                    )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              '''غزوة بدر الكبرى'''

,                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            Text(
"وقعت في السنة الثانية من الهجرة، في السابع عشر من شهر رمضان، وسببها اعتراض المسلمين لقافلة قريش المتّجهة إلى مكة بقيادة أبي سفيان، فهبّت قريش لحماية قافلتها وحصل القتال بين المسلمين، وبلغ عدد المشركين ألف مقاتلٍ، فيما كان عدد المسلمين ثلاثمئةٍ وثلاثة عشر رجلاً، وانتهت بانتصار المسلمين وقتل سبعين من المشركين وأسر سبعين آخرين وتم عتقهم بالمال."

                ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.black,
                )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
"غزوة أحد"

               ,                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28),
            ),
            Text(
"وقعت في السنة الثالثة من الهجرة، يوم السبت الموافق الخامس عشر من شوال، وسببها رغبة قريش في الثأر من المسلمين لما أصابها يوم بدر، حيث بلغ عدد المشركين ثلاثة آلاف مقاتل، فيما كان عدد المسلمين نحو سبعمئة رجل جُعل منهم خمسين على ظهر الجبل، وعندما ظنّ المسلمون أنّهم انتصروا بدأوا بجمع الغنائم، فانتهز خالد بن الوليد وكان حينها على الشرك الفرصة، والتفّ على المسلمين من وراء الجبل وقاتلهم، ممّا أدّى إلى انتصار المشركين على المسلمين."
                ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.black,
            )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              '''غزوة بني النّضير'''
              ,                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28),
            ),
            Text(
"بنو النضير قومٌ من أقوام اليهود نقضوا العهد مع رسول الله، فأمر الرسول بإبعادهم عن المدينة، وأخبرهم قائد المنافقين عبد الله بن أبيّ بالبقاء في أماكنهم مقابل دعمهم بالمقاتلين، وانتهت الغزوة بإجلاء القوم من المدينة ومغادرتهم لها."

                 ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.black,
            )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
"غزوة الأحزاب"

              ,                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28),
            ),
            Text(
"وقعت في السنة الخامسة من الهجرة، وكان سببها توجّه رؤساء بني النضير إلى قريش لتحريضهم على قتال رسول الله، وقد أشار سلمان الفارسي على الرسول بحفر خندق؛ لذلك تسمّى هذه الغزوة أيضاً بغزوة الخندق، وانتهت بانتصار المسلمين."

                 ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.black,
            )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
"غزوة بني قريظة"

               ,                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28),
            ),
            Text(
"هي الغزوة التالية لغزوة الأحزاب، وقد وقعت في السنة الخامسة للهجرة، وسببها نقض يهود بني قريظة العهد مع رسول الله، وتشكيلهم للأحزاب مع قريش، ورغبتهم في الغدر من المسلمين، فخرج رسول الله إليهم مع ثلاثة آلاف مقاتل من المسلمين، وحاصروهم خمسة وعشرين ليلة، فضاقت عليهم الحال، وخضعوا لأمر رسول الله."
                ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.black,
            )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
"غزوة الحديبية"

               ,                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28),
            ),
            Text(
"وقعت في السنة السادسة للهجرة من شهر ذي القعدة، ذلك بعد أن رأى رسول الله في منامه أنّه ذاهبٌ ومن معه إلى البيت الحرام وهم آمنين محلّقين رؤوسهم، فأمر المسلمين بالتّجهز لأداء العمرة، وأحرموا من ذي الحليفة، ولم يأخذوا معهم إلّا سلام المسافر؛ لتعلم قريش أنّهم لا يبتغون القتال، ووصلوا إلى الحديبية إلّا أن قريشاً منعتهم من الدخول، فأرسل إليهم الرسول عثمان بن عفان يخبرهم بحقيقة مجيئهم، وأُشيع أنّه قتل، فرأى رسول الله بأن يعدّ العدّة ويقاتلهم، فأرسلوا سهيل بن عمرو للاتفاق معهم على الصلح، وتمّ الصلح بمنع الحرب مدة عشرة سنواتٍ، وأن يردّ المسلمون من يأتيهم من قريش وألّا تردّ قريش من يأتيها من المسلمين، وتحلّل المسلمون من إحرامهم، وعادوا إلى مكّة."
                ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.black,
            )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              "غزوة خيبر"


              ,                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28),
            ),
            Text(
"وقعت في السنة السابعة للهجرة في آخر شهر محرّم، ذلك بعد أن رأى رسول الله التخلّص من تجمّعات اليهود؛ حيث إنّها تشكّل خطراً على المسلمين، وخرج الرسول بالفعل لتحقيق مقصده وانتهى الأمر لصالح المسلمين."

                ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.black,
            )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
"غزوة مؤتة"


              ,                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28),
            ),
            Text(
"وقعت في السنة الثامنة للهجرة في جمادى الأولى، وسببها غضب الرسول من مقتل الحارث بن عمير الأزدي، وقد أمّر الرسول على المسلمين زيد بن حارثة وأوصى بإمارة جعفر إن أُصيب زيد ثمّ بإمارة عبد الله بن رواحة بعد جعفر، وطلب منهم دعوة الناس للإسلام قبل البدء بالقتال، وانتهى القتال بانتصار المسلمين."

                ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.black,
            )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              "غزوة الفتح"



              ,                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28),
            ),
            Text(
"وقعت في السنة الثامنة للهجرة من شهر رمضان، وهي ذاتها فتح مكة، وتمثّل سبب الفتح في اعتداء بني بكر على بني خزاعة وقتل عددٍ منهم، وقد تجهزّ رسول الله ومن معه للسير إلى مكة، وأسلم حينها أبو سفيان، ومنح رسول الله الأمان لمن يدخل بيته؛ تقديراً لمكانته، ودخل الرسول مكّة مكبّراً شاكراً الله على الفتح المبين، وطاف بالكعبة المشرّفة وحطّم الأصنام وصلّى ركعتين عند الكعبة، وعفى عن قريش."

                 ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.black,
            )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              "غزوة حُنين"




              ,                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28),
            ),
            Text(

              "وقعت في السنة الثامنة للهجرة في اليوم العاشر من شهر شوال، وسببها يكمُن في اعتقاد أشراف قبيلتي هوازن وثقيف بقتال الرسول لهم بعد فتح مكة فقرّروا مبادرته بالقتال وتوجّهوا لذلك، وخرج إليهم رسول الله وكلّ من أسلم معه إلى أن وصلوا وادي حُنين، وكان النصر في بداية القتال لهوازن وثقيف ثمّ تحوّل للمسلمين بعد ثبات رسول الله ومن معه."

                ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.black,
            )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
"غزوة تبوك"




              ,                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28),
            ),
            Text(

"وقعت في السنة التاسعة للهجرة من شهر رجب بسبب رغبة الروم بالقضاء على الدولة الإسلامية في المدينة المنورة، وخرج المسلمون إلى القتال وأقاموا في منطقة تبوك ما يقارب عشرين ليلة، ورجعوا دون قتالٍ."

                ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.black,
            )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
"مكاتبة الملوك و الأمراء"




              ,                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28),
            ),
            Text(

'''أرسل رسول الله عدداً من أصحابه رسلاً لدعوة الملوك والأمراء إلى توحيد الله -سبحانه-، فمن الملوك من أسلم ومنهم بقي على دينه، ويُذكر من تلك الدعوات:-
- العمرو بن أميّة الضمري إلى النجاشي ملك الحبشة.
- حاطب بن أبي بلتعة إلى المقوقس ملك مصر.
- عبد الله بن حذافة السهمي إلى كسرى ملك فارس.
- دحية بن خليفة الكلبي إلى قيصر ملك الروم.
- العلاء بن الحضرمي إلى المنذر بن ساوي ملك البحرين.
- السليط بن عمرو العامري إلى هوذة بن علي صاحب اليمامة.
- شجاع بن وهب من بني أسد بن خزيمة إلى الحارث بن أبي شمر الغساني صاحب دمشق.
- عمرو بن العاص إلى ملك عُمان جيفر وأخيه.'''                ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.black,
            )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              "الوفود"
              ,                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28),
            ),
            Text('''قدم أكثر من سبعين وفداً من القبائل بعد فتح مكة إلى رسول الله يعلنون إسلامهم، يُذكر منهم:
- الوفد عبد القيس، وقد توافدوا مرتين؛ الأولى في السنة الخامسة من الهجرة، والثانية في عام الوفود.
- الوفد دوس، إذ توافدوا في مطلع السنة السابعة للهجرة حين كان رسول الله في خيبر.
 - فروة بن عمرو الجذامي في السنة الثامنة للهجرة.
- وفد صداء في السنة الثامنة للهجرة.
- كعب بن زهير بن أبي سلمى.
- وفد عذرة في شهر صفر من السنة التاسعة للهجرة.
- وفد ثقيف في شهر رمضان من السنة التاسعة للهجرة.
كما أرسل رسول الله خالد بن الوليد إلى بني الحارث بن كعب في نجران يدعوهم إلى الإسلام ثلاثة أيامٍ، ودخل عددٌ منهم الإسلام، وشرع خالد في تعليمهم أمور الدين وتعاليم الإسلام، وقد أرسل رسول الله أبو موسى ومعاذ بن جبل إلى اليمن قبل حجّة الوداع.''',style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.black,
            )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              "حجّة الوداع"





              ,                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28),
            ),
            Text(
              "أبدى رسول الله رغبته بالحجّ، وأظهر نيّته في ذلك، وترك المدينة مؤمّراً عليها أبا دجانة، وسار نحو البيت العتيق، وألقى خطبةً عُرفت فيما بعد بخطبة الوداع، ومن مضامينها: التحذير من الربا، وضرورة التمسك بما جاء في القرآن الكريم والسنة النبوية الشريفة."
                ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.black,
            )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
"البيت النبوي"
              ,style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28),
            ),
            Text(
'''كان الرسول -عليه الصلاة والسلام- مثالاً يُحتذى به في أخلاقه النبيلة والكريمة وتعاملاته السامية مع زوجاته وأبنائه وأصحابه، وبذلك استطاع -عليه الصلاة والسلام- غرس المبادئ والقيم في النفوس، وقد سنّ الله في الكون التزاوج بين الذكر والأنثى، وجعل العلاقة بينهما قائمةً على المودة والرحمة والسكينة، قال -تعالى-: (وَمِنْ آيَاتِهِ أَنْ خَلَقَ لَكُم مِّنْ أَنفُسِكُمْ أَزْوَاجًا لِّتَسْكُنُوا إِلَيْهَا وَجَعَلَ بَيْنَكُم مَّوَدَّةً وَرَحْمَةً إِنَّ فِي ذَلِكَ لَآيَاتٍ لِّقَوْمٍ يَتَفَكَّرُونَ).[٢٨] وطبّق الرسول المعاني الواردة في الآية السابقة، وأوصى أصحابه بالنساء وحثّ غيره على رعاية حقوقهنّ ومعاماتهن معاملةً حسنةً، فكان -عليه الصلاة والسلام- يواسي زوجاته ويخفّف من أحزانهنّ ويقدّر مشاعرهنّ ولا يستهزئ منهنّ ويمدحهنّ ويُثني عليهنّ، كما كان يساعدهنّ في أعمال المنزل، ويأكل معهنّ من إناءٍ واحدٍ، ويخرج معهنّ للتنزه لزيادة أواصر المحبة والمودة،[٢٩] وكان النبي قد تزوّج من إحدى عشر زوجةً، وهنّ:
- خديجة بنت خويلد: وهي أول زوجةٍ للنبي ولم يجمع معها غيرها من الزوجات، وأنجب منها كلّ أبنائه وبناته إلّا ابنه إبراهيم الذي وُلد من مارية القبطية التي كانت ملك يمينٍ عند الرسول -عليه السلام-، وكان القاسم أول مولودٍ للرسول وكُنيّ به، ثمّ رُزق بزينب فأمّ كلثوم ففاطمة وأخيراً بعبد الله الذي لُقّب بالطيب الطاهر.
- سودة بنت زمعة: وهي ثاني زوجاته، ومَن وهبت يومها لعائشة حبّاً بالنبي -عليه الصلاة والسلام-، وتمنّت عائشة أن تكون مثلها وعلى هديها، وتوفيت سودة في زمن عمر بن الخطاب
- عائشة بنت أبي بكر الصديق: كانت أحبّ أزواج النبي إلى قلبه بعد خديجة، وكان الصحابة يعدّونها مرجعاً؛ حيث كانت من أفقه الناس في علوم الشريعة، ومن أفضالها أنّ الوحي نزل على رسول الله وهو في حِجْرها. حفصة بنت عمر بن الخطاب: تزوّجها رسول الله في السنة الثالثة للهجرة، وقد احتفظت بالمصحف حين جُمع.
- حفصة بنت عمر بن الخطاب: تزوّجها رسول الله في السنة الثالثة للهجرة، وقد احتفظت بالمصحف حين جُمع.
- زينب بنت خزيمة: لقّبت بأمّ المساكين؛ لشدّة حرصها على إطعامهم وقضاء حوائجهم.
- أم سلمة هند بنت أبي أمية: تزوّجها رسول الله بعد وفاة زوجها أبي سلمة، وقد دعا لها وأخبر أنّها من أهل الجنة.
- زينب بنت جحش: تزوجها الرسول بأمرٍ من الله، وهي أوّل زوجةٍ كانت وفاتها بعد وفاة رسول الله.
- جويرية بنت الحارث: تزوّجها رسول الله بعد وقوعها أسيرةً في غزوة بني المصطلق، وكان اسمها بُرّة فسمّاها الرسول جويرية، وتوفيت في السنة الخمسين للهجرة.
- صفية بنت حيي بن أخطب: تزوّجها رسول الله بمهر عتقها بعد غزوة خيبر.
- أم حبيبة رملة بنت أبي سفيان: هي الزوجة الأقرب لرسول الله نسباً بجدّهما عبد مناف.
- ميمونة بنت الحارث: وهي آخر زوجات النبي -عليه السلام-.
'''
                 ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.black,
            )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
"صفات النبي"
              ,style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28),
            ),
            Text("صفاته الخَلقية"
                ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.black,
            )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
'''اجتمعت برسول الله -صلّى الله عليه وسلّم- مجموعةً من الصفات الخَلقية، يُذكر منها:- 
- مربوعاً؛ أي ليس بالطويل ولا بالقصير.
- الصحل في الصوت؛ أي الخشونة.
- أزهر اللون؛ أي أبيض فيه حُمرةٌ.
- وسيمٌ قسيمٌ؛ أي حسنٌ جميلٌ.
- أزج الحاجب؛ أي رقيقاً في طوله.
- أكحل العينين.'''
                ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.black,
                )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
            "صفاته الخُلقية"
                 ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.black,
                )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
                '''بعث الله -تعالى- رسوله -عليه الصلاة والسلام- ليبين للنّاس مكارم الأخلاق ويؤكّد الصالح منها ويُصلح ما فسد، وقد كان أعظم الناس أخلاقاً وأكملهم، ومن صفاته الخُلقية التي تحلّى بها:
- صدقه في أعماله وأقواله ونيّاته مع المسلمين وغيرهم، ودليل ذلك تلقيبه بالصادق الأمين، فعدم الصدق من صفات النفاق.
- سماحته وعفوه عن الناس وصفحه عنهم بقدر الاستطاعة، ومن القصص الواردة في ذلك عفوه عن رجلٍ أراد قتله وهو نائمٌ، قال -عليه الصلاة والسلام-: (إنَّ هذا اخْتَرَطَ عَلَيَّ سَيْفِي، وأَنَا نَائِمٌ، فَاسْتَيْقَظْتُ وهو في يَدِهِ صَلْتًا، فَقالَ: مَن يَمْنَعُكَ مِنِّي؟ فَقُلتُ: اللَّهُ، -ثَلَاثًا- ولَمْ يُعَاقِبْهُ وجَلَسَ).
- كرمه وجوده وعطاؤه، فعن عبد الله بن عباس -رضي الله عنهما-: (كانَ النبيُّ صَلَّى اللهُ عليه وسلَّمَ أجْوَدَ النَّاسِ بالخَيْرِ، وكانَ أجْوَدُ ما يَكونُ في رَمَضَانَ حِينَ يَلْقَاهُ جِبْرِيلُ، وكانَ جِبْرِيلُ عليه السَّلَامُ يَلْقَاهُ كُلَّ لَيْلَةٍ في رَمَضَانَ، حتَّى يَنْسَلِخَ، يَعْرِضُ عليه النبيُّ صَلَّى اللهُ عليه وسلَّمَ القُرْآنَ، فَإِذَا لَقِيَهُ جِبْرِيلُ عليه السَّلَامُ، كانَ أجْوَدَ بالخَيْرِ مِنَ الرِّيحِ المُرْسَلَةِ).
- تواضعه وعدم تعاليه وتكبّره على الناس أو الانتقاص من قيمتهم، ذلك كما أمره الله -سبحانه-، فالتواضع من الأسباب التي ملك القلوب وتأليفها، وكان يجلس بين الصحابة دون أن يميّز نفسه بأي شيءٍ، ولا يترفّع على أي أحدٍ منهم، إذ كان يخرج في الجنائز، ويزور المرضى، ويجيب الدعوة.
- حفظه للسانه وعدم نطقه بالسيء والقبيح من الأقوال، رُوي عن أنس بن مالك -رضي الله عنه-: (لَمْ يَكُنْ رَسولُ اللَّهِ صَلَّى اللهُ عليه وسلَّمَ فَاحِشًا، ولَا لَعَّانًا، ولَا سَبَّابًا، كانَ يقولُ عِنْدَ المَعْتَبَةِ: ما له تَرِبَ جَبِينُهُ).
- احترامه للكبير وعطفه على الصغير، فكان -عليه الصلاة والسلام- يقبّل الأطفال ويحنو عليهم.
- حياؤه من ارتكاب الشرور من الأعمال، وبذلك لا يقع العبد بأي عملٍ لا تُحمد عواقبه.'''
                ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.black,
            )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
"وفاة النبي"

               ,style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28),
            ),
            Text(
                '''توفّي النبي -عليه الصلاة والسلام- يوم الاثنين، الثاني عشر من شهر ربيع الأول من السنة الحادية عشر للهجرة النبوية، ذلك بعد مرضه واشتداده عليه، وطلب من زوجاته أن يمرّض ببيت أم المؤمنين عائشة، وكانت عادة رسول الله في مرضه أن يدعو الله -تعالى- ويُرقي نفسه، وكانت عائشة تفعل ذلك له أيضاً، وفي مرضه أشار بقدوم ابنته فاطمة الزهراء، وتحدّث إليها مرتين سرّاً فبكت في الأولى وضحكت في الثانية، فسألتها عائشة -رضي الله عنها- عن ذلك، فأجابتها بأنّه أخبرها في الأولى بأنّ روحه ستقبض، وأخبرها في الثانية بأنّها ستكون أول من يلحق به من أهل بيته. وفي يوم وفاته -صلّى الله عليه وسلّم- كُشف ستار حجرته والمسلمين منتظمين للصلاة وتبسّم ضاحكاً، فظنّ أبا بكر أنّه يريد الصلاة معهم، إلّا أنّ النبي أشار عليه بإتمام الصلاة ثمّ أرخى الستار، واختلفت الروايات في تحديد عمره حين وفاته، فقيل: ثلاثة وستون سنةً وهو الأشهر، وقيل خمسة وستون، أو ستون، ودفن مكان وفاته في حفرةٍ حُفرت تحت فراشه الذي تُوفّي فيه في المدينة المنورة.'''
                 ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.black,
            )),




          ],
        ),
      ),
    ),
      ),
    );
  }
}
