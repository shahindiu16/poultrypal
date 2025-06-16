class NewcastleMedInfo {

  NewcastleMedInfo({
    required this.genericName,
    required this.tradeNames,
  });

  factory NewcastleMedInfo.fromJson(Map<String, dynamic> json) {
    return NewcastleMedInfo(
      genericName: json['generic_name'] as String,
      tradeNames: (json['trade_names'] as List)
          .map((trade) => TradeName.fromJson(trade))
          .toList(),
    );
  }
  final String genericName;
  final List<TradeName> tradeNames;
}

class TradeName {

  TradeName({
    required this.company,
    required this.tradeName,
    this.dosage,
  });

  factory TradeName.fromJson(Map<String, dynamic> json) {
    return TradeName(
      company: json['company'] as String,
      tradeName: json['trade_name'] as String,
      dosage: json['dosage'] as String?,
    );
  }
  final String company;
  final String tradeName;
  final String? dosage;
}

List<NewcastleMedInfo> parseNewcastleMedInfo(List<dynamic> data) {
  return data.map((json) => NewcastleMedInfo.fromJson(json)).toList();
}

const newcastleMedInfo = [
  {
    'generic_name': 'Ciprofloxacin USP',
    'trade_names': [
      {
        'company': 'Square Pharmaceuticals Ltd.',
        'trade_name': 'Ciprocin Vet Solution',
        'dosage': '1ml/liter water for 3-5 consecutive days'
      },
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': 'Cipro-A Vet'},
      {'company': 'Renata Limited', 'trade_name': ''},
      {'company': 'ACI Animal Health', 'trade_name': 'Acivet Cipro'},
      {
        'company': 'Skf Pharmaceuticals Ltd.',
        'trade_name': 'Ciproflox Vet Sloution'
      },
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': 'Civox vet'},
      {'company': 'Incepta Pharmaceuticals Ltd.', 'trade_name': 'Beuflox Vet'},
      {'company': 'Elanco Bangladesh', 'trade_name': ''},
      {'company': 'Eon Animal Health', 'trade_name': 'Cidaflox Vet'},
      {'company': 'Opsonin Pharmaceuticals Ltd.', 'trade_name': 'Kaprovet'},
      {'company': 'Globe Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Techno Drugs Ltd.', 'trade_name': 'Ciprosol, Ciprotab'},
      {'company': 'SHINIL Pharma Limited', 'trade_name': 'Cipryl'},
      {'company': 'Chemist Laboratories Ltd.', 'trade_name': 'Orciflox'}
    ]
  },
  {
    'generic_name': 'Ciprofloxacin Hydrochloride + Dexamethasone',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': 'Cipro-D Vet'},
      {'company': 'Renata Limited', 'trade_name': ''},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''}
    ]
  },
  {
    'generic_name': 'Amoxicillin Trihydrate',
    'trade_names': [
      {
        'company': 'Square Pharmaceuticals Ltd.',
        'trade_name': 'Moxacil-Vet',
        'dosage': '1 gm/liter water for 3-5 consecutive days'
      },
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': 'Moxilin Vet'},
      {'company': 'Renata Limited', 'trade_name': 'Renamox'},
      {'company': 'ACI Animal Health', 'trade_name': 'Acimox Vet'},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': 'Eskamox'},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': 'Fimox Vet'},
      {'company': 'Incepta Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Elanco Bangladesh', 'trade_name': ''},
      {'company': 'Eon Animal Health', 'trade_name': ''},
      {'company': 'Opsonin Pharmaceuticals Ltd.', 'trade_name': 'Moxin'},
      {'company': 'Globe Pharmaceuticals Ltd.', 'trade_name': 'Ultramox-Vet'},
      {'company': 'Techno Drugs Ltd.', 'trade_name': 'Amoxy Vet'},
      {'company': 'SHINIL Pharma Limited', 'trade_name': ''},
      {'company': 'Chemist Laboratories Ltd.', 'trade_name': ''}
    ]
  },
  {
    'generic_name': 'Erythromycin Thiocyanate + Sulfadiazine + Trimethoprim',
    'trade_names': [
      {
        'company': 'Square Pharmaceuticals Ltd.',
        'trade_name': 'Erisen-Vet',
        'dosage': '1 gm/liter for 3-5 days'
      },
      {
        'company': 'The ACME Laboratories Ltd.',
        'trade_name': 'ERAPRIM Vet, Eraplus Vet'
      },
      {'company': 'Renata Limited', 'trade_name': 'Renatrim Vet suspension'},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {
        'company': 'Skf Pharmaceuticals Ltd.',
        'trade_name': 'Turbonid Vet Powder'
      },
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''},
      {
        'company': 'Incepta Pharmaceuticals Ltd.',
        'trade_name': 'Firmac Plus Vet'
      },
      {'company': 'Elanco Bangladesh', 'trade_name': ''},
      {'company': 'Eon Animal Health', 'trade_name': ''},
      {'company': 'Opsonin Pharmaceuticals Ltd.', 'trade_name': 'Erocot Vet'},
      {'company': 'Globe Pharmaceuticals Ltd.', 'trade_name': ''}
    ]
  },
  {
    'generic_name': 'Acidifier',
    'trade_names': [
      {
        'company': 'Square Pharmaceuticals Ltd.',
        'trade_name': 'Hameco pH',
        'dosage': '1ml/liter water twice daily for 5 days'
      },
      {
        'company': 'The ACME Laboratories Ltd.',
        'trade_name': 'ACIDIFIER VET, AURITOX-PLUS VET'
      },
      {'company': 'Renata Limited', 'trade_name': 'Rena pH Liquid'},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {
        'company': 'Skf Pharmaceuticals Ltd.',
        'trade_name': 'Avian pH Solution, Six Plus solution'
      },
      {
        'company': 'Popular Pharmaceuticals Ltd.',
        'trade_name': 'Organil pH, Protox'
      }
    ]
  },
  {
    'generic_name': 'Renal Tonic',
    'trade_names': [
      {
        'company': 'Square Pharmaceuticals Ltd.',
        'trade_name': 'Nephrocare Liquid',
        'dosage': '1ml/liter water twice daily for 5 days'
      },
      {
        'company': 'The ACME Laboratories Ltd.',
        'trade_name': 'Glucovet Vet, Neftonic Vet'
      },
      {
        'company': 'Renata Limited',
        'trade_name': 'Renal Vet, Nephcare Plus Liquid'
      },
      {
        'company': 'ACI Animal Health',
        'trade_name': 'Acilyte Powder Vet, Nephroflush liquid'
      },
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': 'Mycoban solution'},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': 'Renal Vet'}
    ]
  },
  {
    'generic_name': 'Vitamin C',
    'trade_names': [
      {
        'company': 'Square Pharmaceuticals Ltd.',
        'trade_name': 'Cevit-Vet Powder',
        'dosage': '1 gm/3 liter for 3-5 days'
      },
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': 'VITAMIX-C Vet'},
      {'company': 'Renata Limited', 'trade_name': 'Rena C Powder'},
      {'company': 'ACI Animal Health', 'trade_name': 'ACIVET C Powder'},
      {
        'company': 'Skf Pharmaceuticals Ltd.',
        'trade_name': 'Eskavit B+C Powder, Eskavit C Powder'
      },
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': 'C100 Powder'},
      {'company': 'Incepta Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Elanco Bangladesh', 'trade_name': ''},
      {'company': 'Eon Animal Health', 'trade_name': ''},
      {'company': 'Opsonin Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Globe Pharmaceuticals Ltd.', 'trade_name': 'VitaX-C Powder'},
      {'company': 'Techno Drugs Ltd.', 'trade_name': ''},
      {'company': 'SHINIL Pharma Limited', 'trade_name': ''},
      {
        'company': 'Chemist Laboratories Ltd.',
        'trade_name': 'CHEMO-C POWDER (VET)'
      }
    ]
  },
  {
    'generic_name': 'Disinfectant & Sanitizer',
    'trade_names': [
      {
        'company': 'Square Pharmaceuticals Ltd.',
        'trade_name': 'Glutex GQ1 (Antimicrobial glutaraldehyde disinfectant)',
        'instructions':
            'Shed and outside of the shed should sprayed by Glutex GQ1: 5ml/liter water'
      },
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': 'Shift Liquid'},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {
        'company': 'Skf Pharmaceuticals Ltd.',
        'trade_name': 'Micronil Solution'
      },
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''}
    ]
  },
  {
    'generic_name':
        'Live attenuated Newcastle Disease virus (strain Clone:10^6 EID50)',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': 'Izovac Clone'},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''}
    ]
  },
  {
    'generic_name':
        'Live attenuated Newcastle Disease Virus, strain Clone: 10^6 EID50; Live attenuated Infectious Bronchitis Virus, strain H120: 10^3 EID50',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': 'Izovac H120 Clone'},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''}
    ]
  },
  {
    'generic_name':
        'Live attenuated Newcastle Disease Virus, strain Lasota: 10^6 EID50; Live attenuated Infectious Bronchitis Virus, strain H120: 10^3 EID50',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': 'Izovac H120 Lasota'},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''}
    ]
  },
  {
    'generic_name': 'Inactivated ND Virus Strain LaSota: 50 PD50',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': 'Izovac ND'},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''}
    ]
  },
  {
    'generic_name':
        "Inactivated Newcastle Disease Virus, strain LaSota 50 PD50; Inactivated EDS '76 Virus strain 127",
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': 'Izovac ND-EDS-IB'},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''}
    ]
  },
  {
    'generic_name':
        'Inactivated ND Virus Strain LaSota: 50 PD50 & Inactivated IBD virus strain Winterfield 2512 RP ≥1',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': 'Izovac ND-IBD'},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''}
    ]
  },
  {
    'generic_name': 'Newcastle Disease Vaccine, Living BP',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': ''},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''},
      {
        'company': 'Incepta Pharmaceuticals Ltd.',
        'trade_name': 'LasoVaxTM Vet'
      },
      {'company': 'Elanco Bangladesh', 'trade_name': ''},
      {'company': 'Eon Animal Health', 'trade_name': ''},
      {'company': 'Opsonin Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Globe Pharmaceuticals Ltd.', 'trade_name': 'MuktaVax'}
    ]
  },
  {
    'generic_name':
        'Inactivated Newcastle Disease (LaSota Strain), Infectious Bronchitis (M41 Strain) and Egg Drop Syndrome (AV 127)',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': ''},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Incepta Pharmaceuticals Ltd.', 'trade_name': 'EDS Plus vet'},
      {'company': 'Elanco Bangladesh', 'trade_name': ''},
      {'company': 'Eon Animal Health', 'trade_name': ''},
      {'company': 'Opsonin Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Globe Pharmaceuticals Ltd.', 'trade_name': ''}
    ]
  },
  {
    'generic_name':
        'Newcastle Disease and Avian Infectious Bronchitis Vaccine, Living',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': ''},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''},
      {
        'company': 'Incepta Pharmaceuticals Ltd.',
        'trade_name': 'RaniVax Plus Vet Initial'
      },
      {'company': 'Elanco Bangladesh', 'trade_name': ''},
      {'company': 'Eon Animal Health', 'trade_name': ''},
      {'company': 'Opsonin Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Globe Pharmaceuticals Ltd.', 'trade_name': ''}
    ]
  },
  {
    'generic_name': 'Newcastle Disease and Avian Infectious Bronchitis',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': ''},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''},
      {
        'company': 'Incepta Pharmaceuticals Ltd.',
        'trade_name': 'RaniVax Plus Vet Booster'
      },
      {'company': 'Elanco Bangladesh', 'trade_name': ''},
      {'company': 'Eon Animal Health', 'trade_name': ''},
      {'company': 'Opsonin Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Globe Pharmaceuticals Ltd.', 'trade_name': ''}
    ]
  },
  {
    'generic_name':
        'Inactivated Avian Influenza Type A virus subtype H9N2 and Newcastle Disease Virus (LaSota strain)',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': ''},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''},
      {
        'company': 'Incepta Pharmaceuticals Ltd.',
        'trade_name': 'GuardFlu Plus vet'
      },
      {'company': 'Elanco Bangladesh', 'trade_name': ''},
      {'company': 'Eon Animal Health', 'trade_name': ''},
      {'company': 'Opsonin Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Globe Pharmaceuticals Ltd.', 'trade_name': ''}
    ]
  },
  {
    'generic_name':
        'Inactivated Newcastle Disease Virus (LaSota Strain) and Infectious Bursal Disease Virus (Intermediate Strain)',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': ''},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Incepta Pharmaceuticals Ltd.', 'trade_name': 'RaniGum vet'},
      {'company': 'Elanco Bangladesh', 'trade_name': ''},
      {'company': 'Eon Animal Health', 'trade_name': ''},
      {'company': 'Opsonin Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Globe Pharmaceuticals Ltd.', 'trade_name': ''}
    ]
  },
  {
    'generic_name':
        'Inactivated viral vaccine for the prevention of Newcastle disease and disease caused by avian paramyxovirus type 3',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': ''},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Incepta Pharmaceuticals Ltd.', 'trade_name': ''},
      {
        'company': 'Elanco Bangladesh',
        'trade_name': 'AviPro® 233 ND-PMV3 Concentrate'
      },
      {'company': 'Eon Animal Health', 'trade_name': ''},
      {'company': 'Opsonin Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Globe Pharmaceuticals Ltd.', 'trade_name': ''}
    ]
  },
  {
    'generic_name':
        'Inactivated viral and bacterial vaccine to aid in the prevention of Newcastle disease, infectious bronchitis (Mass. type and Mycoplasma gallisepticum)',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': ''},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Incepta Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Elanco Bangladesh', 'trade_name': 'AviPro® 304 ND-IB-MG'},
      {'company': 'Eon Animal Health', 'trade_name': ''},
      {'company': 'Opsonin Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Globe Pharmaceuticals Ltd.', 'trade_name': ''}
    ]
  },
  {
    'generic_name':
        'Inactivated viral vaccine to aid in prevention of Newcastle disease, infectious bronchitis and provide maternal antibodies for the early protection of progeny against reovirus and bursal disease',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': ''},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Incepta Pharmaceuticals Ltd.', 'trade_name': ''},
      {
        'company': 'Elanco Bangladesh',
        'trade_name': 'AviPro® 442 ND-IB2-BTO2-Reo'
      },
      {'company': 'Eon Animal Health', 'trade_name': ''},
      {'company': 'Opsonin Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Globe Pharmaceuticals Ltd.', 'trade_name': ''}
    ]
  },
  {
    'generic_name':
        'Live viral vaccine to aid in the prevention of Newcastle disease and infectious bronchitis, Mass. and Conn. types',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': ''},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Incepta Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Elanco Bangladesh', 'trade_name': 'AviPro® ND IB Polybanco'},
      {'company': 'Eon Animal Health', 'trade_name': ''},
      {'company': 'Opsonin Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Globe Pharmaceuticals Ltd.', 'trade_name': ''}
    ]
  },
  {
    'generic_name':
        'Helps in the prevention of Newcastle disease and the Mass. type of infectious bronchitis',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': ''},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Incepta Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Elanco Bangladesh', 'trade_name': 'AviPro® ND IB Sohol'},
      {'company': 'Eon Animal Health', 'trade_name': ''},
      {'company': 'Opsonin Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Globe Pharmaceuticals Ltd.', 'trade_name': ''}
    ]
  },
  {
    'generic_name': 'Inactivated Newcastle Disease virus, LaSota strain',
    'trade_names': [
      {
        'company': 'Square Pharmaceuticals Ltd.',
        'trade_name': 'Avipro ND C1312'
      },
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': ''},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''}
    ]
  },
  {
    'generic_name':
        'Live Newcastle Disease and Infectious Bursal Disease Vaccine',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': ''},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''}
    ]
  },
  {
    'generic_name':
        'Inactivated Newcastle Disease Virus (LaSota strain), inactivated Infectious Bronchitis Virus (strain M41) and inactivated Egg Drop Syndrome (AV127) viruses',
    'trade_names': [
      {
        'company': 'Square Pharmaceuticals Ltd.',
        'trade_name': 'Izovac ND+IB+EDS'
      },
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': ''},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': ''},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': ''}
    ]
  }
];

const coccidiosisMedInfo = [
  {
    'generic_name': 'Toltrazuril',
    'trade_names': [
      {
        'company': 'Square Pharmaceuticals Ltd.',
        'trade_name': 'Coxitril-Vet',
        'dosage': '28 ml/100 kg of bird for once in 2 days only.',
      },
      {
        'company': 'The ACME Laboratories Ltd.',
        'trade_name': 'Anticoc Vet',
      },
      {
        'company': 'Renata Limited',
        'trade_name': 'Renazuril Liquid',
      },
      {
        'company': 'ACI Animal Health',
        'trade_name': 'Cocci-Tol Plus',
      },
      {
        'company': 'Skf Pharmaceuticals Ltd.',
        'trade_name': 'Xmeria Vet',
      },
      {
        'company': 'Popular Pharmaceuticals Ltd.',
        'trade_name': 'Tolicox',
      },
    ],
  },
  {
    'generic_name':
        'Amprolium+Ethopabate+Sulphaquinoxaline+Vitamin K3+Vitamin C',
    'trade_names': [
      {
        'company': 'Square Pharmaceuticals Ltd.',
        'trade_name': 'Coctreat-EP Powder',
        'dosage': '1 gm/liter water for 3-5 days.',
      },
      {
        'company': 'The ACME Laboratories Ltd.',
        'trade_name': 'COCCI-OFF Vet (Amprolium+Sulphaquinoxaline+Vitamin K)',
      },
      {
        'company': 'Renata Limited',
        'trade_name': '',
      },
      {
        'company': 'ACI Animal Health',
        'trade_name': 'Ampro-50 (Amprolium Hydrochloride)',
      },
      {
        'company': 'Skf Pharmaceuticals Ltd.',
        'trade_name':
            'Amprol EP Vet (Amprolium+Ethopabate+Sulphaquinoxaline+Vitamin K3+Vitamin C)',
      },
      {
        'company': 'Popular Pharmaceuticals Ltd.',
        'trade_name': 'Amprol Vet Powder (Amprolium Hydrochloride)',
      },
    ],
  },
  {
    'generic_name': 'Amoxicillin Trihydrate',
    'trade_names': [
      {
        'company': 'Square Pharmaceuticals Ltd.',
        'trade_name': 'Moxacil-Vet',
        'dosage': '1 gm/liter water for 3-5 consecutive days.',
      },
      {
        'company': 'The ACME Laboratories Ltd.',
        'trade_name': 'Moxilin Vet',
      },
      {
        'company': 'Renata Limited',
        'trade_name': 'Renamox',
      },
      {
        'company': 'ACI Animal Health',
        'trade_name': 'Acimox Vet',
      },
      {
        'company': 'Skf Pharmaceuticals Ltd.',
        'trade_name': 'Eskamox',
      },
      {
        'company': 'Popular Pharmaceuticals Ltd.',
        'trade_name': 'Fimox Vet',
      },
    ],
  },
  {
    'generic_name': 'Vitamin K',
    'trade_names': [
      {
        'company': 'Square Pharmaceuticals Ltd.',
        'trade_name': 'K-10 Powder',
        'dosage': '1 gm/5 liter water for 3-5 consecutive days.',
      },
      {
        'company': 'The ACME Laboratories Ltd.',
        'trade_name': 'VITA-K Vet',
      },
      {
        'company': 'Renata Limited',
        'trade_name': 'Rena-K Powder',
      },
      {
        'company': 'ACI Animal Health',
        'trade_name': 'Cocci-K',
      },
    ],
  },
  {
    'generic_name': 'Vitamin C',
    'trade_names': [
      {
        'company': 'Square Pharmaceuticals Ltd.',
        'trade_name': 'Cevit-Vet Powder',
        'dosage':
            '1 gm/5 liter water for twice daily for 3-5 consecutive days.',
      },
      {
        'company': 'The ACME Laboratories Ltd.',
        'trade_name': 'VITAMIX-C Vet',
      },
      {
        'company': 'Renata Limited',
        'trade_name': 'Rena C Powder',
      },
      {
        'company': 'ACI Animal Health',
        'trade_name': 'ACIVET C Powder',
      },
      {
        'company': 'Skf Pharmaceuticals Ltd.',
        'trade_name': 'Eskavit C Powder, Eskavit B+C Powder',
      },
    ],
  },
  {
    'generic_name': 'Vitamin B-Complex',
    'trade_names': [
      {
        'company': 'Square Pharmaceuticals Ltd.',
        'trade_name': 'B-Com-Vit Liquid',
        'dosage': '1 gm/liter water for 5 days.',
      },
      {
        'company': 'The ACME Laboratories Ltd.',
        'trade_name': 'V-Plex Vet',
      },
      // {
      //   company: "Renata Limited",
      //   trade_name: "",
      // },
      // {
      //   company: "ACI Animal Health",
      //   trade_name: "",
      // },
      {
        'company': 'Skf Pharmaceuticals Ltd.',
        'trade_name': 'Eskavit B1B2 Powder, Eskavit B+C Powder',
      },
      {
        'company': 'Popular Pharmaceuticals Ltd.',
        'trade_name': 'Beco Vet',
      },
    ],
  },
  {
    'generic_name': 'Sulphaclozine Sodium monohydrate+Sucrose',
    'trade_names': [
      // {
      //   company: "Square Pharmaceuticals Ltd.",
      //   trade_name: "",
      // },
      // {
      //   company: "The ACME Laboratories Ltd.",
      //   trade_name: "",
      // },
      {
        'company': 'Renata Limited',
        'trade_name': 'Coxicure Powder',
      },
      // {
      //   company: "ACI Animal Health",
      //   trade_name: "",
      // },
      // {
      //   company: "Skf Pharmaceuticals Ltd.",
      //   trade_name: "",
      // },
      // {
      //   company: "Popular Pharmaceuticals Ltd.",
      //   trade_name: "",
      // },
    ],
  },
  {
    'generic_name': 'Live Vaccine',
    'trade_names': [
      // {
      //   company: "Square Pharmaceuticals Ltd.",
      //   trade_name: "",
      // },
      // {
      //   company: "The ACME Laboratories Ltd.",
      //   trade_name: "",
      // },
      // {
      //   company: "Renata Limited",
      //   trade_name: "",
      // },
      {
        'company': 'ACI Animal Health',
        'trade_name': 'IMMUcox5',
      },
      // {
      //   company: "Skf Pharmaceuticals Ltd.",
      //   trade_name: "",
      // },
      // {
      //   company: "Popular Pharmaceuticals Ltd.",
      //   trade_name: "",
      // },
    ],
  },
];

const salmonellosisMedInfo = [
  {
    'generic_name': 'Ciprofloxacin',
    'dosage': '1ml/liter water twice a day for 3-5 consecutive days',
    'trade_names': [
      {
        'company': 'Square Pharmaceuticals Ltd.',
        'trade_name': 'Ciprocin Vet Solution'
      },
      {
        'company': 'The ACME Laboratories Ltd.',
        'trade_name': 'Cipro-A Vet, Cipro-D Vet'
      },
      {'company': 'Renata Limited', 'trade_name': ''},
      {'company': 'ACI Animal Health', 'trade_name': 'Acivet Cipro'},
      {
        'company': 'Skf Pharmaceuticals Ltd.',
        'trade_name': 'Ciproflox Vet Solution'
      },
      {
        'company': 'Popular Pharmaceuticals Ltd.',
        'trade_name': 'Civox vet, Beuflox Vet Bolus'
      },
      {'company': 'Incepta Pharmaceuticals Ltd.', 'trade_name': 'Beuflox Vet'},
      {'company': 'Opsonin Pharmaceuticals Ltd.', 'trade_name': 'Cidaflox Vet'},
      {'company': 'Globe Pharmaceuticals Ltd.', 'trade_name': 'Kaprovet'},
      {'company': 'Techno Drugs Ltd.', 'trade_name': 'Ciprosol, Ciprotab'},
      {'company': 'SHINIL Pharma Limited', 'trade_name': 'Cipryl'},
      {'company': 'Chemist Laboratories Ltd.', 'trade_name': 'Orciflox'}
    ]
  },
  {
    'generic_name': 'Amoxicillin Trihydrate',
    'dosage': '1 gm/liter water for 3-5 consecutive days',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': 'Moxacil-Vet'},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': 'Moxilin Vet'},
      {'company': 'Renata Limited', 'trade_name': 'Renamox'},
      {'company': 'ACI Animal Health', 'trade_name': 'Acimox Vet'},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': 'Eskamox'},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': 'Fimox Vet'},
      {'company': 'Opsonin Pharmaceuticals Ltd.', 'trade_name': 'Moxin'},
      {'company': 'Globe Pharmaceuticals Ltd.', 'trade_name': 'Ultramox-Vet'},
      {
        'company': 'Techno Drugs Ltd.',
        'trade_name': 'Amoxy Vet, Amoclav Bolus'
      },
      {'company': 'Chemist Laboratories Ltd.', 'trade_name': 'Amoxycil'}
    ]
  },
  {
    'generic_name': 'Doxycycline Hyclate+ Colistin Sulphate',
    'dosage': '1 gm/2 litre water twice a day for 3-5 days',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': 'Doxytin-Vet'},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': 'Doxy-A Vet'},
      {'company': 'ACI Animal Health', 'trade_name': 'Doxyvet Powder'},
      {
        'company': 'Skf Pharmaceuticals Ltd.',
        'trade_name': 'Doxtin Vet Oral Powder'
      },
      {'company': 'Globe Pharmaceuticals Ltd.', 'trade_name': 'Anidox'}
    ]
  },
  {
    'generic_name': 'Acidifier',
    'dosage': '1ml/liter water twice for 3 days',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': 'Hameco pH'},
      {
        'company': 'The ACME Laboratories Ltd.',
        'trade_name': 'ACIDIFIER VET, AURITOX-PLUS VET'
      },
      {'company': 'Renata Limited', 'trade_name': 'Rena pH Liquid'},
      {'company': 'ACI Animal Health', 'trade_name': 'TF Gold'},
      {
        'company': 'Skf Pharmaceuticals Ltd.',
        'trade_name': 'Avian pH Solution'
      },
      {'company': 'Opsonin Pharmaceuticals Ltd.', 'trade_name': 'Selko-pH vet'}
    ]
  },
  {
    'generic_name':
        'Yucca extract+ Formic acid+ Propionic acid+ Phosphoric acid+ Monopropylene glycol+ Sorbitol',
    'dosage': '',
    'trade_names': [
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': 'Ammogut Vet'},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': 'Gasonil Powder'}
    ]
  },
  {
    'generic_name':
        'Monoglycerides of Propanoic acid (monopropionine)+Monoglycerides of Butyric acid (monobutyrin)+ encapsulated essential oils',
    'dosage': '',
    'trade_names': [
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': 'No-SAL'}
    ]
  },
  {
    'generic_name':
        'Formic acid+ Lactic acid+ Acetic acid+ Sodium formate+ HSCAS',
    'dosage': '',
    'trade_names': [
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': 'Antisal'}
    ]
  },
  {
    'generic_name': 'Superbiotics',
    'dosage': '',
    'trade_names': [
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': 'Exolution'}
    ]
  },
  {
    'generic_name': 'Levofloxacin',
    'dosage': '1gm/2 liter water twice a day for 3-5 days',
    'trade_names': [
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': 'Leovet Vet'},
      {'company': 'ACI Animal Health', 'trade_name': 'Aci-Levo Vet'},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': 'Levomax'},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': 'Levobac Vet'},
      {'company': 'Incepta Pharmaceuticals Ltd.', 'trade_name': 'Levoxin Vet'},
      {'company': 'Techno Drugs Ltd.', 'trade_name': 'Levosol'}
    ]
  },
  {
    'generic_name': 'Doxycycline Hydrochloride',
    'dosage': '1gm/2 liter water twice a day for 3-5 days',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': 'Doxacil-Vet'},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': 'Doxy-A Vet'},
      {'company': 'Renata Limited', 'trade_name': 'Doxyvet Powder'},
      {'company': 'ACI Animal Health', 'trade_name': 'Anti-Dox Vet'},
      {'company': 'Globe Pharmaceuticals Ltd.', 'trade_name': 'Sindox Vet'},
      {'company': 'SHINIL Pharma Limited', 'trade_name': 'SI Doxy Plus Powder'},
      {
        'company': 'Chemist Laboratories Ltd.',
        'trade_name': 'DOXI- C ORAL POWDER'
      }
    ]
  },
  {
    'generic_name': 'Doxycycline+ Neomycin Sulphate',
    'dosage': '1gm/1.5 liter water twice a day for 3-5 days',
    'trade_names': [
      {'company': 'ACI Animal Health', 'trade_name': 'Nedo-Vet Oral Powder'}
    ]
  },
  {
    'generic_name': 'Oxytetracycline',
    'dosage': '1gm/2 liter water twice a day for 3-5 days',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': 'Otetra-vet'},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': 'Tetravet Vet'},
      {'company': 'Renata Limited', 'trade_name': 'Renamycin AF'},
      {'company': 'ACI Animal Health', 'trade_name': 'Bectatib Vet'},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': 'OTC Vet'},
      {'company': 'Incepta Pharmaceuticals Ltd.', 'trade_name': 'Titex Vet'},
      {'company': 'Globe Pharmaceuticals Ltd.', 'trade_name': 'Oxyvet'},
      {'company': 'Techno Drugs Ltd.', 'trade_name': 'Technomycin'},
      {
        'company': 'Chemist Laboratories Ltd.',
        'trade_name': 'CHEMYCIN DS BOLUS'
      }
    ]
  },
  {
    'generic_name': 'Doxycycline+ Oxytetracycline',
    'dosage': '',
    'trade_names': [
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': 'DO-2 100 GM'}
    ]
  },
  {
    'generic_name': 'Colistin Sulfate',
    'dosage': '',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': 'Colgin-Vet'},
      {'company': 'Renata Limited', 'trade_name': ''},
      {'company': 'ACI Animal Health', 'trade_name': ''},
      {
        'company': 'Skf Pharmaceuticals Ltd.',
        'trade_name': 'Eskcolis-24 Vet Solution'
      },
      {
        'company': 'Incepta Pharmaceuticals Ltd.',
        'trade_name': 'Listin Vet Solution'
      }
    ]
  },
  {
    'generic_name': 'Enrofloxacin',
    'dosage': '1gm/2 liter water twice a day for 3-5 days',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': 'Enflox-Vet'},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': 'Enrovet'},
      {'company': 'Renata Limited', 'trade_name': 'Enrocin Liquid'},
      {'company': 'ACI Animal Health', 'trade_name': 'G-Enro Vet'},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': 'Enroflox'},
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': 'Enrex vet'},
      {'company': 'Incepta Pharmaceuticals Ltd.', 'trade_name': 'Enoxin Vet'},
      {'company': 'Techno Drugs Ltd.', 'trade_name': 'Enrox'}
    ]
  },
  {
    'generic_name': 'Neomycin sulfate',
    'dosage': '1gm/2.5 liter water twice a day for 3-5 days',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': 'Neobiotic-Vet'},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': ''},
      {'company': 'Renata Limited', 'trade_name': 'Nimocin Vet'},
      {'company': 'ACI Animal Health', 'trade_name': 'Neoren'},
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': 'Neoxel'},
      {'company': 'Techno Drugs Ltd.', 'trade_name': 'Neovet'},
      {'company': 'SHINIL Pharma Limited', 'trade_name': 'Neoshin'},
      {
        'company': 'Chemist Laboratories Ltd.',
        'trade_name': 'Germicin Oral Powder'
      }
    ]
  },
  {
    'generic_name': 'Gentamicin Sulphate',
    'dosage': '1gm/2.5 liter water twice a day for 3-5 days',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': 'Genacyn-Vet'},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': 'Genta-10 Vet'},
      {'company': 'Renata Limited', 'trade_name': 'Gentaren'},
      {'company': 'ACI Animal Health', 'trade_name': 'Acigent Vet'},
      {
        'company': 'Skf Pharmaceuticals Ltd.',
        'trade_name': 'Gentest vet powder'
      },
      {'company': 'Popular Pharmaceuticals Ltd.', 'trade_name': 'Gentabac Vet'},
      {
        'company': 'Incepta Pharmaceuticals Ltd.',
        'trade_name': 'Intamycin Vet'
      },
      {'company': 'Techno Drugs Ltd.', 'trade_name': 'Gentacin, Gentamax'},
      {'company': 'Chemist Laboratories Ltd.', 'trade_name': 'Germicin'}
    ]
  },
  {
    'generic_name': 'Erythromycin Sulfate+ Sulphadiazine+ Trimethoprim',
    'dosage': '1gm/1 liter water twice a day for 3-5 days',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': 'Erisen-Vet'},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': 'ERAPRIM Vet'},
      {'company': 'Renata Limited', 'trade_name': 'Renatrim Vet suspension'},
      {'company': 'ACI Animal Health', 'trade_name': 'Eryvet Vet'},
      {
        'company': 'Skf Pharmaceuticals Ltd.',
        'trade_name': 'Turbonid Vet Powder'
      },
      {
        'company': 'Incepta Pharmaceuticals Ltd.',
        'trade_name': 'Firmac Plus Vet'
      },
      {'company': 'Elanco Bangladesh', 'trade_name': 'Erocot Vet'}
    ]
  },
  {
    'generic_name': 'Sulfachloropyridazine',
    'dosage': '',
    'trade_names': [
      {'company': 'Skf Pharmaceuticals Ltd.', 'trade_name': 'Sultrik Powder'}
    ]
  },
  {
    'generic_name': 'Sulphadiazine+ Trimethoprim',
    'dosage': '',
    'trade_names': [
      {'company': 'Square Pharmaceuticals Ltd.', 'trade_name': 'Sulprim-Vet'},
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': 'ATIVET VET'},
      {'company': 'Renata Limited', 'trade_name': 'Renatrim'},
      {'company': 'Opsonin Pharmaceuticals Ltd.', 'trade_name': 'TRIVET'}
    ]
  },
  {
    'generic_name': 'Erythromycinthiocyanate',
    'dosage': '',
    'trade_names': [
      {
        'company': 'Square Pharmaceuticals Ltd.',
        'trade_name': 'Erisen-Vet powder'
      },
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': 'Eraplus Vet'},
      {'company': 'Renata Limited', 'trade_name': ''},
      {'company': 'ACI Animal Health', 'trade_name': 'Micronid Powder'}
    ]
  },
  {
    'generic_name':
        'Erythromycin+ Neomycin+ Sulphdimidine+ Trimethoprim+ Bromhexine',
    'dosage': '',
    'trade_names': [
      {'company': 'The ACME Laboratories Ltd.', 'trade_name': 'Myco-Out Powder'}
    ]
  },
  {
    'generic_name':
        'Inactivated bacterial vaccine to aid in the reduction of Salmonella Enteritidis colonization.',
    'dosage': '',
    'trade_names': [
      {
        'company': 'Elanco Bangladesh',
        'trade_name': 'AviPro® 109 SE4 Concentrate'
      }
    ]
  },
  {
    'generic_name':
        'Live bacterial vaccine to aid in the reduction of Salmonella Enteritidis (chickens) and Salmonella Typhimurium colonization (turkeys).',
    'dosage': '',
    'trade_names': [
      {'company': 'Elanco Bangladesh', 'trade_name': 'AviPro® Megan® Egg'}
    ]
  },
  {
    'generic_name':
        'Live bacterial vaccine to aid in the reduction of Salmonella Typhimurium, Salmonella Enteritidis and Salmonella Heidelberg colonization.',
    'dosage': '',
    'trade_names': [
      {'company': 'Elanco Bangladesh', 'trade_name': 'AviPro® Megan® Vac 1'}
    ]
  },
  {
    'generic_name':
        'Inactivated viral and bacterial vaccine to aid in the prevention of Newcastle disease and infectious bronchitis, and aid in the reduction of Salmonella Enteritidis colonization.',
    'dosage': '',
    'trade_names': [
      {'company': 'Elanco Bangladesh', 'trade_name': 'Avipro® 329 ND-IB2-SE4'}
    ]
  },
  {
    'generic_name': 'Natural Liver & Kidney Tonic',
    'dosage': '',
    'trade_names': [
      {'company': 'Techno Drugs Ltd.', 'trade_name': 'Rumen Plus Powder'}
    ]
  }
];
