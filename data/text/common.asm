_FruitBearingTreeText::
	text "It's a fruit-"
	line "bearing tree."
	done

_HeyItsFruitText::
	text "Hey! It's"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ObtainedFruitText::
	text "Obtained"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_FruitPackIsFullText::
	text "But the PACK is"
	line "full…"
	done

_NothingHereText::
	text "There's nothing"
	line "here…"
	done

_WhichApricornText::
	text "Which APRICORN"
	line "should I use?"
	done

_HowManyShouldIMakeText::
	text "How many should I"
	line "make?"
	done

_RecoveredSomeHPText::
	text_ram wStringBuffer1
	text_start
	line "recovered @"
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text "HP!"
	done

_CuredOfPoisonText::
	text_ram wStringBuffer1
	text "'s"
	line "cured of poison."
	done

_RidOfParalysisText::
	text_ram wStringBuffer1
	text "'s"
	line "rid of paralysis."
	done

_BurnWasHealedText::
	text_ram wStringBuffer1
	text "'s"
	line "burn was healed."
	done

_WasDefrostedText::
	text_ram wStringBuffer1
	text_start
	line "was defrosted."
	done

_WokeUpText::
	text_ram wStringBuffer1
	text_start
	line "woke up."
	done

_HealthReturnedText::
	text_ram wStringBuffer1
	text "'s"
	line "health returned."
	done

_RevitalizedText::
	text_ram wStringBuffer1
	text_start
	line "is revitalized."
	done

_GrewToLevelText::
	text_ram wStringBuffer1
	text " grew to"
	line "level @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79 ; plays SFX_DEX_FANFARE_50_79, identical to SFX_LEVEL_UP
	text_promptbutton
	text_end

	text_end ; unreferenced

_CameToItsSensesText::
	text_ram wStringBuffer1
	text " came"
	line "to its senses."
	done

_EnterNewPasscodeText::
	text "Please enter any"
	line "four-digit number."
	done

_ConfirmPasscodeText::
	text "Enter the same"
	line "number to confirm."
	done

_PasscodesNotSameText::
	text "That's not the"
	line "same number."
	done

_PasscodeSetText::
	text "Your PASSCODE has"
	line "been set."

	para "Enter this number"
	line "next time to open"
	cont "the CARD FOLDER."

	para ""
	done

_FourZerosInvalidText::
	text "0000 is invalid!"

	para ""
	done

_EnterPasscodeText::
	text "Enter the CARD"
	next "FOLDER PASSCODE."
	done

_IncorrectPasscodeText::
	text "Incorrect"
	line "PASSCODE!"

	para ""
	done

_CardFolderOpenText::
	text "CARD FOLDER open.@"
	text_end

_OakTimeWokeUpText::
	text "<……><……><……><……><……><……>"
	line "<……><……><……><……><……><……>"

	para "Zzz… Hm? Wha…?"
	line "You woke me up!"

	para "Will you check the"
	line "clock for me?"
	prompt

_OakTimeWhatTimeIsItText::
	text "What time is it?"
	done

_OakTimeWhatHoursText::
	text "What?@"
	text_end

_OakTimeHoursQuestionMarkText::
	text "?"
	done

_OakTimeHowManyMinutesText::
	text "How many minutes?"
	done

_OakTimeWhoaMinutesText::
	text "Whoa!@"
	text_end

_OakTimeMinutesQuestionMarkText::
	text "?"
	done

_OakTimeOversleptText::
	text "!"
	line "I overslept!"
	done

_OakTimeYikesText::
	text "!"
	line "Yikes! I over-"
	cont "slept!"
	done

_OakTimeSoDarkText::
	text "!"
	line "No wonder it's so"
	cont "dark!"
	done

_OakTimeNappedText::
	text "!"
	line "I napped for"
	cont "too long!"
	done

_OakTimeWhatDayIsItText::
	text "What day is it?"
	done

_OakTimeIsItText::
	text ", is it?"
	done

; Mobile Adapter

_ThereIsNothingConnectedText:: ; unreferenced
	text "There is nothing"
	line "connected."
	done

_CheckCellPhoneAdapterText:: ; unreferenced
	text "Check cell phone"
	line "adapter."
	done

_CheckCDMAAdapterText:: ; unreferenced
	text "Check CDMA"
	line "adapter."
	done

_CheckDOCOMOPHSAdapterText:: ; unreferenced
	text "Check DOCOMO PHS"
	line "adapter."
	done

_CheckDDIPHSAdapterText:: ; unreferenced
	text "Check DDI PHS"
	line "adapter."
	done

_CheckMobileAdapterText:: ; unreferenced
	text "Check unlimited"
	line "battle mobile"
	cont "adapter."
	done

; Mobile Adapter End

_ThePasswordIsText:: ; unreferenced
	text "The password is:"
	line ""
	done

_IsThisOKText:: ; unreferenced
	text "Is this OK?"
	done

_EnterTheIDNoText:: ; unreferenced
	text "Enter the"
	line "ID no."
	done

_EnterTheAmountText:: ; unreferenced
	text "Enter the"
	line "amount."
	done

_NothingToChooseText::
	text "There's nothing to"
	line "choose."
	prompt

_WhichSidePutOnText::
	text "Which side do you"
	line "want to put it on?"
	done

_WhichSidePutAwayText::
	text "Which side do you"
	line "want to put away?"
	done

_PutAwayTheDecoText::
	text "Put away the"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

_NothingToPutAwayText::
	text "There's nothing to"
	line "put away."
	prompt

_SetUpTheDecoText::
	text "Set up the"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

_PutAwayAndSetUpText::
	text "Put away the"
	line "@"
	text_ram wStringBuffer3
	text_start

	para "and set up the"
	line "@"
	text_ram wStringBuffer4
	text "."
	prompt

_AlreadySetUpText::
	text "That's already set"
	line "up."
	prompt

_LookTownMapText::
	text "It's the TOWN MAP."
	done

_LookPikachuPosterText::
	text "It's a poster of a"
	line "cute PIKACHU."
	done

_LookClefairyPosterText::
	text "It's a poster of a"
	line "cute CLEFAIRY."
	done

_LookJigglypuffPosterText::
	text "It's a poster of a"
	line "cute JIGGLYPUFF."
	done

_LookAdorableDecoText::
	text "It's an adorable"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

_LookGiantDecoText::
	text "A giant doll! It's"
	line "fluffy and cuddly."
	done

_MomHiHowAreYouText::
	text "Hi, <PLAYER>!"
	line "How are you?"
	prompt

_MomFoundAnItemText::
	text "I found a useful"
	line "item shopping, so"
	prompt

_MomBoughtWithYourMoneyText::
	text "I bought it with"
	line "your money. Sorry!"
	prompt

_MomItsInPCText::
	text "It's in your PC."
	line "You'll like it!"
	done

_MomFoundADollText::
	text "While shopping"
	line "today, I saw this"
	cont "adorable doll, so"
	prompt

_MomItsInYourRoomText::
	text "It's in your room."
	line "You'll love it!"
	done

_MonWasSentToText::
	text_ram wPlayerTrademonSpeciesName
	text " was"
	line "sent to @"
	text_ram wOTTrademonSenderName
	text "."
	done

_MonNameSentToText::
	text_start
	done

_BidsFarewellToMonText::
	text_ram wOTTrademonSenderName
	text " bids"
	line "farewell to"
	done

_MonNameBidsFarewellText::
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TakeGoodCareOfMonText::
	text "Take good care of"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_ForYourMonSendsText::
	text "For @"
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text ","
	done

_OTSendsText::
	text_ram wOTTrademonSenderName
	text " sends"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_WillTradeText::
	text_ram wOTTrademonSenderName
	text " will"
	line "trade @"
	text_ram wOTTrademonSpeciesName
	text_end

	text_end ; unreferenced

_ForYourMonWillTradeText::
	text "for @"
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text "."
	done

_MobilePlayerWillTradeMonText::
	text_ram wPlayerTrademonSenderName
	text " will"
	line "trade @"
	text_ram wPlayerTrademonSpeciesName
	text_end

	text_end ; unreferenced

_MobileForPartnersMonText::
	text "for @"
	text_ram wOTTrademonSenderName
	text "'s"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_MobilePlayersMonTradeText::
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text " trade…"
	done

_MobileTakeGoodCareOfMonText::
	text "Take good care of"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_MobilePlayersMonTrade2Text::
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text " trade…"
	done

_MobileTakeGoodCareOfText::
	text "Take good care of"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_MobileTradeCameBackText::
	text_ram wOTTrademonSpeciesName
	text " came"
	line "back!"
	done

; Oak's Pokémon Talk

_OPT_IntroText1::
	text_start
	line "MARY: PROF.OAK'S"
	done

_OPT_IntroText2::
	text_start
	line "#MON TALK!"
	done

_OPT_IntroText3::
	text_start
	line "With me, MARY!"
	done

_OPT_SwarmText1::
	text_start
	line "Breaking news!"
	done

_OPT_SwarmText2::
	text_start
	line "A group of"
	done

_OPT_SwarmText3::
	text_start
	line "@"
	text_from_ram wMonOrItemNameBuffer
	text " has"
	db "@@"

_OPT_SwarmText4::
	text_start
	line "been spotted at"
	done

_OPT_SwarmText5::
	text_start
	line "@"
	text_from_ram wStringBuffer1
	text "!"
	done

_OPT_SwarmText6::
	text_start
	line "If any trainers"
	done

_OPT_SwarmText7::
	text_start
	line "want to catch"
	done

_OPT_SwarmText8::
	text_start
	line "a @"
	text_from_ram wMonOrItemNameBuffer
	text ","
	db "@@"

_OPT_SwarmText9::
	text_start
	line "then head over to"
	done

_OPT_SwarmText10::
	text_start
	line "Now, let's start"
	done

_OPT_SwarmText11::
	text_start
	line "the show!"
	done

_OPT_OakText1::
	text_start
	line "OAK: @"
	text_ram wMonOrItemNameBuffer
	text_end

	text_end ; unreferenced

_OPT_OakText2::
	text_start
	line "may be seen around"
	done

_OPT_OakText3::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_OPT_MaryText1::
	text_start
	line "MARY: @"
	text_ram wStringBuffer1
	text "'s"
	done

_OPT_SweetAdorablyText::
	text_start
	line "sweet and adorably"
	done

_OPT_WigglySlicklyText::
	text_start
	line "wiggly and slickly"
	done

_OPT_AptlyNamedText::
	text_start
	line "aptly named and"
	done

_OPT_UndeniablyKindOfText::
	text_start
	line "undeniably kind of"
	done

_OPT_UnbearablyText::
	text_start
	line "so, so unbearably"
	done

_OPT_WowImpressivelyText::
	text_start
	line "wow, impressively"
	done

_OPT_AlmostPoisonouslyText::
	text_start
	line "almost poisonously"
	done

_OPT_SensuallyText::
	text_start
	line "ooh, so sensually"
	done

_OPT_MischievouslyText::
	text_start
	line "so mischievously"
	done

_OPT_TopicallyText::
	text_start
	line "so very topically"
	done

_OPT_AddictivelyText::
	text_start
	line "sure addictively"
	done

_OPT_LooksInWaterText::
	text_start
	line "looks in water is"
	done

_OPT_EvolutionMustBeText::
	text_start
	line "evolution must be"
	done

_OPT_ProvocativelyText::
	text_start
	line "provocatively"
	done

_OPT_FlippedOutText::
	text_start
	line "so flipped out and"
	done

_OPT_HeartMeltinglyText::
	text_start
	line "heart-meltingly"
	done

_OPT_CuteText::
	text_start
	line "cute."
	done

_OPT_WeirdText::
	text_start
	line "weird."
	done

_OPT_PleasantText::
	text_start
	line "pleasant."
	done

_OPT_BoldSortOfText::
	text_start
	line "bold, sort of."
	done

_OPT_FrighteningText::
	text_start
	line "frightening."
	done

_OPT_SuaveDebonairText::
	text_start
	line "suave & debonair!"
	done

_OPT_PowerfulText::
	text_start
	line "powerful."
	done

_OPT_ExcitingText::
	text_start
	line "exciting."
	done

_OPT_GroovyText::
	text_start
	line "groovy!"
	done

_OPT_InspiringText::
	text_start
	line "inspiring."
	done

_OPT_FriendlyText::
	text_start
	line "friendly."
	done

_OPT_HotHotHotText::
	text_start
	line "hot, hot, hot!"
	done

_OPT_StimulatingText::
	text_start
	line "stimulating."
	done

_OPT_GuardedText::
	text_start
	line "guarded."
	done

_OPT_LovelyText::
	text_start
	line "lovely."
	done

_OPT_SpeedyText::
	text_start
	line "speedy."
	done

_OPT_PokemonChannelText::
	text "#MON"
	done

_PokedexShowText::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

; Pokémon Music Channel / Pokémusic

_BenIntroText1::
	text_start
	line "BEN: #MON MUSIC"
	done

_BenIntroText2::
	text_start
	line "CHANNEL!"
	done

_BenIntroText3::
	text_start
	line "It's me, DJ BEN!"
	done

_FernIntroText1::
	text_start
	line "FERN: #MUSIC!"
	done

_FernIntroText2::
	text_start
	line "With DJ FERN!"
	done

_BenFernText1::
	text_start
	line "Today's @"
	text_today
	text ","
	done

_BenFernText2A::
	text_start
	line "so let us jam to"
	done

_BenFernText2B::
	text_start
	line "so chill out to"
	done

_BenFernText3A::
	text_start
	line "#MON March!"
	done

_BenFernText3B::
	text_start
	line "#MON Lullaby!"
	done

; Lucky Channel

_LC_Text1::
	text_start
	line "REED: Yeehaw! How"
	done

_LC_Text2::
	text_start
	line "y'all doin' now?"
	done

_LC_Text3::
	text_start
	line "Whether you're up"
	done

_LC_Text4::
	text_start
	line "or way down low,"
	done

_LC_Text5::
	text_start
	line "don't you miss the"
	done

_LC_Text6::
	text_start
	line "LUCKY NUMBER SHOW!"
	done

_LC_Text7::
	text_start
	line "Today's Lucky"
	done

_LC_Text8::
	text_start
	line "Number is @"
	text_pause
	text_ram wStringBuffer1
	text "!"
	done

_LC_Text9::
	text_start
	line "I'll repeat that!"
	done

_LC_Text10::
	text_start
	line "Match it and go to"
	done

_LC_Text11::
	text_start
	line "the RADIO TOWER!"
	done

_LC_DragText1::
	text_start
	line "…Repeating myself"
	done

_LC_DragText2::
	text_start
	line "gets to be a drag…"
	done

; Places and People

_PnP_Text1::
	text_start
	line "PLACES AND PEOPLE!"
	done

_PnP_Text2::
	text_start
	line "Brought to you by"
	done

_PnP_Text3::
	text_start
	line "me, DJ LILY!"
	done

_PnP_Text4::
	text_start
	line "@"
	text_ram wStringBuffer2
	text " @"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

_PnP_CuteText::
	text_start
	line "is cute."
	done

_PnP_LazyText::
	text_start
	line "is sort of lazy."
	done

_PnP_HappyText::
	text_start
	line "is always happy."
	done

_PnP_NoisyText::
	text_start
	line "is quite noisy."
	done

_PnP_PrecociousText::
	text_start
	line "is precocious."
	done

_PnP_BoldText::
	text_start
	line "is somewhat bold."
	done

_PnP_PickyText::
	text_start
	line "is too picky!"
	done

_PnP_SortOfOKText::
	text_start
	line "is sort of OK."
	done

_PnP_SoSoText::
	text_start
	line "is just so-so."
	done

_PnP_GreatText::
	text_start
	line "is actually great."
	done

_PnP_MyTypeText::
	text_start
	line "is just my type."
	done

_PnP_CoolText::
	text_start
	line "is so cool, no?"
	done

_PnP_InspiringText::
	text_start
	line "is inspiring!"
	done

_PnP_WeirdText::
	text_start
	line "is kind of weird."
	done

_PnP_RightForMeText::
	text_start
	line "is right for me?"
	done

_PnP_OddText::
	text_start
	line "is definitely odd!"
	done

_PnP_Text5::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

_RocketRadioText1::
	text_start
	line "… …Ahem, we are"
	done

_RocketRadioText2::
	text_start
	line "TEAM ROCKET!"
	done

_RocketRadioText3::
	text_start
	line "After three years"
	done

_RocketRadioText4::
	text_start
	line "of preparation, we"
	done

_RocketRadioText5::
	text_start
	line "have risen again"
	done

_RocketRadioText6::
	text_start
	line "from the ashes!"
	done

_RocketRadioText7::
	text_start
	line "GIOVANNI! @"
	text_pause
	text "Can you"
	done

_RocketRadioText8::
	text_start
	line "hear?@"
	text_pause
	text " We did it!"
	done

_RocketRadioText9::
	text_start
	line "@"
	text_pause
	text "Where is our boss?"
	done

_RocketRadioText10::
	text_start
	line "@"
	text_pause
	text "Is he listening?"
	done

_BuenaRadioText1::
	text_start
	line "BUENA: BUENA here!"
	done

_BuenaRadioText2::
	text_start
	line "Today's password!"
	done

_BuenaRadioText3::
	text_start
	line "Let me think… It's"
	done

_BuenaRadioText4::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_BuenaRadioText5::
	text_start
	line "Don't forget it!"
	done

_BuenaRadioText6::
	text_start
	line "I'm in GOLDENROD's"
	done

_BuenaRadioText7::
	text_start
	line "RADIO TOWER!"
	done

_BuenaRadioMidnightText1::
	text_start
	line "BUENA: Oh my…"
	done

_BuenaRadioMidnightText2::
	text_start
	line "It's midnight! I"
	done

_BuenaRadioMidnightText3::
	text_start
	line "have to shut down!"
	done

_BuenaRadioMidnightText4::
	text_start
	line "Thanks for tuning"
	done

_BuenaRadioMidnightText5::
	text_start
	line "in to the end! But"
	done

_BuenaRadioMidnightText6::
	text_start
	line "don't stay up too"
	done

_BuenaRadioMidnightText7::
	text_start
	line "late! Presented to"
	done

_BuenaRadioMidnightText8::
	text_start
	line "you by DJ BUENA!"
	done

_BuenaRadioMidnightText9::
	text "I'm outta here!"
	done

_BuenaRadioMidnightText10::
	text "…"
	done

_BuenaOffTheAirText::
	text_start
	line ""
	done

_EnemyWithdrewText::
	text "<ENEMY>"
	line "withdrew"
	cont "@"
	text_ram wEnemyMonNickname
	text "!"
	prompt

_EnemyUsedOnText::
	text "<ENEMY>"
	line "used @"
	text_ram wMonOrItemNameBuffer
	text_start
	cont "on @"
	text_ram wEnemyMonNickname
	text "!"
	prompt

_ThatCantBeUsedRightNowText:: ; unreferenced
	text "That can't be used"
	line "right now."
	prompt

_ThatItemCantBePutInThePackText:: ; unreferenced
	text "That item can't be"
	line "put in the PACK."
	done

_TheItemWasPutInThePackText:: ; unreferenced
	text "The @"
	text_ram wStringBuffer1
	text_start
	line "was put in the"
	cont "PACK."
	done

_RemainingTimeText:: ; unreferenced
	text "Remaining Time"
	done

_YourMonsHPWasHealedText:: ; unreferenced
	text "Your #MON's HP"
	line "was healed."
	prompt

_WarpingText:: ; unreferenced
	text "Warping…"
	done

_ChangeWhichNumberText:: ; unreferenced
	text "Which number"
	line "should be changed?"
	done

_WillYouPlayWithMonText:: ; unreferenced
	text "Will you play with"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_YouNeedTwoMonForBreedingText:: ; unreferenced
	text "You need two #-"
	line "MON for breeding."
	prompt

_BreedingIsNotPossibleText:: ; unreferenced
	text "Breeding is not"
	line "possible."
	prompt

_CompatibilityShouldTheyBreedText:: ; unreferenced
	text "The compatibility"
	line "is @"
	text_decimal wBreedingCompatibility, 1, 3
	text "."
	cont "Should they breed?"
	done

_ThereIsNoEggText:: ; unreferenced
	text "There is no EGG."
	line ""
	prompt

_ItsGoingToHatchText:: ; unreferenced
	text "It's going to"
	line "hatch!"
	prompt

_TestEventText:: ; unreferenced
	text "Test event"
	line "@"
	text_decimal wStringBuffer2, 1, 2
	text "?"
	done

_StartText:: ; unreferenced
	text "Start!"
	done

_EndText:: ; unreferenced
	text "End!"
	done

_ForABoyText:: ; unreferenced
	text "For a boy!"
	done

_ForAGirlText:: ; unreferenced
	text "For a girl!"
	done

_DoesntConcernABoyText:: ; unreferenced
	text "This doesn't"
	line "concern a boy!"
	done

_TheBoxIsFullText:: ; unreferenced
	text "The BOX is full!"
	done

; Mobile Adapter

_NewCardArrivedText::
	text "A new CARD arrived"
	line "from @"
	text_ram wStringBuffer2
	text "."
	done

_PutCardInCardFolderText::
	text "Put this CARD in"
	line "the CARD FOLDER?"
	done

_CardWasListedText::
	text_ram wStringBuffer2
	text "'s CARD was"
	line "listed as no.@"
	text_decimal wStringBuffer1, 1, 2
	text "."
	prompt

_StartingLinkText::
	text "Starting link."
	done

_LinkTerminatedText::
	text "Link terminated."
	done

_ClosingLinkText::
	text "Closing link."
	done

_ClearTimeLimitText:: ; unreferenced
	text "Clear the time"
	line "limit?"
	done

_TimeLimitWasClearedText:: ; unreferenced
	text "The time limit was"
	line "cleared."
	done

_PickErrorPacketText:: ; unreferenced
	text "Pick which packet"
	line "as an error?"
	done

_TradingMonForOTMonText::
	text "Trading @"
	text_ram wStringBuffer2
	text_start
	line "for @"
	text_ram wStringBuffer1
	text "…"
	done

; Mobile Adapter End

_ObtainedTheVoltorbBadgeText:: ; unreferenced
	text "Obtained the"
	line "VOLTORBBADGE!"
	done

_AskFloorElevatorText::
	text "Which floor?"
	done

_BugCatchingContestTimeUpText::
	text "ANNOUNCER: BEEEP!"

	para "Time's up!"
	done

_BugCatchingContestIsOverText::
	text "ANNOUNCER: The"
	line "Contest is over!"
	done

_SafariTimeUpText::
	text "PA: Ding-dong!"
	
	para "Time's up!"
	prompt

_SafariGameOverText::
	text "PA: Your SAFARI"
	line "Game is over!"
	done

_SafariOutOfBallsText::
	text "PA: Ding-dong!"

	para "You are out of"
	line "SAFARI BALLS!"
	prompt

_RepelWoreOffText::
	text "REPEL's effect"
	line "wore off."
	done

_UseAnotherRepelText::
	text "@"
	text_ram wStringBuffer3
	text "'s"
	line "wore off."

	para "Use another?"
	done

_PlayerFoundItemText::
	text "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ButNoSpaceText::
	text "But <PLAYER> has"
	line "no space left…"
	done

_JustSawSomeRareMonText::
	text "I just saw some"
	line "rare @"
	text_ram wStringBuffer1
	text " in"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "I'll call you if I"
	line "see another rare"
	cont "#MON, OK?"
	prompt

_SavingRecordText::
	text "SAVING RECORD…"
	line "DON'T TURN OFF!"
	done

_ReceiveItemText::
	text_ram wPlayerName
	text " received"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	sound_item
	text_promptbutton
	text_end

	text_end ; unreferenced

_NoCoinsText::
	text "You have no coins."
	prompt

_NoCoinCaseText::
	text "You don't have a"
	line "COIN CASE."
	prompt

_NPCTradeCableText::
	text "OK, connect the"
	line "Game Link Cable."
	prompt

Text_NPCTraded::
	text "<PLAYER> traded"
	line "@"
	text_ram wMonOrItemNameBuffer
	text " for"
	cont "@"
	text_ram wStringBuffer2
	text ".@"
	text_end

_NPCTradeFanfareText::
	sound_dex_fanfare_80_109
	text_pause
	text_end

	text_end ; unreferenced

_NPCTradeIntroText1::
	text "I collect #MON."
	line "Do you have"
	cont "@"
	text_ram wStringBuffer1
	text "?"

	para "Want to trade it"
	line "for my @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText1::
	text "You don't want to"
	line "trade? Aww…"
	done

_NPCTradeWrongText1::
	text "Huh? That's not"
	line "@"
	text_ram wStringBuffer1
	text ". "
	cont "What a letdown…"
	done

_NPCTradeCompleteText1::
	text "Yay! I got myself"
	line "@"
	text_ram wStringBuffer1
	text "!"
	cont "Thanks!"
	done

_NPCTradeAfterText1::
	text "Hi, how's my old"
	line "@"
	text_ram wStringBuffer2
	text " doing?"
	done

_NPCTradeIntroText2::
	text "Hi, I'm looking"
	line "for this #MON."

	para "If you have"
	line "@"
	text_ram wStringBuffer1
	text ", would"

	para "you trade it for"
	line "my @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText2::
	text "You don't have"
	line "one either?"

	para "Gee, that's really"
	line "disappointing…"
	done

_NPCTradeWrongText2::
	text "You don't have"
	line "@"
	text_ram wStringBuffer1
	text "? That's"
	cont "too bad, then."
	done

_NPCTradeCompleteText2::
	text "Great! Thank you!"

	para "I finally got"
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_NPCTradeAfterText2::
	text "Hi! The @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "you traded me is"
	cont "doing great!"
	done

_NPCTradeIntroText3::
	text_ram wMonOrItemNameBuffer
	text "'s cute,"
	line "but I don't have"

	para "it. Do you have"
	line "@"
	text_ram wStringBuffer1
	text "?"

	para "Want to trade it"
	line "for my @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText3::
	text "You don't want to"
	line "trade? Oh, darn…"
	done

_NPCTradeWrongText3::
	text "That's not"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "Please trade with"
	line "me if you get one."
	done

_NPCTradeCompleteText3::
	text "Wow! Thank you!"
	line "I always wanted"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text "!"
	done

_NPCTradeAfterText3::
	text "How is that"
	line "@"
	text_ram wStringBuffer2
	text " I"
	cont "traded you doing?"

	para "Your @"
	text_ram wMonOrItemNameBuffer
	text "'s"
	line "so cute!"
	done

_NPCTradeCompleteText4::
	text "Uh? What happened?"
	done

_NPCTradeAfterText4::
	text "Trading is so odd…"

	para "I still have a lot"
	line "to learn about it."
	done

_MomLeavingText1::
	text "Wow, that's a cute"
	line "#MON."

	para "Where did you get"
	line "it?"

	para "…"

	para "So, you're leaving"
	line "on an adventure…"

	para "OK!"
	line "I'll help too."

	para "But what can I do"
	line "for you?"

	para "I know! I'll save"
	line "money for you."

	para "On a long journey,"
	line "money's important."

	para "Do you want me to"
	line "save your money?"
	done

_MomLeavingText2::
	text "OK, I'll take care"
	line "of your money."

	para "<……><……><……>"
	prompt

_MomLeavingText3::
	text "Be careful."

	para "#MON are your"
	line "friends. You need"
	cont "to work as a team."

	para "Now, go on!"
	done

_MomIsThisAboutYourMoneyText::
	text "Hi! Welcome home!"
	line "You're trying very"
	cont "hard, I see."

	para "I've kept your"
	line "room tidy."

	para "Or is this about"
	line "your money?"
	done

_MomBankWhatDoYouWantToDoText::
	text "What do you want"
	line "to do?"
	done

_MomStoreMoneyText::
	text "How much do you"
	line "want to save?"
	done

_MomTakeMoneyText::
	text "How much do you"
	line "want to take?"
	done

_MomSaveMoneyText::
	text "Do you want to"
	line "save some money?"
	done

_MomHaventSavedThatMuchText::
	text "You haven't saved"
	line "that much."
	prompt

_MomNotEnoughRoomInWalletText::
	text "You can't take"
	line "that much."
	prompt

_MomInsufficientFundsInWalletText::
	text "You don't have"
	line "that much."
	prompt

_MomNotEnoughRoomInBankText::
	text "You can't save"
	line "that much."
	prompt

_MomStartSavingMoneyText::
	text "OK, I'll save your"
	line "money. Trust me!"

	para "<PLAYER>, stick"
	line "with it!"
	done

_MomStoredMoneyText::
	text "Your money's safe"
	line "here! Get going!"
	done

_MomTakenMoneyText::
	text "<PLAYER>, don't"
	line "give up!"
	done

_MomJustDoWhatYouCanText::
	text "Just do what"
	line "you can."
	done

_DaycareDummyText::
	text_start
	done

_DayCareManIntroText::
	text "I'm the DAY-CARE"
	line "MAN. Want me to"
	cont "raise a #MON?"
	done

_DayCareManIntroEggText::
	text "I'm the DAY-CARE"
	line "MAN. Do you know"
	cont "about EGGS?"

	para "I was raising"
	line "#MON with my"
	cont "wife, you see."

	para "We were shocked to"
	line "find an EGG!"

	para "How incredible is"
	line "that?"

	para "So, want me to"
	line "raise a #MON?"
	done

_DayCareLadyIntroText::
	text "I'm the DAY-CARE"
	line "LADY."

	para "Should I raise a"
	line "#MON for you?"
	done

_DayCareLadyIntroEggText::
	text "I'm the DAY-CARE"
	line "LADY. Do you know"
	cont "about EGGS?"

	para "My husband and I"
	line "were raising some"
	cont "#MON, you see."

	para "We were shocked to"
	line "find an EGG!"

	para "How incredible"
	line "could that be?"

	para "Should I raise a"
	line "#MON for you?"
	done

_WhatShouldIRaiseText::
	text "What should I"
	line "raise for you?"
	prompt

_OnlyOneMonText::
	text "Oh? But you have"
	line "just one #MON."
	prompt

_CantAcceptEggText::
	text "Sorry, but I can't"
	line "accept an EGG."
	prompt

_RemoveMailText::
	text "Remove MAIL before"
	line "you come see me."
	prompt

_LastHealthyMonText::
	text "If you give me"
	line "that, what will"
	cont "you battle with?"
	prompt

_IllRaiseYourMonText::
	text "OK. I'll raise"
	line "your @"
	text_ram wStringBuffer1
	text "."
	prompt

_ComeBackLaterText::
	text "Come back for it"
	line "later."
	done

_AreWeGeniusesText::
	text "Are we geniuses or"
	line "what? Want to see"
	cont "your @"
	text_ram wStringBuffer1
	text "?"
	done

_YourMonHasGrownText::
	text "Your @"
	text_ram wStringBuffer1
	text_start
	line "has grown a lot."

	para "By level, it's"
	line "grown by @"
	text_decimal wStringBuffer2 + 1, 1, 3
	text "."

	para "If you want your"
	line "#MON back, it"
	cont "will cost ¥@"
	text_decimal wStringBuffer2 + 2, 3, 4
	text "."
	done

_PerfectHeresYourMonText::
	text "Perfect! Here's"
	line "your #MON."
	prompt

_GotBackMonText::
	text "<PLAYER> got back"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BackAlreadyText::
	text "Huh? Back already?"
	line "Your @"
	text_ram wStringBuffer1
	text_start
	para "needs a little"
	line "more time with us."

	para "If you want your"
	line "#MON back, it"
	cont "will cost ¥100."
	done

_HaveNoRoomText::
	text "You have no room"
	line "for it."
	prompt

_NotEnoughMoneyText::
	text "You don't have"
	line "enough money."
	prompt

_OhFineThenText::
	text "Oh, fine then."
	prompt

_ComeAgainText::
	text "Come again."
	done

_NotYetText::
	text "Not yet…"
	done

_FoundAnEggText::
	text "Ah, it's you!"

	para "We were raising"
	line "your #MON, and"

	para "my goodness, were"
	line "we surprised!"

	para "Your #MON had"
	line "an EGG!"

	para "We don't know how"
	line "it got there, but"

	para "your #MON had"
	line "it. You want it?"
	done

_ReceivedEggText::
	text "<PLAYER> received"
	line "the EGG!"
	done

_TakeGoodCareOfEggText::
	text "Take good care of"
	line "it."
	done

_IllKeepItThanksText::
	text "Well then, I'll"
	line "keep it. Thanks!"
	done

_NoRoomForEggText::
	text "You have no room"
	line "in your party."
	cont "Come back later."
	done

_WhichMonPhotoText::
	text "Which #MON"
	line "should I photo-"
	cont "graph?"
	prompt

_HoldStillText::
	text "All righty. Hold"
	line "still for a bit."
	prompt

_PrestoAllDoneText::
	text "Presto! All done."
	line "Come again, OK?"
	done

_NoPhotoText::
	text "Oh, no picture?"
	line "Come again, OK?"
	done

_EggPhotoText::
	text "An EGG? My talent"
	line "is worth more…"
	done

_NameRaterHelloText::
	text "Hello, hello! I'm"
	line "the NAME RATER."

	para "I rate the names"
	line "of #MON."

	para "Would you like me"
	line "to rate names?"
	done

_NameRaterWhichMonText::
	text "Which #MON's"
	line "nickname should I"
	cont "rate for you?"
	prompt

_NameRaterBetterNameText::
	text "Hm… @"
	text_ram wStringBuffer1
	text "…"
	line "That's a fairly"
	cont "decent name."

	para "But, how about a"
	line "slightly better"
	cont "nickname?"

	para "Want me to give it"
	line "a better name?"
	done

_NameRaterWhatNameText::
	text "All right. What"
	line "name should we"
	cont "give it, then?"
	prompt

_NameRaterFinishedText::
	text "That's a better"
	line "name than before!"

	para "Well done!"
	done

_NameRaterComeAgainText::
	text "OK, then. Come"
	line "again sometime."
	done

_NameRaterPerfectNameText::
	text "Hm… @"
	text_ram wStringBuffer1
	text "?"
	line "What a great name!"
	cont "It's perfect."

	para "Treat @"
	text_ram wStringBuffer1
	text_start
	line "with loving care."
	done

_NameRaterEggText::
	text "Whoa… That's just"
	line "an EGG."
	done

_NameRaterSameNameText::
	text "It might look the"
	line "same as before,"

	para "but this new name"
	line "is much better!"

	para "Well done!"
	done

_NameRaterNamedText::
	text "All right. This"
	line "#MON is now"
	cont "named @"
	text_ram wStringBuffer1
	text "."
	prompt

Text_Gained::
	text_ram wStringBuffer1
	text " gained@"
	text_end

_BoostedExpPointsText::
	text_start
	line "a boosted"
	cont "@"
	text_decimal wStringBuffer2, 3, 6
	text " EXP. Points!"
	prompt

_ExpPointsText::
	text_start
	line "@"
	text_decimal wStringBuffer2, 3, 6
	text " EXP. Points!"
	prompt

_GoMonText::
	text "Go! @"
	text_end

_DoItMonText::
	text "Do it! @"
	text_end

_GoForItMonText::
	text "Go for it,"
	line "@"
	text_end

_YourFoesWeakGetmMonText::
	text "Your foe's weak!"
	line "Get'm, @"
	text_end

_BattleMonNicknameText::
	text_ram wBattleMonNickname
	text "!"
	done

_BattleMonNickCommaText::
	text_ram wBattleMonNickname
	text ",@"
	text_end

_ThatsEnoughComeBackText::
	text " that's"
	line "enough! Come back!@"
	text_end

_OKComeBackText::
	text " OK!"
	line "Come back!@"
	text_end

_GoodComeBackText::
	text " good!"
	line "Come back!@"
	text_end

_ComeBackText::
	text " come"
	line "back!"
	done

_BootedTMText::
	text "Booted up a TM."
	prompt

_BootedHMText::
	text "Booted up an HM."
	prompt

_ContainedMoveText::
	text "It contained"
	line "@"
	text_ram wStringBuffer2
	text "."

	para "Teach @"
	text_ram wStringBuffer2
	text_start
	line "to a #MON?"
	done

_TMHMNotCompatibleText::
	text_ram wStringBuffer2
	text " is"
	line "not compatible"
	cont "with @"
	text_ram wStringBuffer1
	text "."

	para "It can't learn"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_NoRoomTMHMText::
	text "You have no room"
	line "for any more"
	cont "@"
	text_ram wStringBuffer1
	text "S."
	prompt

_ReceivedTMHMText::
	text "You received"
	line "@"
	text_ram wStringBuffer1
	text "!"
	prompt

_MysteryGiftCanceledText::
	text "The link has been"
	line "cancelled."
	prompt

_MysteryGiftCommErrorText::
	text "Communication"
	line "error."
	prompt

_RetrieveMysteryGiftText::
	text "Must retrieve GIFT"
	line "at #MON CENTER."
	prompt

_YourFriendIsNotReadyText::
	text "Your friend isn't"
	line "ready."
	prompt

_MysteryGiftFiveADayText::
	text "Sorry--only five"
	line "GIFTS a day."
	prompt

_MysteryGiftOneADayText::
	text "Sorry. One GIFT"
	line "a day per person."
	prompt

_MysteryGiftSentText::
	text_ram wMysteryGiftPartnerName
	text " sent"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_MysteryGiftSentHomeText::
	text_ram wMysteryGiftPartnerName
	text " sent"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "to @"
	text_ram wMysteryGiftPlayerName
	text "'s home."
	prompt

_NameCardReceivedCardText::
	text "Received"
	line "@"
	text_ram wMysteryGiftCardHolderName
	text "'s CARD."
	prompt

_NameCardListedCardText::
	text_ram wMysteryGiftCardHolderName
	text "'s CARD was"
	line "listed as no.@"
	text_decimal wTextDecimalByte, 1, 2
	text "."
	prompt

_NameCardNotRegisteredCardText::
	text "The CARD was not"
	line "registered."
	prompt

_NameCardLinkCancelledText::
	text "The link has been"
	line "cancelled."
	prompt

_NameCardLinkCommErrorText::
	text "Communication"
	line "error."
	prompt

_BadgeRequiredText::
	text "Sorry! A new BADGE"
	line "is required."
	prompt

_CantUseItemText::
	text "Can't use that"
	line "here."
	prompt

_UseCutText::
	text_ram wStringBuffer2
	text " used"
	line "CUT!"
	prompt

_UsePagerCutText::
	text "<PLAYER> summoned a"
	line "SCYTHER to use"
	cont "CUT!"
	done

_CutNothingText::
	text "There's nothing to"
	line "CUT here."
	prompt

_BlindingFlashText::
	text "A blinding FLASH"
	line "lights the area!"
	done

_BlindingFlashPagerText::
	text "<PLAYER> summoned a"
	line "MAREEP to use"
	cont "FLASH!"
	done

_UsedSurfText::
	text_ram wStringBuffer2
	text " used"
	line "SURF!"
	done

_UsedSurfPagerText::
	text "<PLAYER> summoned a"
	line "LAPRAS to use"
	cont "SURF!"
	done

_CantSurfText::
	text "You can't SURF"
	line "here."
	prompt

_AlreadySurfingText::
	text "You're already"
	line "SURFING."
	prompt

_AskSurfText::
	text "The water is calm."
	line "Want to SURF?"
	done

_AskSurfPagerText::
	text "The water is calm."
	line "Want to use"
	cont "LAPRAS SURF?"
	done

_UsedFlyPagerText::
	text "<PLAYER> summoned a"
	line "PIDGEOT to use"
	cont "FLY!"
	done

_UseWaterfallText::
	text_ram wStringBuffer2
	text " used"
	line "WATERFALL!"
	done

_UseWaterfallPagerText::
	text "<PLAYER> summoned a"
	line "LAPRAS to use"
	cont "WATERFALL!"
	done

_HugeWaterfallText::
	text "Wow, it's a huge"
	line "waterfall."
	done

_AskWaterfallText::
	text "Do you want to use"
	line "WATERFALL?"
	done

_UseDigText::
	text_ram wStringBuffer2
	text " used"
	line "DIG!"
	done

_UseEscapeRopeText::
	text "<PLAYER> used an"
	line "ESCAPE ROPE."
	done

_CantUseDigText::
	text "Can't use that"
	line "here."
	done

_TeleportReturnText::
	text "Return to the last"
	line "#MON CENTER."
	done

_CantUseTeleportText::
	text "Can't use that"
	line "here."

	para ""
	done

_AlreadyUsingStrengthText::
	text "A #MON is using"
	line "STRENGTH already."
	prompt

_UseStrengthText::
	text_ram wStringBuffer2
	text " used"
	line "STRENGTH!"
	done

_MoveBoulderText::
	text_ram wStringBuffer1
	text " can"
	line "move boulders."
	prompt

_AskStrengthText::
	text "A #MON may be"
	line "able to move this."

	para "Want to use"
	line "STRENGTH?"
	done

_UseStrengthPagerText::
	text "<PLAYER> summoned a"
	line "MACHOKE to use"
	cont "STRENGTH!"
	done

_MoveBoulderPagerText::
	text "MACHOKE can"
	line "move boulders."
	prompt

_AskStrengthPagerText::
	text "A #MON may be"
	line "able to move this."

	para "Want to use"
	line "MACHOKE PUSH?"
	done

_BouldersMoveText::
	text "Boulders may now"
	line "be moved!"
	done

_BouldersMayMoveText::
	text "A #MON may be"
	line "able to move this."
	done

_UseWhirlpoolText::
	text_ram wStringBuffer2
	text " used"
	line "WHIRLPOOL!"
	prompt

_UseWhirlpoolPagerText::
	text "<PLAYER> summoned a"
	line "REMORAID to use"
	cont "WHIRLPOOL!"
	done

_MayPassWhirlpoolText::
	text "It's a vicious"
	line "whirlpool!"

	para "A #MON may be"
	line "able to pass it."
	done

_AskWhirlpoolText::
	text "A whirlpool is in"
	line "the way."

	para "Want to use"
	line "WHIRLPOOL?"
	done

_AskWhirlpoolPagerText::
	text "A whirlpool is in"
	line "the way."

	para "Want to use"
	line "REMORAID WHIRL?"
	done

_UseHeadbuttText::
	text_ram wStringBuffer2
	text " did a"
	line "HEADBUTT!"
	prompt

_HeadbuttNothingText::
	text "Nope. Nothing…"
	done

_AskHeadbuttText::
	text "A #MON could be"
	line "in this tree."

	para "Want to HEADBUTT"
	line "it?"
	done

_UseRockSmashText::
	text_ram wStringBuffer2
	text " used"
	line "ROCK SMASH!"
	prompt


_UseRockSmashPagerText::
	text "<PLAYER> summoned a"
	line "CUBONE to use"
	cont "ROCK SMASH!"
	done

_MaySmashText::
	text "Maybe a #MON"
	line "can break this."
	done

_AskRockSmashText::
	text "This rock looks"
	line "breakable."

	para "Want to use ROCK"
	line "SMASH?"
	done

_AskRockSmashPagerText::
	text "This rock looks"
	line "breakable."

	para "Want to use"
	line "CUBONE SMASH?"
	done

_RodBiteText::
	text "Oh!"
	line "A bite!"
	prompt

_RodNothingText::
	text "Not even a nibble!"
	prompt

_UnusedNothingHereText::
	text "Looks like there's"
	line "nothing here."
	prompt

_CantGetOffBikeText::
	text "You can't get off"
	line "here!"
	done

_GotOnBikeText::
	text "<PLAYER> got on the"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

_GotOffBikeText::
	text "<PLAYER> got off"
	line "the @"
	text_ram wStringBuffer2
	text "."
	done

_AskCutText::
	text "This tree can be"
	line "CUT!"

	para "Want to use CUT?"
	done

_AskCutPagerText::
	text "This tree can be"
	line "CUT!"

	para "Want to use"
	line "SCYTHER CHOP?"
	done

_CanCutText::
	text "This tree can be"
	line "CUT!"
	done

_FoundItemText::
	text "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_CantCarryItemText::
	text "But <PLAYER> can't"
	line "carry any more"
	cont "items."
	done

_WhitedOutText::
	text "<PLAYER> is out of"
	line "useable #MON!"

	para "<PLAYER> whited"
	line "out!"
	done

_ItemfinderItemNearbyText::
	text "Yes! ITEMFINDER"
	line "indicates there's"
	cont "an item nearby."
	prompt

_ItemfinderNopeText::
	text "Nope! ITEMFINDER"
	line "isn't responding."
	prompt

_PoisonFaintText::
	text_ram wStringBuffer3
	text_start
	line "fainted!"
	prompt

_PoisonWhiteoutText::
	text "<PLAYER> is out of"
	line "useable #MON!"

	para "<PLAYER> whited"
	line "out!"
	prompt

_UseSweetScentText::
	text_ram wStringBuffer3
	text " used"
	line "SWEET SCENT!"
	done

_SweetScentNothingText::
	text "Looks like there's"
	line "nothing here…"
	done

_SquirtbottleNothingText::
	text "<PLAYER> sprinkled"
	line "water."

	para "But nothing"
	line "happened…"
	done

_UseSacredAshText::
	text "<PLAYER>'s #MON"
	line "were all healed!"
	done

_AnEggCantHoldAnItemText::
	text "An EGG can't hold"
	line "an item."
	prompt

_PackNoItemText::
	text "No items."
	done

_AskThrowAwayText::
	text "Throw away how"
	line "many?"
	done

_AskQuantityThrowAwayText::
	text "Throw away @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S)?"
	done

_ThrewAwayText::
	text "Threw away"
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	prompt

_OakThisIsntTheTimeText::
	text "OAK: <PLAYER>!"
	line "This isn't the"
	cont "time to use that!"
	prompt

_YouDontHaveAMonText::
	text "You don't have a"
	line "#MON!"
	prompt

_RegisteredItemText::
	text "Registered the"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_CantRegisterText::
	text "You can't register"
	line "that item."
	prompt

_AskItemMoveText::
	text "Where should this"
	line "be moved to?"
	done

_PackEmptyText::
	text_start
	done

_YouCantUseItInABattleText::
	text "You can't use it"
	line "in a battle."
	prompt

_AreYouABoyOrAreYouAGirlText::
	text "Are you a boy?"
	line "Or are you a girl?"
	done

Text_ThisGameHasTwoGameModes::
	text "This game has two"
	line "difficulty modes."

	para "Which mode would"
	line "you like to play?"
	prompt

Text_NormalModeDesc::
	text "#MON levels"
	line "remain unchanged."
	done

Text_ChallengeModeDesc::
	text "Higher #MON"
	line "levels."
	done

Text_ThisCannotBeChanged::
	text "This cannot be"
	line "changed. Proceed?"
	done

Text_BattleEffectActivate::
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_BattleStatWentWayUpText::
	text_pause
	text "<SCROLL>sharply rose!"
	prompt

_BattleStatWentUpText::
	text " rose!"
	prompt

Text_BattleFoeEffectActivate::
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_BattleStatSharplyFellText::
	text_pause
	text "<SCROLL>harshly fell!"
	prompt

_BattleStatFellText::
	text " fell!"
	prompt

Text_BattleUser::
	text "<USER>@"
	text_end

_BattleMadeWhirlwindText::
	text_start
	line "made a whirlwind!"
	prompt

_BattleTookSunlightText::
	text_start
	line "took in sunlight!"
	prompt

_BattleLoweredHeadText::
	text_start
	line "lowered its head!"
	prompt

_BattleGlowingText::
	text_start
	line "is glowing!"
	prompt

_BattleFlewText::
	text_start
	line "flew up high!"
	prompt

_BattleDugText::
	text_start
	line "dug a hole!"
	prompt

_ActorNameText::
	text "<USER>@"
	text_end

_UsedMove1Text::
	text_start
	line "used @"
	text_end

_UsedMove2Text::
	text_start
	line "used @"
	text_end

_UsedInsteadText::
	text "instead,"
	cont "@"
	text_end

_MoveNameText::
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_EndUsedMove1Text::
	text "!"
	done

_EndUsedMove2Text::
	text "!"
	done

_EndUsedMove3Text::
	text "!"
	done

_EndUsedMove4Text::
	text "!"
	done

_EndUsedMove5Text::
	text "!"
	done

Text_BreedHuh::
	text "Huh?"

	para "@"
	text_end

_BreedClearboxText::
	text_start
	done

_BreedEggHatchText::
	text_ram wStringBuffer1
	text " came"
	line "out of its EGG!@"
	sound_caught_mon
	text_promptbutton
	text_end

	text_end ; unreferenced

_BreedAskNicknameText::
	text "Give a nickname to"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

_LeftWithDayCareLadyText::
	text "It's @"
	text_ram wBreedMon2Nickname
	text_start
	line "that was left with"
	cont "the DAY-CARE LADY."
	done

_LeftWithDayCareManText::
	text "It's @"
	text_ram wBreedMon1Nickname
	text_start
	line "that was left with"
	cont "the DAY-CARE MAN."
	done

_BreedBrimmingWithEnergyText::
	text "It's brimming with"
	line "energy."
	prompt

_BreedNoInterestText::
	text "It has no interest"
	line "in @"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedAppearsToCareForText::
	text "It appears to care"
	line "for @"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedFriendlyText::
	text "It's friendly with"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedShowsInterestText::
	text "It shows interest"
	line "in @"
	text_ram wStringBuffer1
	text "."
	prompt

_EmptyMailboxText::
	text "There's no MAIL"
	line "here."
	prompt

_MailClearedPutAwayText::
	text "The cleared MAIL"
	line "was put away."
	prompt

_MailPackFullText::
	text "The PACK is full."
	prompt

_MailMessageLostText::
	text "The MAIL's message"
	line "will be lost. OK?"
	done

_MailAlreadyHoldingItemText::
	text "It's already hold-"
	line "ing an item."
	prompt

_MailEggText::
	text "An EGG can't hold"
	line "any MAIL."
	prompt

_MailMovedFromBoxText::
	text "The MAIL was moved"
	line "from the MAILBOX."
	prompt

_YesPromptText:: ; unreferenced
	text "Yes"
	prompt

_NoPromptText:: ; unreferenced
	text "No"
	prompt

_AnimationTypeText:: ; unreferenced
	text_decimal wcf64, 1, 3
	text " @"
	text_ram wStringBuffer1
	text_start
	line "Animation type @"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_MonNumberText:: ; unreferenced
	text "#MON number?"
	done

_WasSentToBillsPCText::
	text_ram wStringBuffer1
	text " was"
	line "sent to BILL's PC."
	prompt

_PCGottaHavePokemonText::
	text "You gotta have"
	line "#MON to call!"
	prompt

_PCWhatText::
	text "What?"
	done

_PCMonHoldingMailText::
	text "There is a #MON"
	line "holding MAIL."

	para "Please remove the"
	line "MAIL."
	prompt

_PCNoSingleMonText::
	text "You don't have a"
	line "single #MON!"
	prompt

_PCCantDepositLastMonText::
	text "You can't deposit"
	line "your last #MON!"
	prompt

_PCCantTakeText::
	text "You can't take any"
	line "more #MON."
	prompt

_ContestCaughtMonText::
	text "Caught @"
	text_ram wStringBuffer1
	text "!"
	prompt

_ContestAskSwitchText::
	text "Switch #MON?"
	done

_ContestAlreadyCaughtText::
	text "You already caught"
	line "a @"
	text_ram wStringBuffer1
	text "."
	prompt

_ContestJudging_FirstPlaceText::
	text "This Bug-Catching"
	line "Contest winner is@"
	text_pause
	text "…"

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "who caught a"
	cont "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_FirstPlaceScoreText::
	text_start

	para "The winning score"
	line "was @"
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " points!"
	prompt

_ContestJudging_SecondPlaceText::
	text "Placing second was"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "who caught a"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_SecondPlaceScoreText::
	text_start

	para "The score was"
	line "@"
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " points!"
	prompt

_ContestJudging_ThirdPlaceText::
	text "Placing third was"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "who caught a"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_ThirdPlaceScoreText::
	text_start

	para "The score was"
	line "@"
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " points!"
	prompt

_MagikarpGuruMeasureText::
	text "Let me measure"
	line "that MAGIKARP."

	para "…Hm, it measures"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_KarpGuruRecordText::
	text "CURRENT RECORD"

	para "@"
	text_ram wStringBuffer1
	text " caught by"
	line "@"
	text_ram wMagikarpRecordHoldersName
	text_promptbutton
	text_end

	text_end ; unreferenced

_LuckyNumberMatchPartyText::
	text "Congratulations!"

	para "We have a match"
	line "with the ID number"

	para "of @"
	text_decimal wBufferMonID, 2, 5
	text " in"
	line "your party."
	prompt

_LuckyNumberMatchPCText::
	text "Congratulations!"

	para "We have a match"
	line "with the ID number"

	para "of @"
	text_decimal wBufferMonID, 2, 5
	text " in Box"
	line "“@"
	text_ram wStringBuffer1
	text "”."
	prompt

_CaughtAskNicknameText::
	text "Give a nickname to"
	line "the @"
	text_ram wStringBuffer1
	text " you"
	cont "received?"
	done

_PokecenterPCCantUseText::
	text "Bzzzzt! You must"
	line "have a #MON to"
	cont "use this!"
	prompt

_PlayersPCTurnOnText::
	text "<PLAYER> turned on"
	line "the PC."
	prompt

_PlayersPCAskWhatDoText::
	text "What do you want"
	line "to do?"
	done

_PlayersPCHowManyWithdrawText::
	text "How many do you"
	line "want to withdraw?"
	done

_PlayersPCWithdrewItemsText::
	text "Withdrew @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "There's no room"
	line "for more items."
	prompt

_PlayersPCNoItemsText::
	text "No items here!"
	prompt

_PlayersPCHowManyDepositText::
	text "How many do you"
	line "want to deposit?"
	done

_PlayersPCDepositItemsText::
	text "Deposited @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	prompt

_PlayersPCNoRoomDepositText::
	text "There's no room to"
	line "store items."
	prompt

_PokecenterPCTurnOnText::
	text "<PLAYER> turned on"
	line "the PC."
	prompt

_PokecenterPCWhoseText::
	text "Access whose PC?"
	done

_PokecenterBillsPCText::
	text "BILL's PC"
	line "accessed."

	para "#MON Storage"
	line "System opened."
	prompt

_PokecenterPlayersPCText::
	text "Accessed own PC."

	para "Item Storage"
	line "System opened."
	prompt

_PokecenterOaksPCText::
	text "PROF.OAK's PC"
	line "accessed."

	para "#DEX Rating"
	line "System opened."
	prompt

_PokecenterPCOaksClosedText::
	text "…"
	line "Link closed…"
	done

_OakPCText1::
	text "Want to get your"
	line "#DEX rated?"
	done

_OakPCText2::
	text "Current #DEX"
	line "completion level:"
	prompt

_OakPCText3::
	text_ram wStringBuffer3
	text " #MON seen"
	line "@"
	text_ram wStringBuffer4
	text " #MON owned"

	para "PROF.OAK's"
	line "Rating:"
	done

_OakRating01::
	text "Look for #MON"
	line "in grassy areas!"
	done

_OakRating02::
	text "Good. I see you"
	line "understand how to"
	cont "use # BALLS."
	done

_OakRating03::
	text "You're getting"
	line "good at this."

	para "But you have a"
	line "long way to go."
	done

_OakRating04::
	text "You need to fill"
	line "up the #DEX."

	para "Catch different"
	line "kinds of #MON!"
	done

_OakRating05::
	text "You're trying--I"
	line "can see that."

	para "Your #DEX is"
	line "coming together."
	done

_OakRating06::
	text "To evolve, some"
	line "#MON grow,"

	para "others use the"
	line "effects of STONES."
	done

_OakRating07::
	text "Have you gotten a"
	line "fishing ROD? You"

	para "can catch #MON"
	line "by fishing."
	done

_OakRating08::
	text "Excellent! You"
	line "seem to like col-"
	cont "lecting things!"
	done

_OakRating09::
	text "Some #MON only"
	line "appear during"

	para "certain times of"
	line "the day."
	done

_OakRating10::
	text "Your #DEX is"
	line "filling up. Keep"
	cont "up the good work!"
	done

_OakRating11::
	text "I'm impressed."
	line "You're evolving"

	para "#MON, not just"
	line "catching them."
	done

_OakRating12::
	text "Have you met KURT?"
	line "His custom BALLS"
	cont "should help."
	done

_OakRating13::
	text "Wow. You've found"
	line "more #MON than"

	para "the last #DEX"
	line "research project."
	done

_OakRating14::
	text "Are you trading"
	line "your #MON?"

	para "It's tough to do"
	line "this alone!"
	done

_OakRating15::
	text "Wow! You've hit"
	line "200! Your #DEX"
	cont "is looking great!"
	done

_OakRating16::
	text "You've found so"
	line "many #MON!"

	para "You've really"
	line "helped my studies!"
	done

_OakRating17::
	text "Magnificent! You"
	line "could become a"

	para "#MON professor"
	line "right now!"
	done

_OakRating18::
	text "Your #DEX is"
	line "amazing! You're"

	para "ready to turn"
	line "professional!"
	done

_OakRating19::
	text "Whoa! A perfect"
	line "#DEX! I've"

	para "dreamt about this!"
	line "Congratulations!"
	done

_OakPCText4::
	text "The link to PROF."
	line "OAK's PC closed."
	done

_TrainerRankingExplanationText:: ; unreferenced
	text "Triple-theme"
	line "trainer ranking!"

	para "The SAVE file you"
	line "just sent might"
	cont "make the rankings!"

	para ""
	done

_TrainerRankingNoDataText:: ; unreferenced
	text "There is no"
	line "ranking data."

	para "Link to obtain"
	line "ranking data."

	para ""
	done

_MemoryGameYeahText::
	text " , yeah!"
	done

_MemoryGameDarnText::
	text "Darn…"
	done

_StartMenuContestEndText::
	text "Would you like to"
	line "end the Contest?"
	done

EndTheSafariGame_text::
	text "Would you like to"
	line "end your SAFARI"
	cont "game?"
	done

_ItemsTossOutHowManyText::
	text "Toss out how many"
	line "@"
	text_ram wStringBuffer2
	text "(S)?"
	done

_ItemsThrowAwayText::
	text "Throw away @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S)?"
	done

_ItemsDiscardedText::
	text "Discarded"
	line "@"
	text_ram wStringBuffer1
	text "(S)."
	prompt

_ItemsTooImportantText::
	text "That's too impor-"
	line "tant to toss out!"
	prompt

_ItemsOakWarningText::
	text "OAK: <PLAYER>!"
	line "This isn't the"
	cont "time to use that!"
	done

_PokemonSwapItemText::
	text "Took @"
	text_ram wMonOrItemNameBuffer
	text "'s"
	line "@"
	text_ram wStringBuffer1
	text " and"

	para "made it hold"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonHoldItemText::
	text "Made @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "hold @"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonRemoveMailText::
	text "Please remove the"
	line "MAIL first."
	prompt

_PokemonNotHoldingText::
	text_ram wMonOrItemNameBuffer
	text " isn't"
	line "holding anything."
	prompt

_ItemStorageFullText::
	text "Item storage space"
	line "full."
	prompt

_PokemonTookItemText::
	text "Took @"
	text_ram wStringBuffer1
	text_start
	line "from @"
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

_PokemonAskSwapItemText::
	text_ram wMonOrItemNameBuffer
	text " is"
	line "already holding"

	para "@"
	text_ram wStringBuffer1
	text "."
	line "Switch items?"
	done

_ItemCantHeldText::
	text "This item can't be"
	line "held."
	prompt

_CantPlaceMailInStorageText::
	text "Can't place MAIL in"
	line "storage."
	prompt

_MailLoseMessageText::
	text "The MAIL will lose"
	line "its message. OK?"
	done

_MailDetachedText::
	text "MAIL detached from"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_MailNoSpaceText::
	text "There's no space"
	line "for removing MAIL."
	prompt

_MailAskSendToPCText::
	text "Send the removed"
	line "MAIL to your PC?"
	done

_MailboxFullText::
	text "Your PC's MAILBOX"
	line "is full."
	prompt

_MailSentToPCText::
	text "The MAIL was sent"
	line "to your PC."
	prompt

_PokemonNotEnoughHPText::
	text "Not enough HP!"
	prompt

_MayRegisterItemText::
	text "An item in your"
	line "PACK may be"

	para "registered for use"
	line "on SELECT Button."
	done

_OakText1::
	text "Hello! Sorry to"
	line "keep you waiting!"

if !DEF(_DEBUG)
	para "Welcome to the"
	line "world of #MON!"

	para "My name is OAK."

	para "People call me the"
	line "#MON PROF."
endc
	prompt

_OakText2::
	text "This world is in-"
	line "habited by crea-"
	cont "tures that we call"
	cont "#MON.@"
	text_end

_OakText3::
	text_promptbutton
	text_end

	text_end ; unreferenced

_OakText4::
	text "People and #MON"
	line "live together by"

	para "supporting each"
	line "other."

	para "Some people play"
	line "with #MON, some"
	cont "battle with them."
	prompt

_OakText5::
	text "But we don't know"
	line "everything about"
	cont "#MON yet."

	para "There are still"
	line "many mysteries to"
	cont "solve."

	para "That's why I study"
	line "#MON every day."
	prompt

_CantDepositText::
	text "Can't deposit"
	line "this item."
	prompt

_OakText6::
	text "Now, what did you"
	line "say your name was?"
	prompt

_OakText7::
	text "<PLAYER>, are you"
	line "ready?"

if !DEF(_DEBUG)
	para "Your very own"
	line "#MON story is"
	cont "about to unfold."

	para "You'll face fun"
	line "times and tough"
	cont "challenges."

	para "A world of dreams"
	line "and adventures"

	para "with #MON"
	line "awaits! Let's go!"

endc
	para "I'll be seeing you"
	line "later!"
	done

_ClockTimeMayBeWrongText::
	text "The clock's time"
	line "may be wrong."

	para "Please reset the"
	line "time."
	prompt

_ClockSetWithControlPadText::
	text "Set with the"
	line "Control Pad."

	para "Confirm: A Button"
	line "Cancel:  B Button"
	done

_ClockIsThisOKText::
	text "Is this OK?"
	done

_ClockHasResetText::
	text "The clock has been"
	line "reset."
	done

_LinkTimeoutText::
	text "Too much time has"
	line "elapsed. Please"
	cont "try again."
	prompt

_LinkTradeCantBattleText::
	text "If you trade that"
	line "#MON, you won't"
	cont "be able to battle."
	prompt

_LinkAbnormalMonText::
	text "Your friend's"
	line "@"
	text_ram wStringBuffer1
	text " appears"
	cont "to be abnormal!"
	prompt

_LinkAskTradeForText::
	text "Trade @"
	text_ram wBufferTrademonNickname
	text_start
	line "for @"
	text_ram wStringBuffer1
	text "?"
	done

_MobileBattleMustPickThreeMonText::
	text "To enter a mobile"
	line "battle, you must"

	para "pick a team of"
	line "three #MON."

	para "Is that OK?"
	done

_MobileBattleMoreInfoText::
	text "Need more info on"
	line "mobile battles?"
	done

_MobileBattleRulesText::
	text "For a mobile"
	line "battle, choose"
	cont "three #MON."

	para "The maximum daily"
	line "play time is ten"

	para "minutes for each"
	line "linked player."

	para "If a battle isn't"
	line "finished within"

	para "the time limit,"
	line "the player with"

	para "the fewest fainted"
	line "#MON wins."

	para "If tied, the team"
	line "that lost the"

	para "least amount of HP"
	line "wins."
	done

_WouldYouLikeToMobileBattleText::
	text "Today's remaining"
	line "time is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."

	para "Would you like to"
	line "battle?"
	done

_WantAQuickMobileBattleText::
	text "There are only @"
	text_decimal wStringBuffer2, 1, 2
	text_start
	line "min. left today."

	para "Want a quick"
	line "battle?"
	done

_WantToRushThroughAMobileBattleText::
	text "There is only"
	line "1 min. left today!"

	para "Want to rush"
	line "through a battle?"
	done

_PleaseTryAgainTomorrowText::
	text "There is less than"
	line "1 min. left today!"

	para "Please try again"
	line "tomorrow."
	done

_TryAgainUsingSameSettingsText::
	text "Try again using"
	line "the same settings?"
	done

_MobileBattleLessThanOneMinuteLeftText::
	text "There is less than"
	line "1 min. left today!"
	done

_MobileBattleNoTimeLeftForLinkingText::
	text "No time left for"
	line "linking today."
	done

_PickThreeMonForMobileBattleText::
	text "Pick three #MON"
	line "for battle."
	done

_MobileBattleRemainingTimeText::
	text "Today's remaining"
	line "time is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."
	done

_WouldYouLikeToSaveTheGameText::
	text "Would you like to"
	line "save the game?"
	done

_SavedTheGameText::
	text "<PLAYER> saved"
	line "the game."
	done

_AnotherSaveFileText::
	text "There is another"
	line "save file. Is it"
	cont "OK to overwrite?"
	done

_SaveFileCorruptedText::
	text "The save file is"
	line "corrupted!"
	prompt

_WindowAreaExceededErrorText:: ; unreferenced
	text "The window save"
	line "area was exceeded."
	done

_WindowPoppingErrorText::
	text "No windows avail-"
	line "able for popping."
	done

_CorruptedEventText:: ; unreferenced
	text "Corrupted event!"
	prompt

_ObjectEventText::
	text "Object event"
	done

_ReceivedItemText::
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

_PutItemInPocketText::
	text "<PLAYER> put the"
	line "@"
	text_ram wStringBuffer1
	text " in"
	cont "the @"
	text_ram wStringBuffer3
	text "."
	prompt

_PocketIsFullText::
	text "The @"
	text_ram wStringBuffer3
	text_start
	line "is full…"
	prompt

_SeerSeeAllText::
	text "I see all."
	line "I know all…"

	para "Certainly, I know"
	line "of your #MON!"
	done

_SeerCantTellAThingText::
	text "Whaaaat? I can't"
	line "tell a thing!"

	para "How could I not"
	line "know of this?"
	done

_SeerNameLocationText::
	text "Hm… I see you met"
	line "@"
	text_ram wSeerNickname
	text " here:"
	cont "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

_SeerTimeLevelText::
	text "The time was"
	line "@"
	text_ram wSeerTimeOfDay
	text "!"

	para "Its level was @"
	text_ram wSeerCaughtLevelString
	text "!"

	para "Am I good or what?"
	prompt

_SeerTradeText::
	text "Hm… @"
	text_ram wSeerNickname
	text_start
	line "came from @"
	text_ram wSeerOT
	text_start
	cont "in a trade?"

	para "@"
	text_ram wSeerCaughtLocation
	text_start
	line "was where @"
	text_ram wSeerOT
	text_start
	cont "met @"
	text_ram wSeerNickname
	text "!"
	prompt

_SeerNoLocationText::
	text "What!? Incredible!"

	para "I don't understand"
	line "how, but it is"

	para "incredible!"
	line "You are special."

	para "I can't tell where"
	line "you met it, but it"
	cont "was at level @"
	text_ram wSeerCaughtLevelString
	text "."

	para "Am I good or what?"
	prompt

_SeerEggText::
	text "Hey!"

	para "That's an EGG!"

	para "You can't say that"
	line "you've met it yet…"
	done

_SeerDoNothingText::
	text "Fufufu! I saw that"
	line "you'd do nothing!"
	done

_SeerMoreCareText::
	text "Incidentally…"

	para "It would be wise"
	line "to raise your"

	para "#MON with a"
	line "little more care."
	done

_SeerMoreConfidentText::
	text "Incidentally…"

	para "It seems to have"
	line "grown a little."

	para "@"
	text_ram wSeerNickname
	text " seems"
	line "to be becoming"
	cont "more confident."
	done

_SeerMuchStrengthText::
	text "Incidentally…"

	para "@"
	text_ram wSeerNickname
	text " has"
	line "grown. It's gained"
	cont "much strength."
	done

_SeerMightyText::
	text "Incidentally…"

	para "It certainly has"
	line "grown mighty!"

	para "This @"
	text_ram wSeerNickname
	text_start
	line "must have come"

	para "through numerous"
	line "#MON battles."

	para "It looks brimming"
	line "with confidence."
	done

_SeerImpressedText::
	text "Incidentally…"

	para "I'm impressed by"
	line "your dedication."

	para "It's been a long"
	line "time since I've"

	para "seen a #MON as"
	line "mighty as this"
	cont "@"
	text_ram wSeerNickname
	text "."

	para "I'm sure that"
	line "seeing @"
	text_ram wSeerNickname
	text_start

	para "in battle would"
	line "excite anyone."
	done

_CongratulationsYourPokemonText::
	text "Congratulations!"
	line "Your @"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_EvolvedIntoText::
	text_start

	para "evolved into"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_StoppedEvolvingText::
	text "Huh? @"
	text_ram wStringBuffer2
	text_start
	line "stopped evolving!"
	prompt

_EvolvingText::
	text "What? @"
	text_ram wStringBuffer2
	text_start
	line "is evolving!"
	done

_MartHowManyText::
	text "How many?"
	done

AlreadyHaveTMText::
	text "You already have"
	line "that TM."
	done

_MartFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(S)"
	line "will be ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbShopLadyIntroText::
	text "Hello, dear."

	para "I sell inexpensive"
	line "herbal medicine."

	para "They're good, but"
	line "a trifle bitter."

	para "Your #MON may"
	line "not like them."

	para "Hehehehe…"
	done

_HerbalLadyHowManyText::
	text "How many?"
	done

_HerbalLadyFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(S)"
	line "will be ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbalLadyThanksText::
	text "Thank you, dear."
	line "Hehehehe…"
	done

_HerbalLadyPackFullText::
	text "Oh? Your PACK is"
	line "full, dear."
	done

_HerbalLadyNoMoneyText::
	text "Hehehe… You don't"
	line "have the money."
	done

_HerbalLadyComeAgainText::
	text "Come again, dear."
	line "Hehehehe…"
	done

_BargainShopIntroText::
	text "Hiya! Care to see"
	line "some bargains?"

	para "I sell rare items"
	line "that nobody else"

	para "carries--but only"
	line "one of each item."
	done

_BargainShopFinalPriceText::
	text_ram wStringBuffer2
	text " costs"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text ". Want it?"
	done

_BargainShopThanksText::
	text "Thanks."
	done

_BargainShopPackFullText::
	text "Uh-oh, your PACK"
	line "is chock-full."
	done

_BargainShopSoldOutText::
	text "You bought that"
	line "already. I'm all"
	cont "sold out of it."
	done

_BargainShopNoFundsText::
	text "Uh-oh, you're"
	line "short on funds."
	done

_BargainShopComeAgainText::
	text "Come by again"
	line "sometime."
	done

_PharmacyIntroText::
	text "What's up? Need"
	line "some medicine?"
	done

_PharmacyHowManyText::
	text "How many?"
	done

_PharmacyFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(S)"
	line "will cost ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_PharmacyThanksText::
	text "Thanks much!"
	done

_PharmacyPackFullText::
	text "You don't have any"
	line "more space."
	done

_PharmacyNoMoneyText::
	text "Huh? That's not"
	line "enough money."
	done

_PharmacyComeAgainText::
	text "All right."
	line "See you around."
	done

_NothingToSellText::
	text "You don't have"
	line "anything to sell."
	prompt

_MartSellHowManyText::
	text "How many?"
	done

_MartSellPriceText::
	text "I can pay you"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."

	para "Is that OK?"
	done

_MartWelcomeText::
	text "Welcome! How may I"
	line "help you?"
	done

_MartThanksText::
	text "Here you are."
	line "Thank you!"
	done

_MartNoMoneyText::
	text "You don't have"
	line "enough money."
	done

_MartPackFullText::
	text "You can't carry"
	line "any more items."
	done

_MartCantBuyText::
	text "Sorry, I can't buy"
	line "that from you."
	prompt

_MartComeAgainText::
	text "Please come again!"
	done

_MartAskMoreText::
	text "Can I do anything"
	line "else for you?"
	done

_MartBoughtText::
	text "Got ¥@"
	text_decimal hMoneyTemp, 3, 6
	text " for"
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	done

_SlotsBetHowManyCoinsText::
	text "Bet how many"
	line "coins?"
	done

_SlotsStartText::
	text "Start!"
	done

_SlotsNotEnoughCoinsText::
	text "Not enough"
	line "coins."
	prompt

_SlotsRanOutOfCoinsText::
	text "Darn… Ran out of"
	line "coins…"
	done

_SlotsPlayAgainText::
	text "Play again?"
	done

_SlotsLinedUpText::
	text "lined up!"
	line "Won @"
	text_ram wStringBuffer2
	text " coins!"
	done

_SlotsDarnText::
	text "Darn!"
	done

_MobileStadiumEntryText::
	text "Data for use in"
	line "the MOBILE STADIUM"

	para "of the N64 #MON"
	line "STADIUM 2 can be"
	cont "read here."

	para "Read the data?"
	done

_MobileStadiumSuccessText::
	text "Data transfer is"
	line "complete."

	para "We hope you enjoy"
	line "MOBILE STADIUM"

	para "battles in the N64"
	line "#MON STADIUM 2."

	para ""
	done

_MainMenuTimeUnknownText::
	text "Clock time unknown"
	done

_DeleteSavedLoginPasswordText::
	text "Delete the saved"
	line "LOG-IN PASSWORD?"
	done

_DeletedTheLoginPasswordText::
	text "Deleted the LOG-IN"
	line "PASSWORD."
	done

_MobilePickThreeMonForBattleText::
	text "Pick three #MON"
	line "for battle."
	prompt

_MobileUseTheseThreeMonText::
	text_ram wMobileParticipant1Nickname
	text ","
	line "@"
	text_ram wMobileParticipant2Nickname
	text " and"
	cont "@"
	text_ram wMobileParticipant3Nickname
	text "."

	para "Use these three?"
	done

_MobileOnlyThreeMonMayEnterText::
	text "Only three #MON"
	line "may enter."
	prompt

_MobileCardFolderIntro1Text::
	text "The CARD FOLDER"
	line "stores your and"

	para "your friends'"
	line "CARDS."

	para "A CARD contains"
	line "information like"

	para "the person's name,"
	line "phone number and"
	cont "profile."

	para ""
	done

_MobileCardFolderIntro2Text::
	text "This is your CARD."

	para "Once you've"
	line "entered your phone"

	para "number, you can"
	line "trade CARDS with"
	cont "your friends."

	para ""
	done

_MobileCardFolderIntro3Text::
	text "If you have your"
	line "friend's CARD, you"

	para "can use it to make"
	line "a call from a"

	para "mobile phone on"
	line "the 2nd floor of a"
	cont "#MON CENTER."

	para ""
	done

_MobileCardFolderIntro4Text::
	text "To safely store"
	line "your collection of"

	para "CARDS, you must"
	line "set a PASSCODE for"
	cont "your CARD FOLDER."

	para ""
	done

_MobileCardFolderAskDeleteText::
	text "If the CARD FOLDER"
	line "is deleted, all"

	para "its CARDS and the"
	line "PASSCODE will also"
	cont "be deleted."

	para "Beware--a deleted"
	line "CARD FOLDER can't"
	cont "be restored."

	para "Want to delete"
	line "your CARD FOLDER?"
	done

_MobileCardFolderDeleteAreYouSureText::
	text "Are you sure you"
	line "want to delete it?"
	done

_MobileCardFolderDeletedText::
	text "The CARD FOLDER"
	line "has been deleted."

	para ""
	done

_MobileCardFolderAskOpenOldText::
	text "There is an older"
	line "CARD FOLDER from a"
	cont "previous journey."

	para "Do you want to"
	line "open it?"
	done

_MobileCardFolderAskDeleteOldText::
	text "Delete the old"
	line "CARD FOLDER?"
	done

_MobileCardFolderFinishRegisteringCardsText::
	text "Finish registering"
	line "CARDS?"
	done

_PhoneWrongNumberText::
	text "Huh? Sorry, wrong"
	line "number!"
	done

_PhoneClickText::
	text "Click!"
	done

_PhoneEllipseText::
	text "<……>"
	done

_PhoneOutOfAreaText::
	text "That number is out"
	line "of the area."
	done

_PhoneJustTalkToThemText::
	text "Just go talk to"
	line "that person!"
	done

_PhoneThankYouText::
	text "Thank you!"
	done

_SpaceSpaceColonText:: ; unreferenced
	text "  :"
	done

_PasswordAskResetText::
	text "Select CONTINUE &"
	line "reset settings."
	prompt

_PasswordWrongText::
	text "Wrong password!"
	prompt

_PasswordAskResetClockText::
	text "Reset the clock?"
	done

_PasswordAskEnterText::
	text "Please enter the"
	line "password."
	done

_ClearAllSaveDataText::
	text "Clear all save"
	line "data?"
	done

_LearnedMoveText::
	text_ram wMonOrItemNameBuffer
	text " learned"
	line "@"
	text_ram wStringBuffer2
	text "!@"
	sound_dex_fanfare_50_79
	text_promptbutton
	text_end

	text_end ; unreferenced

_MoveAskForgetText::
	text "Which move should"
	next "be forgotten?"
	done

_StopLearningMoveText::
	text "Stop learning"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_DidNotLearnMoveText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "did not learn"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

_AskForgetMoveText::
	text_ram wMonOrItemNameBuffer
	text " is"
	line "trying to learn"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "But @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "can't learn more"
	cont "than four moves."

	para "Delete an older"
	line "move to make room"
	cont "for @"
	text_ram wStringBuffer2
	text "?"
	done

Text_MoveForgetCount::
	text "1, 2 and…@"
	text_pause
	text_end

	text_end ; unreferenced

_MoveForgotText::
	text " Poof!@"
	text_pause
	text_start

	para "@"
	text_ram wMonOrItemNameBuffer
	text " forgot"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "And…"
	prompt

_MoveCantForgetHMText::
	text "HM moves can't be"
	line "forgotten now."
	prompt

_CardFlipPlayWithThreeCoinsText::
	text "Play with three"
	line "coins?"
	done

_CardFlipNotEnoughCoinsText::
	text "Not enough coins…"
	prompt

_CardFlipChooseACardText::
	text "Choose a card."
	done

_CardFlipPlaceYourBetText::
	text "Place your bet."
	done

_CardFlipPlayAgainText::
	text "Want to play"
	line "again?"
	done

_CardFlipShuffledText::
	text "The cards have"
	line "been shuffled."
	prompt

_CardFlipYeahText::
	text "Yeah!"
	done

_CardFlipDarnText::
	text "Darn…"
	done

_GearTodayText::
	text_today
	text_end

	text_end ; unreferenced

_GearEllipseText::
	text "<……>"
	done

_GearOutOfServiceText::
	text "You're out of the"
	line "service area."
	prompt

_PokegearAskWhoCallText::
	text "Whom do you want"
	line "to call?"
	done

_PokegearPressButtonText::
	text "Press A to select,"
	line "Press B to exit."
	done

_PokegearSelectPagerText::
	text "Page a #MON"
	line "to summon?"
	done

_PokegearAskDeleteText::
	text "Delete this stored"
	line "phone number?"
	done

_BuenaAskWhichPrizeText::
	text "Which prize would"
	line "you like?"
	done

_BuenaIsThatRightText::
	text_ram wStringBuffer1
	text "?"
	line "Is that right?"
	done

_BuenaHereYouGoText::
	text "Here you go!"

	para ""
	done

_BuenaNotEnoughPointsText::
	text "You don't have"
	line "enough points."

	para ""
	done

_BuenaNoRoomText::
	text "You have no room"
	line "for it."

	para ""
	done

_BuenaComeAgainText::
	text "Oh. Please come"
	line "back again!"
	done

_BTExcuseMeText::
	text "Excuse me!"

	para ""
	done

_ExcuseMeYoureNotReadyText::
	text "Excuse me."
	line "You're not ready."

	para ""
	done

_BattleTowerReturnWhenReadyText::
	text "Please return when"
	line "you're ready."
	done

_NeedAtLeastThreeMonText::
	text "You need at least"
	line "three #MON."

	para ""
	done

_EggDoesNotQualifyText::
	text "Sorry, an EGG"
	line "doesn't qualify."

	para ""
	done

_OnlyThreeMonMayBeEnteredText::
	text "Only three #MON"
	line "may be entered."

	para ""
	done

_TheMonMustAllBeDifferentKindsText::
	text "The @"
	text_ram wStringBuffer2
	text " #MON"
	line "must all be"
	cont "different kinds."

	para ""
	done

_TheMonMustNotHoldTheSameItemsText::
	text "The @"
	text_ram wStringBuffer2
	text " #MON"
	line "must not hold the"
	cont "same items."

	para ""
	done

_YouCantTakeAnEggText::
	text "You can't take an"
	line "EGG!"

	para ""
	done

_BallDodgedText::
	text "It dodged the"
	line "thrown BALL!"

	para "This #MON"
	line "can't be caught!"
	prompt

_BallMissedText::
	text "You missed the"
	line "#MON!"
	prompt

_BallBrokeFreeText::
	text "Oh no! The #MON"
	line "broke free!"
	prompt

_BallAppearedCaughtText::
	text "Aww! It appeared"
	line "to be caught!"
	prompt

_BallAlmostHadItText::
	text "Aargh!"
	line "Almost had it!"
	prompt

_BallSoCloseText::
	text "Shoot! It was so"
	line "close too!"
	prompt

Text_BallCaught::
	text "Gotcha! @"
	text_ram wEnemyMonNickname
	text_start
	line "was caught!@"
	sound_caught_mon
	text_end

	text_end ; unreferenced

_WaitButtonText::
	text_promptbutton
	text_end

	text_end ; unreferenced

_BallSentToPCText::
	text_ram wMonOrItemNameBuffer
	text " was"
	line "sent to @"
	text_ram wStringBuffer1
	text "."
	prompt

_NewDexDataText::
	text_ram wEnemyMonNickname
	text "'s data"
	line "was newly added to"
	cont "the #DEX.@"
	sound_slot_machine_start
	text_promptbutton
	text_end

	text_end ; unreferenced

_AskGiveNicknameText::
	text "Give a nickname to"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

_ItemStatRoseText::
	text_ram wStringBuffer1
	text "'s"
	line "@"
	text_ram wStringBuffer2
	text " rose."
	prompt

_ItemCantUseOnMonText::
	text "That can't be used"
	line "on this #MON."
	prompt

_RepelUsedEarlierIsStillInEffectText::
	text "The REPEL used"
	line "earlier is still"
	cont "in effect."
	prompt

_PlayedFluteText::
	text "Played the #"
	line "FLUTE."

	para "Now, that's a"
	line "catchy tune!"
	prompt

_FluteWakeUpText::
	text "All sleeping"
	line "#MON woke up."
	prompt

Text_PlayedPokeFlute::
	text "<PLAYER> played the"
	line "# FLUTE.@"
	text_promptbutton
	text_end

	text_end ; unreferenced

_BlueCardBalanceText::
	text "You now have"
	line "@"
	text_decimal wBlueCardBalance, 1, 2
	text " points."
	done

_CoinCaseCountText::
	text "Coins:"
	line "@"
	text_decimal wCoins, 2, 4
	text_end

	text_end ; unreferenced

_RaiseThePPOfWhichMoveText::
	text "Raise the PP of"
	line "which move?"
	done

_RestoreThePPOfWhichMoveText::
	text "Restore the PP of"
	line "which move?"
	done

_PPIsMaxedOutText::
	text_ram wStringBuffer2
	text "'s PP"
	line "is maxed out."
	prompt

_PPsIncreasedText::
	text_ram wStringBuffer2
	text "'s PP"
	line "increased."
	prompt

_PPRestoredText::
	text "PP was restored."
	prompt

_SentTrophyHomeText::
	text "There was a trophy"
	line "inside!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " sent the"
	line "trophy home."
	prompt

_ItemLooksBitterText::
	text "It looks bitter…"
	prompt

_ItemCantUseOnEggText::
	text "That can't be used"
	line "on an EGG."
	prompt

_ItemOakWarningText::
	text "OAK: <PLAYER>!"
	line "This isn't the"
	cont "time to use that!"
	prompt

_ItemBelongsToSomeoneElseText::
	text "That belongs to"
	line "someone else!"
	prompt

_ItemWontHaveEffectText::
	text "It won't have any"
	line "effect."
	prompt

_BallBlockedText::
	text "The trainer"
	line "blocked the BALL!"
	prompt

_BallDontBeAThiefText::
	text "Don't be a thief!"
	prompt

_NoCyclingText::
	text "Cycling isn't"
	line "allowed here."
	prompt

_ItemCantGetOnText::
	text "Can't get on your"
	line "@"
	text_ram wStringBuffer1
	text " now."
	prompt

_CurBoxFullText::
	text "@"
	text_ram wStringBuffer1
	text " is full."
	prompt

_StorageFullText::
	text "The STORAGE SYSTEM"
	line "is full. That"
	cont "can't be used now."
	prompt

_DatabaseFullText::
	; too technical? needs improvement
	text "The STORAGE SYSTEM"
	line "is overtaxed."

	para "You need to save"
	line "the game."
	prompt

_ItemUsedText::
	text "<PLAYER> used the@"
	text_low
	text_ram wStringBuffer2
	text "."
	done

_ItemGotOnText::
	text "<PLAYER> got on the@"
	text_low
	text_ram wStringBuffer2
	text "."
	prompt

_ItemGotOffText::
	text "<PLAYER> got off@"
	text_low
	text "the @"
	text_ram wStringBuffer2
	text "."
	prompt

_KnowsMoveText::
	text_ram wStringBuffer1
	text " knows"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_MoveKnowsOneText::
	text "That #MON knows"
	line "only one move."
	done

_AskDeleteMoveText::
	text "Oh, make it forget"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

_DeleterForgotMoveText::
	text "Done! Your #MON"
	line "forgot the move."
	done

_DeleterEggText::
	text "An EGG doesn't"
	line "know any moves!"
	done

_DeleterNoComeAgainText::
	text "No? Come visit me"
	line "again."
	done

_DeleterAskWhichMoveText::
	text "Which move should"
	line "it forget, then?"
	prompt

_DeleterIntroText::
	text "Um… Oh, yes, I'm"
	line "the MOVE DELETER."

	para "I can make #MON"
	line "forget moves."

	para "Shall I make a"
	line "#MON forget?"
	done

_DeleterAskWhichMonText::
	text "Which #MON?"
	prompt

_DSTIsThatOKText::
	text " DST,"
	line "is that OK?"
	done

_TimeAskOkayText::
	text ","
	line "is that OK?"
	done

_TimesetAskDSTText::
	text "Do you want to"
	line "switch to Daylight"
	cont "Saving Time?"
	done

_TimesetDSTText::
	text "I set the clock"
	line "forward by one"
	cont "hour."
	prompt

_TimesetAskNotDSTText::
	text "Is Daylight Saving"
	line "Time over?"
	done

_TimesetNotDSTText::
	text "I put the clock"
	line "back one hour."
	prompt

_TimesetAskAdjustDSTText::
	text "Do you want to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time?"
	done

_MomLostGearBookletText::
	text "I lost the in-"
	line "struction booklet"
	cont "for the #GEAR."

	para "Come back again in"
	line "a while."
	prompt
