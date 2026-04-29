BeverlyPhoneCalleeScript: ; You call
	gettrainername STRING_BUFFER_3, POKEFANF, BEVERLY
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftrue BeverlyNuggetReminder
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_BEVERLY_GAVE_NUGGET
	iftrue .Generic
	farscall PhoneScript_Random4 ; 20% chance when you call them
	ifequal 0, BeverlyFoundNugget
	setflag ENGINE_BEVERLY_GAVE_NUGGET
.Generic
	farsjump BeverlyHangUpScript

BeverlyNuggetReminder:
	getlandmarkname STRING_BUFFER_5, LANDMARK_NATIONAL_PARK
	farsjump BeverlyComePickUpScript

BeverlyPhoneCallerScript: ; Calls you
	gettrainername STRING_BUFFER_3, POKEFANF, BEVERLY
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftrue BeverlyNuggetReminder
	farscall PhoneScript_Random4 ; 20% chance when they call you
	ifequal 0, BeverlyFoundNugget
	farsjump Phone_GenericCall_Female

BeverlyFoundNugget:
	setflag ENGINE_BEVERLY_HAS_NUGGET
	getlandmarkname STRING_BUFFER_5, LANDMARK_NATIONAL_PARK
	farsjump PhoneScript_FoundItem_Female
