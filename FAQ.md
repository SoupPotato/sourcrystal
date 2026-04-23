
# FAQ

If you have a question about playing SourCrystal, or think you've found a bug, please read this FAQ first.

If there is something here that is not answered in the FAQ or need furthur assistance, feel free to join the [Discord Server](https://discord.gg/edctS3hHfQ)
### Contents

* [Which emulator should I use?](#which-emulator-should-i-use)
* [Are there cheat codes?](#are-there-cheat-codes)
* [Is there documentation for all the {Pokémon, items, moves, etc}?](#is-there-documentation-for-all-the-pokémon-items-moves-etc)
* [What are the options at the start of a new game?](#what-are-the-options-at-the-start-of-a-new-game)
* [How can I change the current time?](#how-can-i-change-the-current-time)
* [How do I evolve my Pokémon?](#how-do-i-evolve-my-pokémon)
* [Where do I get the legendary Pokémon?](#where-do-i-get-the-legendary-pokémon)
* [Where do I get this item?](#where-do-i-get-this-item)
* [Why does the game need "save tagging"?](#what-is-the-save-tagging-system-and-why-does-this-game-need-it)
* ["This save file is from a NEWER version..."](#this-save-file-is-from-a-newer-version-of-the-game)
* ["This save file is from an OLDER version..."](#this-save-file-is-from-an-older-version-of-the-game)



### Which emulator should I use?

Not every emulator is compatible with SourCrystal. With the exception of the Virtual Console emulator, we do not offer any support if an emulator has a bug that isn't reproducible on official hardware. As such, we recommend the following emulators to limit compatibility issues:

#### PC:
* [mGBA](https://mgba.io/) - most popular emulator, no known incompatiblities, can also conveniently play GBA games
* [SameBoy](https://sameboy.github.io/) - one of the most accurate emulators, also has an iOS release
* [BGB](https://bgb.bircd.org/) - more accurate than mGBA, powerful debugger

#### Android:
* [RetroArch](https://www.retroarch.com/) - use SameBoy, mGBA or Gambatte core, **do not use VBA-M core**

#### iOS:
* [SameBoy](https://sameboy.github.io/) - see PC section

Conversely, the following emulators are known to have issues and **should not be used** to play SourCrystal:

#### PC:
* VBA - this emulator has not been updated since 2004, do not ever use
* VBA-M - despite being actively updated, still is a very inaccurate emulator, use mGBA instead

#### iOS:
* Delta - while we have had a higher incidence rate of issues with Delta, there is presently no evidence that the emulator itself has any issues. We do still strongly recommend using SameBoy on iOS, as we still are awaiting evidence of any unusual issues with this emulator and save states

#### Android:
* MyOldBoy - while most of the game is playable, it is incompatible with the Real-Time Clock in SourCrystal.
* JohnGBC - is confirmed to cause rendering issues and possibly more.

#### Other:
* Goomba Color - used to play GB/C games from a GBA flashcart, this emulator can't even run vanilla Crystal

If you have a preferred emulator that isn't listed above, using it should be fine. Most modern emulators can indeed run SourCrystal just fine. Be aware, though, that if you're consistently having an issue that isn't reproduced on either official hardware or the most accurate emulators, you will not be provided any support.


### Are there cheat codes?

Cheat codes are *not* officially supported: new updates may change or break old codes, which can lead to irreversible save corruption. There is instead [**Sour Editor**](https://soureditor.vercel.app/), an **unofficial** online save editor for *Pokémon SourCrystal*, created and maintained by [Rev3lation (@rev3lation)](https://github.com/KohKaiSern).

If you decide to use cheat codes anyway, note that cheat codes are easily misused - as such, **please disable cheats before complaining that there's a bug in the game, and don't ask for pre-made cheat codes**.


### Is there documentation for all the {Pokémon, items, moves, etc}?


Yes, there is a [Document](https://docs.google.com/spreadsheets/d/1LXVkFYS97_iKz9ntWZ8rsM1BQtRuorREHABNVLRwJ3M/edit?gid=78535282#gid=78535282) that labels all pokemon information and well as items, move tutors, mon locations and more.


### How can I change the current time?

Press Down+B at the title screen (the screen of the running Suicune) to reset the clock.


### How do I evolve my Pokémon?

* Gen 1's trade evolutions now evolve by using the Linking Cord item.
* Item trade evolutions (like Seadra into Kingdra while holding a Dragon Scale) now evolve when simply 'using' the item on them.


### Where do I get the legendary Pokémon?

* Articuno is in the Seafoam Islands.
* Zapdos is outside of the Kanto Powder Plant.
* Moltres is inside Mt.Silver.
* Raikou and Entei are roaming Johto after you awaken them.
* Suicune is in the Tin Tower after you get the Clear Bell.
* Lugia is in the Whirl Islands after you visit Pewter City and then get the Silver Wing there.
* Ho-Oh is atop the Tin Tower after you catch all three legendary beasts and then get the Rainbow Wing in Tin Tower.
* Mewtwo is in Cerulean Cave.
* Mew is a secret; look around Cinnabar Island!
* Celebi is obtainved via the GS Ball event that is now triggered once you defeat the Elite Four.


### Where do I get this item?

* Exp Share is given by Baoba on Route 39.
* Linking Cord is obtained in Dark Cave (Blachtorn Side). Additionally can be purchased at the game corner.
* Lucky Egg is given by Mr.Pokemon in exchange for the Red Scale. A second one can be found in the Kanto Safari Zone.
* Helix Fossil and Dome Fossil are in Mt. Mortar. The one you do not pick can be obtained at Mt. Moon later on.
* Old Amber is in Pewter City Museum.
* Upgrade is given to you in Silph Co. after fixing the Power Plant generator. Additionally can be purchased at the game corner.
* King's Rock is in Slowpoke Well, or held by wild Slowpoke or Poliwhirl. Additionally can be purchased at the game corner.
* Metal Coat obtained on the SS.Aqua or held by wild Magnemite. Additionally can be purchased at the game corner.
* Dragon Scale is in Mt. Mortar, or held by wild Horsea family and Dratini family. Additionally can be purchased at the game corner.
* Fire, Water, Leaf and Thunder Stones can be obtained from Bill's grandpa in Kanto or can be purchased at the game corner. Also, certain trainers will call you up to give you stones, just like in regular Crystal.

### What is the "save tagging" system, and why does this game need it?

The save tagging system was built to better handle save incompatibilities,
should an update to the game introduce breaking changes that would otherwise
require you to restart your game.

How it works is that the game will compare a specific number—the *save version*—in
your save file with the *save version* registered in the game's code. This number,
of course, increasing whenever we introduce a save-breaking change.

Please note however, that updates to **game version** does not necessarily mean
an update to the **save version**. If an update to the **save version** occurs,
it will be noted in the change logs, and as an entry in the **[save versions list](SAVE-VERSIONS.md)**.

If the number in your save file is **one less** than the number in the game's
code, *the game itself can automatically update your save*. After it has
updated your save file, the game will immediately **re-save** the game, so no
additional action is needed from you.

This means that if a recent version of the game has save version 03, **you cannot,
for example, update a game from save version 01 straight to it**. You would need
to load the save file in a prior version with save version 02, and *then* load
the save file in the more recent version.

However, it is possible for external tools to directly update your save file in
such a manner. Though as of writing, such tools are yet to be made.

### "This save file is from a NEWER version of the game…"

One of the following might have happened:

1. **You updated from before v6.2.** This can happen in some emulators. If that
   is the case, you can force the game to load your save file by **pressing right as you select CONTINUE**.

2. **You accidentally loaded in a save from a future version.** Unfortunately,
   it is best you play the game using the newer version anyway to avoid any
   save corruption.

### "This save file is from an OLDER version of the game…"

The game's automated save-updating system can't handle skipping versions. As
explained, you should, in order:

1. Find a slightly older patch.
2. Load the save file using that version.
3. Update the game.
4. Reload the save file using the newer version.
