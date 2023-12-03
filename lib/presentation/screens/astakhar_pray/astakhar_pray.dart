import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/componants/componants.dart';
import 'package:islami_app/styles/color_manager.dart';

import '../../../data/models/ads_model/ads_model.dart';

class AstakharPray extends StatelessWidget {
  const AstakharPray({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.darkGrey,
      appBar: defaultAppBar(
          context: context,
          title: 'صلاه الاستخاره'
      ),
      body: SingleChildScrollView(
        child: Container(
          color: ColorManager.darkGrey,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height*.02,
            vertical: MediaQuery.of(context).size.height*.02,
          ),
          child: Wrap(
            children: [

              Text('حكم صلاة الاستخارة',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: ColorManager.lightColor,
                  fontSize: MediaQuery.of(context).size.height * .038,
                  fontWeight: FontWeight.w900
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*.06,),

              Text('أَجْمَعَ الْعُلَمَاءُ عَلَى أَنَّ الاسْتِخَارَةَ سُنَّةٌ، وَدَلِيلُ مَشْرُوعِيَّتِهَا مَا رَوَاهُ الْبُخَارِيُّ عَنْ جَابِرٍ رضي الله عنه «اللَّهُمَّ إنِّي أَسْتَخِيرُكَ بِعِلْمِكَ، وَأَسْتَقْدِرُكَ بِقُدْرَتِكَ، وَأَسْأَلُكَ مِنْ فَضْلِكَ الْعَظِيمِ».',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: ColorManager.lightColor,
                  fontSize: MediaQuery.of(context).size.height * .025
                ),

              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * .2,),

              Center(
                child: AdmobBanner(
                    adUnitId: AdsModel.getBannerAd(),
                    adSize: AdmobBannerSize.FULL_BANNER),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.17,),

              Text('متى يحتاج الإنسان إلى صلاة الاستخارة؟',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: ColorManager.lightColor,
                  fontSize: MediaQuery.of(context).size.height * .038,
                  fontWeight: FontWeight.w900
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*.06,),

              Text(
                'إذا تعرض أحدنا لأمور يتحير منها وتتشكل عليه، يحتاج للجوء إلى خالق رب السموات والأرض وخالق الناس، يسأله رافعاً يديه داعياً مستخيراً بالدعاء، راجياً الصواب في الطلب، فإنه أدعى للطمأنينة وراحة البال، فعندما يقدم على عمل ما كشراء سيارة، أو يريد الزواج أو يعمل في وظيفة معينة أو يريد سفراً فإنه يستخير له.يقول شيخ الإسلام ابن تيمية: ما ندم من استخار الخالق، وشاوو المخلوقين، وثبت في أمره، وقد قال سبحانه وتعالى: «فَبِمَا رَحْمَةٍ مِّنَ اللّهِ لِنتَ لَهُمْ وَلَوْ كُنتَ فَظًّا غَلِيظَ الْقَلْبِ لاَنفَضُّواْ مِنْ حَوْلِكَ فَاعْفُ عَنْهُمْ وَاسْتَغْفِرْ لَهُمْ وَشَاوِرْهُمْ فِي الأَمْرِ فَإِذَا عَزَمْتَ فَتَوَكَّلْ عَلَى اللّهِ إِنَّ اللّهَ يُحِبُّ الْمُتَوَكِّلِينَ» سورة آل عمرا ن: 159، وقال قتادة: ما تشاور قوم يبتغون وجه الله إلا هدوا إلى أرشد أمرهم'
                ,style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: ColorManager.lightColor,
                  fontSize: MediaQuery.of(context).size.height * .025,
              ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.5,),
              Text('دعاء صلاة الاستخارة',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: ColorManager.lightColor,
                    fontSize: MediaQuery.of(context).size.height * .038,
                    fontWeight: FontWeight.w900

                     ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*.06,),

              Text(
                'عَنْ جَابِرٍ رضي الله عنه قَالَ: كَانَ رَسُولُ اللَّهِ صلى الله عليه وسلم يُعَلِّمُنَا الاسْتِخَارَةَ فِي الأُمُورِ كُلِّهَا كَمَا يُعَلِّمُنَا السُّورَةَ مِنْ الْقُرْآنِ يَقُولُ: إذَا هَمَّ أَحَدُكُمْ بِالأَمْرِ فَلْيَرْكَعْ رَكْعَتَيْنِ مِنْ غَيْرِ الْفَرِيضَةِ ثُمَّ لِيَقُلْ:«اللَّهُمَّ إنِّي أَسْتَخِيرُكَ بِعِلْمِكَ، وَأَسْتَقْدِرُكَ بِقُدْرَتِكَ، وَأَسْأَلُكَ مِنْ فَضْلِكَ الْعَظِيمِ فَإِنَّكَ تَقْدِرُ وَلا أَقْدِرُ، وَتَعْلَمُ وَلا أَعْلَمُ، وَأَنْتَ عَلامُ الْغُيُوبِ..اللَّهُمَّ إنْ كُنْتَ تَعْلَمُ أَنَّ هَذَا الأَمْرَ (هنا تسمي حاجتك) خَيْرٌ لِي فِي دِينِي وَمَعَاشِي وَعَاقِبَةِ أَمْرِي فَاقْدُرْهُ لِي وَيَسِّرْهُ لِي ثُمَّ بَارِكْ لِي فِيهِ..اللَّهُمَّ وَإِنْ كُنْتَ تَعْلَمُ أَنَّ هَذَا الأَمْرَ (هنا تسمي حاجتك) شَرٌّ لِي فِي دِينِي وَمَعَاشِي وَعَاقِبَةِ أَمْرِي فَاصْرِفْهُ عَنِّي وَاصْرِفْنِي عَنْهُ وَاقْدُرْ لِي الْخَيْرَ حَيْثُ كَانَ ثُمَّ ارْضِنِي بِهِ. (وَيُسَمِّي حَاجَتَهُ) وَفِي رواية « ثُمَّ رَضِّنِي بِهِ» رَوَاهُ الْبُخَارِيُّ 1166.'
                ,style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: ColorManager.lightColor,
                  fontSize: MediaQuery.of(context).size.height * .025,
               ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * .5,),


              Text('كيفية صلاة الاستخارة',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: ColorManager.lightColor,
                    fontSize: MediaQuery.of(context).size.height * .038,
                    fontWeight: FontWeight.w900
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*.06,),

              Text(
                '''1 - تتوضأ وضوءك للصلاة. 
2- النية.. لابد من النية لصلاة الاستخارة قبل الشروع فيها.
3- تصلي ركعتين.. والسنة أن تقرأ بالركعة الأولى بعد الفاتحة بسورة «قُلْ يَا أَيُّهَا الْكَافِرُونَ»، وفي الركعة الثانية بعد الفاتحة بسورة «قُلْ هُوَ اللَّهُ أَحَدٌ». 
4- في آخر الصلاة تسلم.
5- بعد السلام من الصلاة ترفع يديك متضرعا ً إلى الله ومستحضرا ً عظمته وقدرته ومتدبرا ً بالدعاء.
6- في أول الدعاء تحمد وتثني على الله عز وجل بالدعاء.. ثم تصلي على النبي صلى الله عليه وسلم، والأفضل الصلاة الإبراهيمية التي تقال بالتشهد.
«اللّهُمَّ صَلّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحمَّدٍ كمَا صَلَّيْتَ عَلَى إبراهيم وَعَلَى آلِ إبْرَاهيمَ وَبَارِكْ عَلَى مُحمَّدٍ وعَلَى آلِ مُحمَّدٍ كمَا بَارَكْتَ عَلَى إبْرَاهيمَ وَعَلَى آلِ إبْرَاهيمَ في العالمينَ إنَّكَ حَمِيدٌ مَجِيدٌ » أو بأي صيغة تحفظ.
7- تم تقرأ دعاء الاستخارة: اللَّهُمَّ إِنِّي أَسْتَخِيرُكَ بِعِلْمِكَ وَأَسْتَقْدِرُكَ بِقُدْرَتِكَ.. إلى آخر الدعاء.
8- وإذا وصلت عند قول: اللَّهُمَّ إِنْ كُنْتَ تَعْلَمُ أَنَّ هَذَا الأَمْرَ.. هنا تسمي الشيء المراد له
مثال: اللَّهُمَّ إِنْ كُنْتَ تَعْلَمُ أَنَّ «سفري إلى بلد كذا أو شراء سيارة كذا أو الزواج من بنت فلان ابن فلان أو غيرها من الأمور، ثم تكمل الدعاء وتقول: خَيْرٌ لِي فِي دِينِي وَمَعَاشِي وَعَاقِبَةِ أَمْرِي أَوْ قَالَ عَاجِلِ أَمْرِي وَآجِلِهِ فَاقْدُرْهُ لِي وَيَسِّرْهُ لِي ثُمَّ بَارِكْ لِي فِيهِ.
تقولها مرتين.. مرة بالخير ومرة بالشر كما بالشق الثاني من الدعاء: وَإِنْ كُنْتَ تَعْلَمُ أَنَّ «سفري إلى بلد كذا أو شراء سيارة كذا أو الزواج من بنت فلان ابن فلان أو غيرها من الأمور»، ثم تكمل الدعاء وتقول: شَرٌّ لِي فِي دِينِي وَمَعَاشِي وَعَاقِبَةِ أَمْرِي.. إلى آخر الدعاء.
9- ثم تصلي على النبي صلى الله عليه وسلم.. كما فعلت بالمرة الأولى الصلاة الإبراهيمية التي تقال بالتشهد. 
 10- والآن انتهت صلاة الاستخارة.. تاركًا أمرك إلى الله متوكلًا عليه.. واسعى في طلبك ودعك من الأحلام أو الضيق الذي يصابك.. ولا تلتفت إلى هذه الأمور بشيء.. واسعى في أمرك إلى آخر ماتصل إليه.
                '''
                ,style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: ColorManager.lightColor,
                  fontSize: MediaQuery.of(context).size.height * .025,
              ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * .5,),


              Text('الأوقات المستحبة لصلاة الاستخارة',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: ColorManager.lightColor,
                    fontSize: MediaQuery.of(context).size.height * .038,
                    fontWeight: FontWeight.w900
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*.06,),

              Text(
                '''
سؤال يسأله الكثيرون منا عندما يكون هناك أمر ما يشغلنا أو تنتابنا الحيرة في الاختيار بين أمرين أيهما أفضل؛ سواء كان زواجًا أو عملاً أو شيئًا في حياتنا الدنيوية، ولكن متى نؤدي تلك الصلاة حتى يستجيب لنا رب العزة سبحانه وتعالى، ويهدينا ويرشدنا إلى الصواب، ويتحقق ما نرجوه بعد أدائها؟!
يؤكد الدكتور محمود شلبي، أمين الفتوى بدار الإفتاء المصرية، أن أنسب وقت لصلاة الاستخارة هو الثلث الأخير من الليل؛ أي قبل صلاة الفجر؛ لأن في هذا الوقت ينزل رب العزة سبحانه وتعالى للسماء الدنيا، ويقول سبحانه: هل من داع فأستجيب له؟ هل من مستغفر فأغفر له؟ هل من كذا.. هل من كذا.. حتى يطلع الفجر.
                '''
                ,style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: ColorManager.lightColor,
                  fontSize: MediaQuery.of(context).size.height * .025,
              ),),



              SizedBox(height: MediaQuery.sizeOf(context).height * .4,),


              Text('فائدة صلاة الاستخارة',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: ColorManager.lightColor,
                    fontSize: MediaQuery.of(context).size.height * .038,
                    fontWeight: FontWeight.w900
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.06,),
              Text(
                '''
 قال عبد الله بن عمر: «إن الرجل ليستخير الله فيختار له، فيسخط على ربه، فلا يلبث أن ينظر في العاقبة فإذا هو قد خار له».

وفي المسند من حديث سعد بن أبي وقاص عن النبي صلى الله عليه وسلم قال «من سعادة ابن آدم استخارته الله تعالى، ومن سعادة ابن آدم رضاه بما قضاه الله، ومن شقوة ابن آدم تركه استخارة الله عز وجل، ومن شقوة ابن آدم سخطه بما قضى الله».

قال ابن القيم فالمقدور يكتنفه أمران: الاستخارة قبله، والرضا بعده.

وقال عمر بن الخطاب: لا أبالي أصبحت على ما أحب أو على ما أكره، لأني لا أدري الخير فيما أحب أو فيما أكره.

فيا أيها العبد المسلم لا تكره النقمات الواقعة والبلايا الحادثة، فلرُب أمر تكرهه فيه نجاتك، ولرب أمر تؤثره فيه عطبك.

قال سبحانه وتعالى: «وَعَسَى أَن تَكْرَهُواْ شَيْئًا وَهُوَ خَيْرٌ لَّكُمْ وَعَسَى أَن تُحِبُّواْ شَيْئًا وَهُوَ شَرٌّ لَّكُمْ وَاللّهُ يَعْلَمُ وَأَنتُمْ لاَ تَعْلَمُونَ»، سورة البقرة: 216.

وقال شيخ الإسلام ابن تيمية: «ما ندم من استخار الخالق، وشاور المخلوقين، وثبت في أمره».

                '''
                ,style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: ColorManager.lightColor,
                  fontSize: MediaQuery.of(context).size.height * .025,
              ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * .2,),
              Center(
                child: AdmobBanner(
                    adUnitId: AdsModel.getBannerAd(),
                    adSize: AdmobBannerSize.FULL_BANNER),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * .1,),
            ],
          ),
        ),
      ),
    );
  }
}
