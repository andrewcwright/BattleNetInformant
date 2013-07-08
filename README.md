# BattleNetInformant

This is a project for the Nashville Software School. My objective is to create a Ruby on Rails application to query battle.net for information. The application will use this information to analyze player statistics and use them to compare the relative power of each character.

## Table of contents

1. [Purpose](#purpose)
2. [Project Status](#project-status)
3. [Todo List](#todo-list)
4. [Features](#features)
5. [Usage](#usage)

[Acknowledgements](#acknowledgements)

[License](#license)


<a name="purpose"></a>
## 1. Purpose

Battle.net is a server used by Blizzard Entertainment to host video games and provide information about the players. This application is designed to access the Battle.net API and store/display that information. The user will be able to login and store their characters in a database. The user can then click a versus link to compare their character to any other character in the game. The user can also track the progress of their characters throughout the game.

<a name="project-status"></a>
## 2. Project Status

Implemented all of the initial functionality.

<a name="todo-list"></a>
## 3. Todo List

* Add styling
* Add error prevention/recovery
* Improve interface

<a name="Features"></a>
## 4. Features
* Lookup a character on any server and print some information to the screen
* Check progress on any raid for that character
* Store that information in a database
* Each time you store the information, BNI will alert you to any new progress since the last time you stored the progression

<a name="Usage"></a>
## 5. Usage

* Create and account
* Login using your email and password
* Enter your characters

  Here are some example characters:

  Name: andose, Realm: kelthuzad

  Name: taylorswift, Realm: tichondrius

  Name: jahmillztko, Realm: tichondrius

* You can click on each character to get a dropdown of their stats
* You can now click the versus link for each character to go to a new page

  Here you can enter information for another character to compare them to the selected character

* You can click the progression link for each character to go to a new page

  This page allows you to enter different areas of the game, and shows you how many bosses in each area you have killed for all three difficulty levels

  Here are some example dungeons:

  Throne of Thunder

  Dragon Soul

  Terrace of Endless Spring

<a name="license"></a>
## License

Copyright (c) 2013 Andrew Wright

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.