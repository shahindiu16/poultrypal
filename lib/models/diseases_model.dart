import 'package:flutter/material.dart';
import 'package:poultrypal/l10n/app_localizations.dart';

class DiseaseModel {
  final String name;
  final List<SectionModel> sections;

  DiseaseModel({required this.name, required this.sections});

  factory DiseaseModel.fromJson(Map<String, dynamic> json) {
    debugPrint("Nmae -> ${json['name']}");
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
    debugPrint("title -> ${json['title']}");
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

List<Map<String, Object>> diseasesData(AppLocalizations i10) => [
      {
        "name": i10.coccidiosis_name,
        "sections": [
          {
            "title": i10.coccidiosis_sections_overview_title,
            "content": [
              {
                "heading": i10.coccidiosis_sections_overview_definition_heading,
                "text": i10.coccidiosis_sections_overview_definition_text,
              },
              {
                "heading":
                    i10.coccidiosis_sections_overview_causal_agents_heading,
                "text": i10.coccidiosis_sections_overview_causal_agents_text,
              },
              {
                "heading":
                    i10.coccidiosis_sections_overview_transmission_heading,
                "points": [
                  i10.coccidiosis_sections_overview_transmission_points_1,
                  i10.coccidiosis_sections_overview_transmission_points_2,
                  i10.coccidiosis_sections_overview_transmission_points_3,
                  i10.coccidiosis_sections_overview_transmission_points_4,
                ],
              },
            ],
          },
          {
            "title": i10.newcastle_disease_sections_clinical_signs_title,
            "content": [
              {
                "heading":
                    i10.coccidiosis_sections_clinical_signs_severe_heading,
                "subHeading":
                    i10.coccidiosis_sections_clinical_signs_severe_sub_heading,
                "points": [
                  i10.coccidiosis_sections_clinical_signs_severe_points_1,
                  i10.coccidiosis_sections_clinical_signs_severe_points_2,
                ],
              },
              {
                "heading":
                    i10.coccidiosis_sections_clinical_signs_moderate_heading,
                "subHeading": i10
                    .coccidiosis_sections_clinical_signs_moderate_sub_heading,
                "points": [
                  i10.coccidiosis_sections_clinical_signs_moderate_points_1,
                  i10.coccidiosis_sections_clinical_signs_moderate_points_2,
                ],
              },
              {
                "heading": i10.coccidiosis_sections_clinical_signs_mild_heading,
                "subHeading":
                    i10.coccidiosis_sections_clinical_signs_mild_sub_heading,
                "points": [
                  i10.coccidiosis_sections_clinical_signs_mild_points_1,
                  i10.coccidiosis_sections_clinical_signs_mild_points_2,
                ],
              },
            ],
          },
          {
            "title": i10.coccidiosis_sections_diagnosis_title,
            "content": [
              {
                "heading": i10
                    .coccidiosis_sections_diagnosis_faecal_examinations_heading,
                "text":
                    i10.coccidiosis_sections_diagnosis_faecal_examinations_text,
              },
              {
                "heading": i10
                    .coccidiosis_sections_diagnosis_postmortem_findings_heading,
                "text":
                    i10.coccidiosis_sections_diagnosis_postmortem_findings_text,
              },
            ],
          },
          {
            "title": i10.coccidiosis_sections_zoonotic_risk_title,
            "content": [
              {
                "text": i10.coccidiosis_sections_zoonotic_risk_content,
              }
            ],
          },
          {
            "title": i10.coccidiosis_sections_treatments_title,
            "content": [
              {
                "text": i10.coccidiosis_sections_treatments_content_1,
              },
              {
                "text": i10.coccidiosis_sections_treatments_content_2,
              },
            ],
          },
          {
            "title": i10.coccidiosis_sections_prevention_title,
            "content": [
              {
                "heading":
                    i10.coccidiosis_sections_prevention_live_vaccines_heading,
                "text": i10.coccidiosis_sections_prevention_live_vaccines_text,
              },
              {
                "heading": i10.coccidiosis_sections_prevention_hygiene_heading,
                "text": i10.coccidiosis_sections_prevention_hygiene_text,
              },
              {
                "heading": i10
                    .coccidiosis_sections_prevention_housing_and_feeding_heading,
                "text": i10
                    .coccidiosis_sections_prevention_housing_and_feeding_text,
              },
              {
                "heading": i10
                    .coccidiosis_sections_prevention_environmental_management_heading,
                "text": i10
                    .coccidiosis_sections_prevention_environmental_management_text,
              },
            ],
          },
        ],
      },
      {
        "name": i10.salmonellosis_name,
        "sections": [
          {
            "title": i10.salmonellosis_sections_overview_title,
            "content": [
              {
                "heading":
                    i10.salmonellosis_sections_overview_definition_heading,
                "text": i10.salmonellosis_sections_overview_definition_text,
              },
              {
                "heading": i10
                    .salmonellosis_sections_overview_age_susceptibility_heading,
                "text":
                    i10.salmonellosis_sections_overview_age_susceptibility_text,
              },
              {
                "heading":
                    i10.salmonellosis_sections_overview_mortality_heading,
                "text": i10.salmonellosis_sections_overview_mortality_text,
              },
              {
                "heading":
                    i10.salmonellosis_sections_overview_transmission_heading,
                "text": i10.salmonellosis_sections_overview_transmission_text,
              },
            ],
          },
          {
            "title": i10.salmonellosis_sections_clinical_signs_title,
            "content": [
              {
                "text": i10.salmonellosis_sections_clinical_signs_points_1,
              },
              {
                "text": i10.salmonellosis_sections_clinical_signs_points_2,
              },
              {
                "text": i10.salmonellosis_sections_clinical_signs_points_3,
              },
              {
                "text": i10.salmonellosis_sections_clinical_signs_points_4,
              },
              {
                "text": i10.salmonellosis_sections_clinical_signs_points_5,
              },
            ],
          },
          {
            "title": i10.salmonellosis_sections_diagnosis_title,
            "content": [
              {
                "text": i10.salmonellosis_sections_diagnosis_content_1,
              },
            ],
          },
          {
            "title": i10.salmonellosis_sections_zoonotic_risk_title,
            "content": [
              {
                "text": i10.salmonellosis_sections_zoonotic_risk_content_1,
              }
            ],
          },
        ],
      },
      {
        "name": i10.newcastle_disease_name,
        "sections": [
          {
            "title": i10.newcastle_disease_sections_overview_title,
            "content": [
              {
                "heading":
                    i10.newcastle_disease_sections_overview_definition_heading,
                "text": i10.newcastle_disease_sections_overview_definition_text,
              },
              {
                "heading": i10
                    .newcastle_disease_sections_overview_affected_species_heading,
                "text": i10
                    .newcastle_disease_sections_overview_affected_species_text,
              },
              {
                "heading":
                    i10.newcastle_disease_sections_overview_pathotypes_heading,
                "text": i10.newcastle_disease_sections_overview_pathotypes_text,
              },
              {
                "heading": i10
                    .newcastle_disease_sections_overview_transmission_heading,
                "text":
                    i10.newcastle_disease_sections_overview_transmission_text,
              },
              {
                "heading":
                    i10.newcastle_disease_sections_overview_virulence_heading,
                "text": i10.newcastle_disease_sections_overview_virulence_text,
              },
              {
                "heading":
                    i10.newcastle_disease_sections_overview_seasonality_heading,
                "text":
                    i10.newcastle_disease_sections_overview_seasonality_text,
              },
            ],
          },
          {
            "title": i10.newcastle_disease_sections_clinical_signs_title,
            "content": [
              {
                "heading": i10
                    .newcastle_disease_sections_clinical_signs_vesogenic_strain_heading,
                "text": i10
                    .newcastle_disease_sections_clinical_signs_vesogenic_strain_text,
              },
              {
                "heading": i10
                    .newcastle_disease_sections_clinical_signs_mesogenic_strain_heading,
                "text": i10
                    .newcastle_disease_sections_clinical_signs_mesogenic_strain_text,
              },
              {
                "heading": i10
                    .newcastle_disease_sections_clinical_signs_lentogenic_strain_heading,
                "text": i10
                    .newcastle_disease_sections_clinical_signs_lentogenic_strain_text,
              },
            ],
          },
          {
            "title": i10.newcastle_disease_sections_diagnosis_title,
            "content": [
              {
                "text": i10.newcastle_disease_sections_diagnosis_content_1,
              },
              {
                "text": i10.newcastle_disease_sections_diagnosis_content_2,
              },
              {
                "text": i10.newcastle_disease_sections_diagnosis_content_3,
              },
              {
                "text": i10.newcastle_disease_sections_diagnosis_content_4,
              },
            ],
          },
          {
            "title":
                i10.newcastle_disease_sections_treatment_and_vaccination_title,
            "content": [
              {
                "text": i10
                    .newcastle_disease_sections_treatment_and_vaccination_content_1,
              },
              {
                "text": i10
                    .newcastle_disease_sections_treatment_and_vaccination_content_2,
              },
              {
                "text": i10
                    .newcastle_disease_sections_treatment_and_vaccination_content_3,
              },
            ],
          },
          {
            "title": i10.newcastle_disease_sections_prevention_title,
            "content": [
              {
                "text": i10.newcastle_disease_sections_prevention_content_1,
              },
              {
                "text": i10.newcastle_disease_sections_prevention_content_2,
              },
              {
                "text": i10.newcastle_disease_sections_prevention_content_3,
              },
            ],
          },
        ],
      },
    ];
