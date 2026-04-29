TiffanyPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, PICNICKER, TIFFANY3
	checkflag ENGINE_TIFFANY_HAS_POKE_DOLL
	iftrue TiffanyPokeDollReminder
	checkflag ENGINE_TIFFANY_READY_FOR_REMATCH
	iftrue TiffanyBattleReminder
	farscall PhoneScript_AnswerPhone_Female
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, .NotTuesday
	checktime DAY
	iftrue TiffanyWantsBattle
	checktime EVE
	iftrue TiffanyWantsBattle

.NotTuesday:
	checkflag ENGINE_TIFFANY_GAVE_POKE_DOLL
	iftrue .skipPokeDoll
	farscall PhoneScript_Random2 ; 33% chance when you call them
	ifequal 0, TiffanyHasPokeDoll
.skipPokeDoll
	farsjump TiffanyNoItemScript

TiffanyBattleReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_43
	farsjump TiffanyReminderScript

TiffanyPokeDollReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_43
	farsjump TiffanyHurryScript

TiffanyPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, PICNICKER, TIFFANY3
	checkflag ENGINE_TIFFANY_HAS_POKE_DOLL
	iftrue TiffanyPokeDollReminder
	checkflag ENGINE_TIFFANY_READY_FOR_REMATCH
	iftrue TiffanyBattleReminder
	farscall PhoneScript_Random4
	ifequal 0, TiffanysFamilyMembers
	farscall PhoneScript_GreetPhone_Female
	farscall PhoneScript_Random2 ; 33% chance when they call you
	ifequal 0, TiffanyHasPokeDoll
	setflag ENGINE_TIFFANY_GAVE_POKE_DOLL
	farscall PhoneScript_Random2
	ifequal 0, TiffanyWantsBattle ; 33% chance for a rematch
	farsjump Phone_GenericCall_Female

TiffanyWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_43
	setflag ENGINE_TIFFANY_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Female

TiffanysFamilyMembers:
	random 6
	ifequal 0, .Grandma
	ifequal 1, .Grandpa
	ifequal 2, .Mom
	ifequal 3, .Dad
	ifequal 4, .Sister
	ifequal 5, .Brother

.Grandma:
	getstring STRING_BUFFER_4, GrandmaString
	sjump .PoorClefairy

.Grandpa:
	getstring STRING_BUFFER_4, GrandpaString
	sjump .PoorClefairy

.Mom:
	getstring STRING_BUFFER_4, MomString
	sjump .PoorClefairy

.Dad:
	getstring STRING_BUFFER_4, DadString
	sjump .PoorClefairy

.Sister:
	getstring STRING_BUFFER_4, SisterString
	sjump .PoorClefairy

.Brother:
	getstring STRING_BUFFER_4, BrotherString
	sjump .PoorClefairy

.PoorClefairy:
	farsjump TiffanyItsAwful

TiffanyHasPokeDoll:
	setflag ENGINE_TIFFANY_HAS_POKE_DOLL
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_43
	farsjump PhoneScript_FoundItem_Female
