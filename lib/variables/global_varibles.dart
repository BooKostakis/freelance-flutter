

import 'package:flutter/material.dart';
import 'package:ididid/utils/create_user_data.dart';

bool isDebug = true;

var w = 300.0;
var h = 600.0;

bool canDoAction0 = true;
bool isPremium = false;
bool isDark = false;

const termsOfUse =
    'https://docs.google.com/document/d/1j-b6BOoZav2deY-6-4V8B2-IohCzN_36GLlAhlND0NI/edit?usp=sharing';
const privacyPolicy =
    'https://docs.google.com/document/d/1IWxUAkrdfAif--AnBQxfEn50m85SEa4B8gqssPJn4ZM/edit?usp=sharing';



Settings settings = Settings(
    onboardingShown: false,   
    hintsAmount: 3,
   
        );

  List<RitualModel> allRitualModels = <RitualModel>[
    // RitualModel(title: 'title', description: 'description', icon: '🔮', pressedTimes: [DateTime.now()]),
  ];






int bottomBarIndex = 0;


final TextEditingController mentalStateController = TextEditingController();
final FocusNode mentalStateFocusNode = FocusNode();

final TextEditingController physicalController = TextEditingController();
final FocusNode physicalFocusNode = FocusNode();

final TextEditingController trigerSituationController = TextEditingController();
final FocusNode trigerSituationFocusNode = FocusNode();

final TextEditingController waysOfSolvingController = TextEditingController();
final FocusNode waysOfSolvingFocusNode = FocusNode();





const List<String>  standartIcons = ['🪑','✂️','✏️','🔮','🪙','🚬','🧼','🩻','🎈','🪞','🗒️','📚',];





int onboardingPageIndex = 0;



bool isAddingRitual = false;
bool isEditingRitual = false;
// int currentIndexToEdit = -1;
String iconForNewRitual = '';
// String costomIconForNewRitual = '';

int ritualIndexToEdit = -1;


//tracking

String dayMonthShow = 'Days';
int yearToShow = DateTime.now().year;

// PageController pageController = PageController(initialPage: (DateTime.now().difference(DateTime(DateTime.now().year,1,1))).inDays, viewportFraction: 0.85,);