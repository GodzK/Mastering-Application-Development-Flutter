### Flutter
ถ้าเขียนflutterจะถูกcomplieให้เป็นnative code เเสดงว่า flutter จะเป็น frameworkที่เร็ว เเละมันยังรองรับ editorที่หลากหลาย 
## Hot Reload 
ไม่ต้องcompileใหม่หลังเเก้
## Hot Restart
กลับไป ณ จุดเเรกเริ่มได้
## UI as a Canvas
เขียนอะไรก็ได้ เอาของคนอื่นมาใช้ก้ได้

## What should we focus ??
1. Material 
2. Painting
3. Animation
4. Widgets
5. Cupertino

## Flow in phone
1. user กดที่screen => OS =>FLUTTER(ใช้logic ด้วยcode dart)

## Tools
1. SDK = kitพื้นฐานที่จะใช้จะมี
    1.1 flutter sdk
    1.2 ios Xcode  [IOS]
    1.3 Android SDK [Android]
2. IDE = Android Studio / VS Code(Microsoft) / Dartpad / Flutter Plugin

C:\Users\pk\Downloads\flutter_windows_3.32.4-stable\flutter\bin\cache\dart-sdk

เวลาเรากด run มันจะเป็นการassembleDebugคือจะbuildเป็น apk เพื่อไปติดตั้งที่มือถือ

## Widget
ทุกองค์ประกอบคือ Widget

## State
# implicit State
มี Stateเป็นของตัวเอง
# Mutable State
สามารถเปลี่ยนเเปลง Stateได้ผ่าน setState
# Support Caching
้ถ้า State ไม่เปลี่ยน = ไม่ Rebuild


### Interaction
## Event
มันจะมีbuild in ของ button คือ onclickต่างๆนาๆ
# GestureDetector
เเต่ถ้าอยากadvance มันจะเรียกว่า GestureDetector มัน detectทั้ง tap secondary tap(คลิ๊กขวา),หรือthumbmouseใน web
# Draggable
ใช้งานเเบบ 
1.  set child เเรกไว้ก่อน ว่าก่อนโดนลาก
2.  ระหว่างลาก
# InteractiveViewer
Zoom = Pinch ในเรื่องนี้
ex. ถ้าเราเอารูปมาใส่ในนี้เราก็สามารถ pinchมันได้


### Asset 
# Font 
ถ้าเราจะใช้ เราเอาไปใส่ใน pubspec
ระบุใน theme : ThemeData(fontFamily : 'Raleway'), เเต่ถ้าอยาดจะ overite ก็ใส่ใน Text()ได้
## Theming  (Design System)
1. Material = theme base on material design on android 
    1.1 Material 3 รุ่นใหม่ ใช้ user preference 
2. Cupertino = IOS desing base

Step
1. Create Material app
2. Create themeData
3. use Theme in Widget
สรุป ทั้งสองappนี้มีโครงสร้างเหมือนกัน เเค่ชื่อต่างกัน เเต่เเม่งเหมือนกันเเหละ

## Navigator
1.0 and 2.0 in flutter
android ไม่ได้มี navเหมือนios  : ios มันจะpushจากขวามาทับซ้าย เเต่android มันจะมาจากข้างล่าง
modal ไม่เเตกต่างกันทั้งคู่
1. Navigate fullscreen = replace ทั้งscreen 
2. Modal[popup] = บังหน้าเก่าบางส่วน

# How to generate stateful widget
stful
and import on top import 'package:flutter/material.dart';
ให้ return Scaffold อย่างเเรกก็เอา App bar มาใส่
onpress หรืออะไรต่างๆเนี่ย เราต้องใส่functionให้มันด้วย ไม่งั้นมันจะเอ๋อ 
ex func onPressed: (){},

### pub & third party
มันคือ library ของ flutter
## Flutter Modular
1. make routing 2.0 easier
2. conceptคือมันจะมากองrouteไว้ที่modularเเละเราก็สามารถเลือกได้เลย ฟีลเเบบ route.js

json_annotation latest , ( Dev dependency = ใช้เพื่อพัฒนา ไม่ถูกใช้ในapplication build_runner , json_serializable)
# Google Fonts (3rd party plugin)
ไม่ต้องโหลด fontเพิ่ม ใส่ในassets(ต้องมีinternet ไม่งั้นก็โหลดเหมือนเดิม)
1. พิม flutter pub add google_fonts
2. เเก้ไขในthemeเพื่อความconsistency
EX. theme: ThemeData(
   primarySwatch: Colors.pink,
   textTheme: GoogleFonts.latoTextTheme() ,
# SQFLite(ฟไลท์นะ)
สำหรับเก็บข้อมูลเเบบ local บางcaseไม่ต้องมี backend เเค่เก็บบนเครื่อง
1. flutter pub add sqflite
2. flutter pub add path
ex. import 'package:sqflite/sqflite.dart';
   import 'package:path/path.dart';