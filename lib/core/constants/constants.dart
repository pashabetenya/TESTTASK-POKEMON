import 'package:flutter/material.dart';

// INTERFACE PALLET.
const kMainBlue = Color(0xFF072AC8);
const kBrightYellow = Color(0xFFFDD85D);

const kOrange = Color(0xFFFF844F);
const kPinkyRed = Color(0xFFF14B3D);

const kGreen = Color(0xFF60D394);
const kLightGrey = Color(0xFFF8F9FA);

const kReallyGrey = Color(0xFF595F65);
const kPurple = Color(0xFF8B00FF);

const kPink = Color(0xFFFFC0CB);

// POKEMON PALLET.
const kBug = Color.fromARGB(255, 198, 209, 110);
const kDark = Color.fromARGB(255, 162, 146, 136);

const kDragon = Color.fromARGB(255, 162, 125, 250);
const kElectric = Color.fromARGB(255, 250, 224, 120);

const kFairy = Color.fromARGB(255, 244, 189, 201);
const kFighting = Color.fromARGB(255, 214, 120, 115);

const kFire = Color.fromARGB(255, 245, 172, 120);
const kFlying = Color.fromARGB(255, 198, 183, 245);

const kGhost = Color.fromARGB(255, 162, 146, 188);
const kGrass = Color.fromARGB(255, 167, 219, 141);

const kGround = Color.fromARGB(255, 235, 214, 157);
const kIce = Color.fromARGB(255, 188, 230, 230);

const kNormal = Color.fromARGB(255, 198, 198, 167);
const kPoison = Color.fromARGB(255, 193, 131, 193);

const kPsychic = Color.fromARGB(255, 250, 146, 178);
const kRock = Color.fromARGB(255, 209, 193, 125);

const kSteel = Color.fromARGB(255, 209, 209, 224);
const kWater = Color.fromARGB(255, 157, 183, 245);

// COLOR ITEM.
Color colorItem(String type) {
  try {
    switch (type) {
      case 'Bug':
        return kBug;
      case 'Dark':
        return kDark;
      case 'Dragon':
        return kDragon;
      case 'Electric':
        return kElectric;
      case 'Fairy':
        return kFairy;
      case 'Fighting':
        return kFairy;
      case 'Fire':
        return kFairy;
      case 'Flying':
        return kFlying;
      case 'Ghost':
        return kGhost;
      case 'Grass':
        return kGrass;
      case 'Ground':
        return kGround;
      case 'Ice':
        return kIce;
      case 'Normal':
        return kNormal;
      case 'Poison':
        return kPoison;
      case 'Psychic':
        return kPsychic;
      case 'Rock':
        return kRock;
      case 'Steel':
        return kSteel;
      case 'Water':
        return kWater;
      default:
        return kReallyGrey;
    }
  } catch (e) {
    return kReallyGrey;
  }
}

// FORMAT ID.
String formatID(int id) {
  if (id < 10) {
    return '#00$id';
  } else if (id < 100) {
    return '#0$id';
  } else {
    return '#$id';
  }
}
