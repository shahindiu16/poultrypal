class DiseaseModel {
  final String name;
  final List<SectionModel> sections;

  DiseaseModel({required this.name, required this.sections});

  factory DiseaseModel.fromJson(Map<String, dynamic> json) {
    print("Nmae -> ${json['name']}");
    return DiseaseModel(
      name: json['name'],
      sections: (json['sections'] as List)
          .map((section) => SectionModel.fromJson(section))
          .toList(),
    );
  }
}

class SectionModel {
  final String title;
  final List<ContentModel> content;

  SectionModel({required this.title, required this.content});

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    print("title -> ${json['title']}");
    return SectionModel(
      title: json['title'],
      content: (json['content'] as List)
          .map((item) => ContentModel.fromJson(item))
          .toList(),
    );
  }
}

class ContentModel {
  final String? heading;
  final String? subHeading;
  final String? text;
  final List<String>? points;

  ContentModel({this.heading, this.subHeading, this.text, this.points});

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return ContentModel(
      heading: json['heading'],
      subHeading: json['subHeading'],
      text: json['text'],
      points:
          (json['points'] as List?)?.map((point) => point as String).toList(),
    );
  }
}

const diseasesData = [
  {
    "name": "Coccidiosis",
    "sections": [
      {
        "title": "Overview",
        "content": [
          {
            "heading": "Definition",
            "text":
                "Enteric disease caused by Eimeria parasites, prevalent in poultry with significant economic impact.",
          },
          {
            "heading": "Causal Agents",
            "text":
                "Seven species of Eimeria parasites infect chickens' intestinal tract.",
          },
          {
            "heading": "Transmission/Epidemiology",
            "points": [
              "Sporulated oocysts are primary infective agents.",
              "Spread through various vectors like animals, insects, contaminated equipment, feed, and water.",
              "Outbreaks common in rainy seasons with high temperatures and humidity.",
              "Environmental factors like moisture and stress increase risk.",
            ],
          },
        ],
      },
      {
        "title": "Clinical Signs",
        "content": [
          {
            "heading": "Severe Coccidiosis",
            "subHeading": "(E. brunetti, E. necatrix, E. tenella)",
            "points": [
              "Depressed chickens, emaciation, drooping wings, weight reduction.",
              "Bloody diarrhea, loss of appetite, high mortality.",
            ],
          },
          {
            "heading": "Moderate Coccidiosis",
            "subHeading": "(E. acervulina, E. maxima)",
            "points": [
              "Emaciation, poor growth, pale mucous membrane, blood in droppings.",
              "Associated with weight loss, moderate mortality.",
            ],
          },
          {
            "heading": "Mild Coccidiosis",
            "subHeading": "(E. mitis, E. praecox)",
            "points": [
              "Generally milder symptoms like poor growth and paleness of shanks.",
              "Lower mortality compared to severe and moderate forms.",
            ],
          },
        ],
      },
      {
        "title": "Diagnosis",
        "content": [
          {
            "heading": "Faecal Examinations",
            "text": "Microscopy or RT-PCR for oocysts identification.",
          },
          {
            "heading": "Postmortem Findings",
            "text":
                "Lesions in the intestinal tract, species differentiation based on observations.",
          },
        ],
      },
      {
        "title": "Zoonotic Risk",
        "content": [
          {
            "text": "Negligible risk for humans.",
          }
        ],
      },
      {
        "title": "Treatments",
        "content": [
          {
            "text":
                "Toltrazuril, Amprolium, Amoxicillin, Vitamins K, C, B-Complex, prescribed by a Registered Veterinary Physician.",
          },
          {
            "text":
                "Choice based on parasite species, infection severity, and animal characteristics.",
          },
        ],
      },
      {
        "title": "Prevention",
        "content": [
          {
            "heading": "Live Vaccines",
            "text": "Expensive but effective prevention method.",
          },
          {
            "heading": "Hygiene",
            "text":
                "Essential for reducing oocyst contamination, ensuring dry litter conditions.",
          },
          {
            "heading": "Housing and Feeding",
            "text":
                "Proper spacing, clean feeding areas, and quarantining new birds to prevent disease spread.",
          },
          {
            "heading": "Environmental Management",
            "text":
                "Using stone lime on wet litter, frequent litter changes, and disinfection with hydrogen peroxide.",
          },
        ],
      },
    ],
  },
  {
    "name": "Salmonellosis",
    "sections": [
      {
        "title": "Overview",
        "content": [
          {
            "heading": "Definition",
            "text":
                "Acute or chronic infection caused by Salmonella bacteria, affecting primarily very young poultry.",
          },
          {
            "heading": "Age Susceptibility",
            "text":
                "Most common in chickens aged 4 days to 2 weeks, rarely seen after 1 month.",
          },
          {
            "heading": "Mortality",
            "text":
                "Varied, ranging from 15% to 80%, influenced by strain virulence, bird age, and stress.",
          },
          {
            "heading": "Transmission",
            "text":
                "Horizontal and vertical transmission occurs through various vectors and contaminated environments.",
          },
        ],
      },
      {
        "title": "Clinical Signs",
        "content": [
          {
            "text": "Huddling near heat source.",
          },
          {
            "text": "Depression, weakness, ruffled feathers, closed eyes.",
          },
          {
            "text": "Diarrhea, pasty feces around the vent.",
          },
          {
            "text": "Mortality highest in first few weeks of age.",
          },
          {
            "text": "Rarely, blindness and lameness may occur.",
          },
        ],
      },
      {
        "title": "Diagnosis",
        "content": [
          {
            "text":
                "Requires clinical examination, laboratory testing, epidemiological investigation, and post-mortem examination.",
          },
        ],
      },
      {
        "title": "Zoonotic Risk",
        "content": [
          {
            "text": "Low risk for humans.",
          }
        ],
      },
    ],
  },
  {
    "name": "Newcastle Disease",
    "sections": [
      {
        "title": "Overview",
        "content": [
          {
            "heading": "Definition",
            "text":
                "Highly contagious viral disease affecting poultry worldwide.",
          },
          {
            "heading": "Affected Species",
            "text": "Chickens, turkeys, pigeons, geese, and ducks.",
          },
          {
            "heading": "Pathotypes",
            "text": "Lentogenic, mesogenic, and velogenic strains.",
          },
          {
            "heading": "Transmission",
            "text":
                "Inhalation or ingestion of virus; excretion by sick birds, healthy carriers, and humans; wind dispersal.",
          },
          {
            "heading": "Virulence",
            "text":
                "Velogenic strains cause severe disease; endemic in Asia, Africa, and some parts of the Americas.",
          },
          {
            "heading": "Seasonality",
            "text": "Most common in summer.",
          },
        ],
      },
      {
        "title": "Clinical Signs",
        "content": [
          {
            "heading": "Vesogenic strain",
            "text":
                "Sudden death, depression, diarrhea, edema, high mortality.",
          },
          {
            "heading": "Mesogenic strain",
            "text":
                "Severe respiratory disease, nervous signs, egg production decrease.",
          },
          {
            "heading": "Lentogenic strain",
            "text": "Mild respiratory distress or no disease.",
          },
        ],
      },
      {
        "title": "Diagnosis",
        "content": [
          {
            "text":
                "Clinical signs, laboratory tests, and postmortem examination.",
          },
          {
            "text":
                "Serology (HAI test), virus growth from tissue samples, molecular detection (sequencing, RT-PCR).",
          },
          {
            "text":
                "Ulcers in intestines, hemorrhagic ulcers, petechial hemorrhages in various organs, organ proliferation.",
          },
          {
            "text":
                "Necrosis, congestion, inflammation in liver, lungs, ovaries, and spleen.",
          },
        ],
      },
      {
        "title": "Treatment and Vaccination",
        "content": [
          {
            "text": "No specific treatment; vaccination crucial for control.",
          },
          {
            "text":
                "Live vaccines (e.g., LaSota, B1 lentogenic) reduce losses; killed vaccines for certain situations.",
          },
          {
            "text":
                "Vaccination schedules vary by region and strain virulence.",
          },
        ],
      },
      {
        "title": "Prevention",
        "content": [
          {
            "text": "Quarantine, biosecurity, vaccination crucial.",
          },
          {
            "text":
                "'All in-all out' farming, pest control, human traffic management, shed fumigation.",
          },
          {
            "text":
                "Disinfection with potassium permanganate, cresol, and formalin.",
          },
        ],
      },
    ],
  },
];
