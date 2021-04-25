class Question {
  final int id;
  final String question;
  final int answer;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}

const List questionList = [
  {
    "id": 1,
    "category": "Entertainment: Video Games",
    "type": "multiple",
    "difficulty": "medium",
    "question":
        "Which was the first video game to be produced by development company Rare?",
    "correct_answer": 1,
    "options": ["R.C. Pro-Am", "Slalom", "Donkey Kong Country", "Battletoads"]
  },
  {
    "id": 2,
    "category": "Entertainment: Video Games",
    "type": "multiple",
    "difficulty": "medium",
    "question":
        "In Left 4 Dead, what is the name of the virus, as designated by CEDA, that causes most humans to turn into the Infected?",
    "correct_answer": 3,
    "options": ["Yellow Fever", "T-Virus", "Raspberry Sniffles", "Green Flu"]
  },
  {
    "id": 3,
    "category": "Entertainment: Video Games",
    "type": "multiple",
    "difficulty": "medium",
    "question":
        "Which of these is NOT a playable character race in the video game &quot;Starbound&quot;?",
    "correct_answer": 0,
    "options": ["Fenerox", "Floran", "Novakid", "Hylotl"]
  },
  {
    "id": 4,
    "category": "Entertainment: Video Games",
    "type": "multiple",
    "difficulty": "medium",
    "question":
        "What is the first primary weapon the player gets in &quot;PAYDAY: The Heist&quot;?",
    "correct_answer": 2,
    "options": ["Brenner 21", "Reinbeck", "AMCAR-4", "M308"]
  },
  {
    "id": 5,
    "category": "Entertainment: Video Games",
    "type": "multiple",
    "difficulty": "medium",
    "question":
        "In Terraria, what does the Wall of Flesh not drop upon defeat?",
    "correct_answer": 0,
    "options": ["Picksaw", "Pwnhammer", "Breaker Blade", "Laser Rifle"]
  },
  {
    "id": 6,
    "category": "Entertainment: Video Games",
    "type": "multiple",
    "difficulty": "medium",
    "question":
        "On the 6th of June 2006, what was the name of the infamous glitch that occurred in the MMO RuneScape?",
    "correct_answer": 3,
    "options": [
      "Noclip glitch",
      "Party-hat Duplication Glitch",
      "TzHaar Massacre",
      "The Falador Massacre"
    ]
  },
  {
    "id": 7,
    "category": "Entertainment: Video Games",
    "type": "multiple",
    "difficulty": "medium",
    "question":
        "In Terraria, which of these items is NOT crafted at a Mythril Anvil?",
    "correct_answer": 1,
    "options": ["Venom Staff", "Ankh Charm", "Sky Fracture", "Orichalcum Tools"]
  },
  {
    "id": 8,
    "category": "Entertainment: Video Games",
    "type": "multiple",
    "difficulty": "medium",
    "question":
        "Which of these is not a DLC vehicle in &quot;Mario Kart 8&quot;?",
    "correct_answer": 0,
    "options": ["Wild Wiggler", "Bone Rattler", "B Dasher", "300 SL Roadster"]
  },
  {
    "id": 9,
    "category": "Entertainment: Video Games",
    "type": "multiple",
    "difficulty": "medium",
    "question":
        "Which pop singer was brought in by SEGA to produce the music for &quot;Sonic the Hedgehog 3&quot;?",
    "correct_answer": 1,
    "options": ["Prince", "Michael Jackson", "George Michael", "Vanilla Ice "]
  },
  {
    "id": 10,
    "category": "Entertainment: Video Games",
    "type": "multiple",
    "difficulty": "medium",
    "question": "Which city hosted the CS:GO Dreamhack Open 2015?",
    "correct_answer": 3,
    "options": ["Cologne", "Atlanta", "London", "Cluj-Napoca"]
  }
];
