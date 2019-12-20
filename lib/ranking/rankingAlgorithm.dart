class RankingAlgorithm {

  List allItems = [
    {
      'name': 'Talk 1',
      'title': 'SmaCC',
      'speaker': 'Jason Lecerf',
      'abstract': 'SmaCC (Smalltalk Compiler-Compiler) is a freely available parser generator for Smalltalk. It generates LR parsers and is a replacement for the T-Gen parser generator. SmaCC overcomes many of T-Gen’s limitations that make it difficult to produce parsers. SmaCC can generate parsers for ambiguous grammars and grammars with overlapping tokens. ',
      'type': 'Talk',
      'category': 4,
      'date': '17/11/2019',
      'start_hour': '09:00',
      'end_hour': '11:15',
      'rank': '0',
      'selected': false
    },
    {
      'name': 'Talk 2',
      'title': 'PetitParser',
      'speaker': 'Andrei Chiş',
      'abstract': 'PetitParser combines ideas from scannerless parsing, parser combinators, parsing expression grammars and packrat parsers to model grammars and parsers as objects that can be reconfigured dynamically. ',
      'type': 'Short-paper',
      'category': 1,
      'date': '17/11/2019',
      'start_hour': '12:15',
      'end_hour': '14:30',
      'rank': '0',
      'selected': false
    },
    {
      'name': 'Talk 3',
      'title': 'Language Engineering with Rascal',
      'speaker': 'Tijs van der Storm',
      'abstract': 'Software Language Engineering (SLE) is concerned with the principled techniques and concepts for the construction of software languages. In this tutorial we will explore how the Rascal metaprogramming environment and language workbench addresses aspects of implementing software languages. We will work on a simple DSL for defining questionnaires, called QL, touching upon syntax definition, static analysis, transformation, language extension, and code generation. ',
      'type': 'Talk',
      'category': 7,
      'date': '17/11/2019',
      'start_hour': '16:30',
      'end_hour': '18:00',
      'rank': '0',
      'selected': false
    },
    {
      'name': 'Talk 4',
      'title': 'Orchestrated Crowdsourced Testing of a Mobile Web Application',
      'speaker': 'Maurizio Leotta',
      'abstract': 'Responsive mobile web applications are quite challenging to test, especially if they require heavy interaction with the environment (e.g., through GPS-based location tracking and camera-based QR code acquisition and recognition) and among different users, as in the case of collaborative games support, where the app needs to support the real-time interaction of a large number of users. In this paper, we propose a case study of orchestrated crowdsourced testing of such a mobile web app, as an approach to face such challenges. ',
      'type': 'Poster',
      'category': 6,
      'date': '18/11/2019',
      'start_hour': '08:30',
      'end_hour': '09:00',
      'rank': '0',
      'selected': false
    },
    {
      'name': 'Talk 5',
      'title': 'A framework for big-step semantics',
      'speaker': 'Francesco Dagnino',
      'abstract': 'No abstract. ',
      'type': 'Tutorial',
      'category': 2,
      'date': '18/11/2019',
      'start_hour': '09:00',
      'end_hour': '11:00',
      'rank': '0',
      'selected': false
    },
    {
      'name': 'Talk 6',
      'title': 'Quickref: Auto-Documenting the Common Lisp Ecosystem',
      'speaker': 'Didier Verna',
      'abstract': 'This demonstration is intended for people interested in software documentation, and more specifically, in what can be achieved with a reflexive language, fully equipped for introspection. Quickref is a global documentation project for the Common Lisp Ecosystem. In a single function call, it builds an entire website containing reference manuals for almost two thousand Common Lisp libraries. The system is unintrusive: library authors do not have anything to do to make their code “Quickref aware”. A public website is maintained with the resulting full documentation, but individuals can also use Quickref to generate a local website, documenting only what is present on their machine. ',
      'type': 'Research paper',
      'category': 1,
      'date': '18/11/2019',
      'start_hour': '14:00',
      'end_hour': '17:15',
      'rank': '0',
      'selected': false
    },
    {
      'name': 'Talk 7',
      'title': 'Proving Inequational Propositions about Haskell Programs in Coq',
      'speaker': 'Jan Christiansen and Sandra Dylus',
      'abstract': 'To prove properties about a Haskell function in Coq, we have to translate the Haskell function to Coq. Proofs about Haskell func- tions are performed in various levels of detail. For example, some- times proofs are performed as if Haskell were a total language and sometimes we are interested in explicitly reasoning about effects like partiality, exceptions or tracing. By translating a Haskell func- tion into a Coq function that is parametrised over a monad, we can model all these cases. ',
      'type': 'Short-paper',
      'category': 2,
      'date': '18/11/2019',
      'start_hour': '10:00',
      'end_hour': '10:30',
      'rank': '0',
      'selected': false
    },
    {
      'name': 'Talk 8',
      'title': 'Lazy, Parallel Multiple Value Reductions in Common Lisp',
      'speaker': 'Marco Heisig',
      'abstract': 'No abstract. ',
      'type': 'Tutorial',
      'category': 4,
      'date': '19/11/2019',
      'start_hour': '14:00',
      'end_hour': '15:45',
      'rank': '0',
      'selected': false
    },
    {
      'name': 'Talk 9',
      'title': 'Efficient Implementation of Smalltalk Activation Records in Language Implementation Frameworks',
      'speaker': 'Fabio Niephaus',
      'abstract': 'Language implementation frameworks such as RPython or Truffle help to build runtimes for dynamic languages. For this, they make certain design decisions and trade-offs upfront to make common language concepts easy to implement. Because of this, however, some language-specific concepts may be rather tedious to support, especially the modification of activation records. For example, Smalltalk provides reification of activations through context objects. Since they are used to implement other mechanisms such as exception handling on the language level, contexts need to be entirely supported by the underlying runtime. ',
      'type': 'Talk',
      'category': 3,
      'date': '19/11/2019',
      'start_hour': '17:15',
      'end_hour': '18:00',
      'rank': '0',
      'selected': false
    }
  ];

  RankingAlgorithm(List<String> answers) {
    List typeScoresLabel = [100, 80, 60, 40, 20];
    List categoryScoresLabel = [0, 15, 50, 85, 100];

    List answers = [3, 2, 0, 4, 3, 2, 4, 1, ['Tutorial', 'Talk', 'Poster', 'Short-paper', 'Research paper'], 'Didier Verna'];

    double categoryScore;
    double typeScore;
    double speakerScore;

    //CATEGORY -------------------------------------------------
    for(int i=0; i<allItems.length; i++) {
      if (allItems[i]['category'] == 1 || allItems[i]['category'] == 10 || allItems[i]['category'] == 11 || allItems[i]['category'] == 12) {
        categoryScore = 50;
      }
      else {
        int cat = allItems[i]['category'];
        int ans = answers[cat-1];
        categoryScore = categoryScoresLabel[ans];
      }

      //TYPE -------------------------------------------------
      List order = answers[8];
      String type = allItems[i]['type'];

      int index = -1;
      for(int k=0; k<order.length; k++) {
        if(type.toUpperCase() == order[k].toUpperCase()) {
          index = k;
        }
      }

      if(index == -1) {
        typeScore = 50;
      }
      else {
        typeScore = typeScoresLabel[index];
      }

      //SPEAKER -------------------------------------------------
      String wanterSpeaker = answers[9];
      String speaker = allItems[i]['speaker'];
      if(speaker.toUpperCase() == wanterSpeaker.toUpperCase()) {
        speakerScore = 100;
      }
      else {
        speakerScore = 0;
      }

      double rank = categoryScore*0.45 + typeScore*0.45 + speakerScore*0.1;
      allItems[i]['ranking'] = rank.round().toString();
    }

    List rankingAlgorithm() {
      return allItems;
    }

  }

}