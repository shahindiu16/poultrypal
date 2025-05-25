import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Poultry Pal'**
  String get appTitle;

  /// No description provided for @homeCardDiseases.
  ///
  /// In en, this message translates to:
  /// **'Diseases'**
  String get homeCardDiseases;

  /// No description provided for @homeCardDiseasesTitle.
  ///
  /// In en, this message translates to:
  /// **'Diseases & Treatments'**
  String get homeCardDiseasesTitle;

  /// No description provided for @homeCardMedicines.
  ///
  /// In en, this message translates to:
  /// **'Medicines'**
  String get homeCardMedicines;

  /// No description provided for @imagePreview.
  ///
  /// In en, this message translates to:
  /// **'Image Preview'**
  String get imagePreview;

  /// No description provided for @infoPageSection1.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get infoPageSection1;

  /// No description provided for @infoPageSection1General.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get infoPageSection1General;

  /// No description provided for @infoPageSection1General1.
  ///
  /// In en, this message translates to:
  /// **'(1) These Terms of Use govern all agreements between Poultry Pal and users of the livestock health analysis software provided by Poultry Pal as a software-as-a-service (SaaS) solution. This includes associated websites, platforms, services, applications, and functions. In these terms, ‘users’ refer to entrepreneurs as defined by the ICT Act of 2006 under Bangladesh civil law. These Terms of Use constitute the contract between the parties or, if additional contracts exist, become an integral part of each user agreement.'**
  String get infoPageSection1General1;

  /// No description provided for @infoPageSection1General2.
  ///
  /// In en, this message translates to:
  /// **'(2) The Poultry Pal app services aim to enhance livestock healthcare within the context of farming. Using artificial intelligence (AI), the app analyses image recordings of livestock excrements. The analysis results are then reviewed by collaborating veterinarians associated with Poultry Pal. After this analysis, Poultry Pal generates a health status report for the user\'s animals via the platform. This service empowers users to proactively manage their livestocks health, make early adjustments to feeding or medication, and operate their agricultural business more efficiently and economically.'**
  String get infoPageSection1General2;

  /// No description provided for @infoPageSection1SECU.
  ///
  /// In en, this message translates to:
  /// **'Services and End of the contract of use'**
  String get infoPageSection1SECU;

  /// No description provided for @infoPageSection1SECU1.
  ///
  /// In en, this message translates to:
  /// **'(1) poultry Pal provides users with free access to the services. The services include a reporting and analysis function, through which data of the farm animals (Poultry) can be uploaded in order to subsequently receive an analysis of the health status of the farm animals.'**
  String get infoPageSection1SECU1;

  /// No description provided for @infoPageSection1SECU2.
  ///
  /// In en, this message translates to:
  /// **'(2) in order to use the services, the user must accept these terms of use with poultry Pal, thereby creating a user agreement between poultry Pal and the user under the terms and conditions set forth in the terms of use.'**
  String get infoPageSection1SECU2;

  /// No description provided for @infoPageSection1SRU.
  ///
  /// In en, this message translates to:
  /// **'Scope and rights of use'**
  String get infoPageSection1SRU;

  /// No description provided for @infoPageSection1SRU1.
  ///
  /// In en, this message translates to:
  /// **'(1) Pursuant to the user agreement, Poultry Pal grants the user a non-exclusive, non-Transferable, non- sublicensable  right during the term of the user agreement to use the services for the purpose of providing healthcare in the context of farm animal husbandry.'**
  String get infoPageSection1SRU1;

  /// No description provided for @infoPageSection1SRU2.
  ///
  /// In en, this message translates to:
  /// **'(2) The user may not indirectly or directly:\n* Sublicence, transfer, distribute, share or otherwise generate revenue from the services;\n* Copy the services to a public or distributed network;\n* Decompile, reverse engineer, disassemble or otherwise attempt to obtain source codes, object codes or underlying structural ideas, know-how or algorithms or other functional mechanisms of the services, except as permitted in individual cases by mandatory legal provisions;\n* Modify, adapt, translate or create derivative works based on all or any part of the services (except to the extent permitted by Poultry Pal or as authorised under the services);\n* Modify references to proprietary  rights that appear in the services or any part thereof;\n* Use the services in a manner that violets applicable laws and regulations or use outside the scope of the licence described in this section 3;\n* Use the services to store, download or transmit infringing,defamatory or otherwise unlawful or unauthorised materials or malicious code or Malware or phishing, spamming,denial of service attacks or other fraudulent or criminal activity; interfere with or disrupt the integrity or performance of any third party system or the offerings or data contained therein; attempt to gain unauthorised access to Poultry Pal\'s services or systems or networks or conduct penetration tests, vulnerability assessments or other security assessments or engage third parties to conduct them.'**
  String get infoPageSection1SRU2;

  /// No description provided for @infoPageSection1SRU3.
  ///
  /// In en, this message translates to:
  /// **'(3) The user May only use the services for the purpose and as described in the description under clause 1.2 and the documentation referenced therein. He/she is prohibited from uploading images to the platform that show content that is not in line with the intended purpose. This includes, in particular, images that contain personal data such as identifiable persons, name tags or that show illegal content.'**
  String get infoPageSection1SRU3;

  /// No description provided for @infoPageSection1OU.
  ///
  /// In en, this message translates to:
  /// **'Obligations of the user'**
  String get infoPageSection1OU;

  /// No description provided for @infoPageSection1OU1.
  ///
  /// In en, this message translates to:
  /// **'(1) The user is obliged to use the Services within the framework of the applicable laws and regulations as well as the provisions in clause 3.'**
  String get infoPageSection1OU1;

  /// No description provided for @infoPageSection1OU2.
  ///
  /// In en, this message translates to:
  /// **'(2) The user is Solely responsible for the safety of the technical equipment and any use of the technical equipment known or unknown to the user.'**
  String get infoPageSection1OU2;

  /// No description provided for @infoPageSection1OU3.
  ///
  /// In en, this message translates to:
  /// **'(3) The user is Solely of responsible for the content of all data displayed, uploaded, stored, exchanged, transmitted by the user through or by means of the services.'**
  String get infoPageSection1OU3;

  /// No description provided for @infoPageSection1OU4.
  ///
  /// In en, this message translates to:
  /// **'(4) Poultry Pal shall have the right, without prior notice and without liability, to investigate alleged breaches of the user agreement by the user and may take such legal and/or technical action against the user as Poultry Pal deems appropriate to remedy such breaches. Such measures include restricting, blocking or terminating the user\'s access to the services.'**
  String get infoPageSection1OU4;

  /// No description provided for @infoPageSection1OPPW.
  ///
  /// In en, this message translates to:
  /// **'Obligations of Poultry Pal and Warranty'**
  String get infoPageSection1OPPW;

  /// No description provided for @infoPageSection1OPPW1.
  ///
  /// In en, this message translates to:
  /// **'1.    User Access and Service Scope: \n\t○    Poultry Pal provides users with free access to its services, as described in the current content and scope available on the app.'**
  String get infoPageSection1OPPW1;

  /// No description provided for @infoPageSection1OPPW2.
  ///
  /// In en, this message translates to:
  /// **'2.Poultry Pal’s Rights: \n \t* Poultry Pal reserves the right to modify the scope and content of its services at any time without prior notice. This includes downgrading, limiting, terminating, or making other adjustments.'**
  String get infoPageSection1OPPW2;

  /// No description provided for @infoPageSection1OPPW3.
  ///
  /// In en, this message translates to:
  /// **'3.Limited Warranty and Obligations: \n \t* Except as specified in Clause 8, Poultry Pal does not provide warranties, indemnity, maintenance, support, or availability obligations related to the services.'**
  String get infoPageSection1OPPW3;

  /// No description provided for @infoPageSection1PRGRR.
  ///
  /// In en, this message translates to:
  /// **'Property rights and granting of rights to the image recordings and reporting'**
  String get infoPageSection1PRGRR;

  /// No description provided for @infoPageSection1PRGRR1.
  ///
  /// In en, this message translates to:
  /// **'1.    Ownership and Intellectual Property: \n\t○ Poultry Pal and its contractors (if any) retain all proprietary rights, including copyrights, patents, trademarks, and other intellectual property related to the services.\n\t○ Users acknowledge that the rights granted under this user agreement do not confer ownership rights in the services.'**
  String get infoPageSection1PRGRR1;

  /// No description provided for @infoPageSection1PRGRR2.
  ///
  /// In en, this message translates to:
  /// **'2.    User-Uploaded Images: \n\t○ Users grant Poultry Pal an unrestricted and perpetual right to use the image recordings they upload on the platform.\n\t○ This usage aims to enhance Poultry Pal’s services.'**
  String get infoPageSection1PRGRR2;

  /// No description provided for @infoPageSection1PRGRR3.
  ///
  /// In en, this message translates to:
  /// **'3.    Data Utilisation by Poultry Pal: \n\t○ Poultry Pal utilises data from reports and analysis results generated during app usage.\n\t○ The purpose is to optimise and further develop its services beyond the existing contract duration.'**
  String get infoPageSection1PRGRR3;

  /// No description provided for @infoPageSection1IT.
  ///
  /// In en, this message translates to:
  /// **'IT security and updates'**
  String get infoPageSection1IT;

  /// No description provided for @infoPageSection1IT1.
  ///
  /// In en, this message translates to:
  /// **'1.    Service Security:\n\t○ Poultry Pal commits to maintaining service security at industry-standard levels.\n\t○ Reasonable measures will be taken to safeguard user data and ensure a secure environment.'**
  String get infoPageSection1IT1;

  /// No description provided for @infoPageSection1IT2.
  ///
  /// In en, this message translates to:
  /// **'2.    Service Updates and Versions:\n\t○ Poultry Pal retains the right to introduce new versions and updates to its services.\n\t○ This includes modifications to design, operational procedures, technical specifications, systems, and other features.\n\t○    Such changes may occur without prior notice.'**
  String get infoPageSection1IT2;

  /// No description provided for @infoPageSection1LLL.
  ///
  /// In en, this message translates to:
  /// **'Liability and limitation of liability'**
  String get infoPageSection1LLL;

  /// No description provided for @infoPageSection1LLL1.
  ///
  /// In en, this message translates to:
  /// **'1.    Liability for Intentional or Gross Negligence:\n\t○    Poultry Pal assumes no liability for damages caused intentionally or due to gross negligence. This includes cases involving harm to life, body, or health.'**
  String get infoPageSection1LLL1;

  /// No description provided for @infoPageSection1LLL2.
  ///
  /// In en, this message translates to:
  /// **'2.    Limited Liability for Negligence:\n\t○ Excluding the scenarios covered by no liability (Section 8.1), Poultry Pal’s liability is restricted.\n\t○ Specifically, Poultry Pal is liable for slightly negligent breaches of essential contractual obligations.\n\t○    Essential obligations are those necessary for proper contract performance and achieving the contract’s purpose.\n\t○ Damages are limited to what was foreseeable at the contract’s conclusion and typical for such agreements.'**
  String get infoPageSection1LLL2;

  /// No description provided for @infoPageSection1LLL3.
  ///
  /// In en, this message translates to:
  /// **'3. The aforementioned limitations of liability do not apply to liability under the product liability Act or to guarantees given in writing by Poultry Pal.'**
  String get infoPageSection1LLL3;

  /// No description provided for @infoPageSection1LLL4.
  ///
  /// In en, this message translates to:
  /// **'4. The user acknowledges that the services do not relieve the user from his duties in the keeping and taking care of farm animals. In particular, the service is not a  substitute for appropriate medical care of the user\'s farm animals by veterinarians and other professionals.'**
  String get infoPageSection1LLL4;

  /// No description provided for @infoPageSection1LLL5.
  ///
  /// In en, this message translates to:
  /// **'Poultry Pal is not responsible\n* for any undetected diseases of the user\'s livestock,\n* for certain conclusions that the user draws from the use of the services and thereby, if necessary, omits to take medical measures or equally takes medical measures that later proved to be unnecessary.'**
  String get infoPageSection1LLL5;

  /// No description provided for @infoPageSection1LLL6.
  ///
  /// In en, this message translates to:
  /// **'5. The user acknowledges that the correct recording of meaningful and usable images is the responsibility of the user. If the purpose of the Poultry Pal’s services is not achieved due to errors in image recording, Poultry Pal shall not be liable for any resulting consequential loss.'**
  String get infoPageSection1LLL6;

  /// No description provided for @infoPageSection1LLL7.
  ///
  /// In en, this message translates to:
  /// **'6. Poultry Pal shall likewise not be liable for any damage incurred by the user or third parties as a result of use of the service contrary to the purpose and provisions of these terms of use.'**
  String get infoPageSection1LLL7;

  /// No description provided for @infoPageSection1LLL8.
  ///
  /// In en, this message translates to:
  /// **'7. Any liability of Poultry Pal beyond the cases regulated in this clause 8 is excluded.'**
  String get infoPageSection1LLL8;

  /// No description provided for @infoPageSection1DP.
  ///
  /// In en, this message translates to:
  /// **'Data privacy'**
  String get infoPageSection1DP;

  /// No description provided for @infoPageSection1DP1.
  ///
  /// In en, this message translates to:
  /// **'(1) Poultry Pal will at all times comply with the requirements of applicable data protection law, particularly the EU imposed General Data Protection Regulation (GDPR).'**
  String get infoPageSection1DP1;

  /// No description provided for @infoPageSection1DP2.
  ///
  /// In en, this message translates to:
  /// **'(2) The processing of personal data by Poultry Pal is explained in more detail in the privacy policy, which can be viewed at https://nevronus.com/products/poultrypal/privacypolicy'**
  String get infoPageSection1DP2;

  /// No description provided for @infoPageSection1TT.
  ///
  /// In en, this message translates to:
  /// **'Term and termination'**
  String get infoPageSection1TT;

  /// No description provided for @infoPageSection1TT1.
  ///
  /// In en, this message translates to:
  /// **'1.    Commencement and Duration of User Contract:\n\t○ Unless otherwise specified in individual cases, the user contract begins when the user accepts the terms of use.\n\t○ This contract remains in effect indefinitely unless terminated.'**
  String get infoPageSection1TT1;

  /// No description provided for @infoPageSection1TT2.
  ///
  /// In en, this message translates to:
  /// **'2.    Termination Rights:\n\t○ Either Poultry Pal or the user can terminate the user contract at any time with immediate effect.\n\t○    Uninstalling the app completely will be considered termination by the user.'**
  String get infoPageSection1TT2;

  /// No description provided for @infoPageSection1FC.
  ///
  /// In en, this message translates to:
  /// **'Final Clauses'**
  String get infoPageSection1FC;

  /// No description provided for @infoPageSection1FC1.
  ///
  /// In en, this message translates to:
  /// **'(1) The user agreement constitutes the entire agreement between the user and Poultry Pal with respect to the subject matter hereof and supersedes and excludes all prior written, textual or oral negotiations, arrangements, understandings, exercises or agreements between the parties with respect to the subject matter hereof.'**
  String get infoPageSection1FC1;

  /// No description provided for @infoPageSection1FC2.
  ///
  /// In en, this message translates to:
  /// **'(2) Should any provision of the contract of use be or become invalid or void in whole or in part, this shall not affect the validity of the remaining provisions.'**
  String get infoPageSection1FC2;

  /// No description provided for @infoPageSection1FC3.
  ///
  /// In en, this message translates to:
  /// **'(3) There are no oral or written ancillary agreements to this contract. Amendments to this contract and its annexes must be made in text form (the exchange of simple e-mails is sufficient). The same applies to agreements to deviate from this text form requirement or to waive it completely. Clause 9.4 remains unaffected.'**
  String get infoPageSection1FC3;

  /// No description provided for @infoPageSection1FC4.
  ///
  /// In en, this message translates to:
  /// **'(4) Poultry Pal reserves the right to modify this user agreement at any time and to add new or additional terms or conditions to the use of the services. Notice of any changes shall be given at least 6 weeks prior to their intended effective date by service notification to the user via the push notification system. The user may agree or object to the amendment up to the date of its intended entry into force. The amendment shall be deemed accepted by the user if the user does not object to the amendment before the date on which it is intended to take effect. In the event of a timely objection by the user, the contract of use shall end at the time of the intended entry into force of the amendment to these terms of use. The use of the services is thus no longer possible.'**
  String get infoPageSection1FC4;

  /// No description provided for @infoPageSection1AL.
  ///
  /// In en, this message translates to:
  /// **'Applicable Law | Consumer arbitration board'**
  String get infoPageSection1AL;

  /// No description provided for @infoPageSection1AL1.
  ///
  /// In en, this message translates to:
  /// **'(1) Any user agreement and any dispute or claim arising out of or in connection with the user agreement or the subject matter or formation thereof shall be governed by the laws of the People’s Republic of Bangladesh, excluding its conflict of law provisions and the United Nations convention on contracts for the international sale of goods of 11.4.1980 (UN Sales Convention).'**
  String get infoPageSection1AL1;

  /// No description provided for @infoPageSection1AL2.
  ///
  /// In en, this message translates to:
  /// **'(2) For disputes in connection with the contract of use and the use of the service, Bangladesh is specified as the exclusive place of Jurisdiction between the user and Poultry Pal.'**
  String get infoPageSection1AL2;

  /// No description provided for @infoPageSection2.
  ///
  /// In en, this message translates to:
  /// **'User Manual'**
  String get infoPageSection2;

  /// No description provided for @infoPageSection2heading1.
  ///
  /// In en, this message translates to:
  /// **'1. Home Screen Overview'**
  String get infoPageSection2heading1;

  /// No description provided for @infoPageSection2heading2.
  ///
  /// In en, this message translates to:
  /// **'2. Diseases Menu'**
  String get infoPageSection2heading2;

  /// No description provided for @infoPageSection2heading3.
  ///
  /// In en, this message translates to:
  /// **'3. Medicines Menu'**
  String get infoPageSection2heading3;

  /// No description provided for @infoPageSection2heading4.
  ///
  /// In en, this message translates to:
  /// **'4. Central Red Button Functions'**
  String get infoPageSection2heading4;

  /// No description provided for @infoPageSection2heading5.
  ///
  /// In en, this message translates to:
  /// **'5. Uploading Faeces Pictures'**
  String get infoPageSection2heading5;

  /// No description provided for @infoPageSection2heading6.
  ///
  /// In en, this message translates to:
  /// **'6. Instructions'**
  String get infoPageSection2heading6;

  /// No description provided for @infoPageSection2heading7.
  ///
  /// In en, this message translates to:
  /// **'7. Info Button'**
  String get infoPageSection2heading7;

  /// No description provided for @infoPageSection2content1.
  ///
  /// In en, this message translates to:
  /// **'After opening the app, you will be presented with the home screen. This screen is intuitive and easy to navigate. There are two main menu buttons: Diseases and Medicines.'**
  String get infoPageSection2content1;

  /// No description provided for @infoPageSection2content2.
  ///
  /// In en, this message translates to:
  /// **'In the Diseases menu, you can find detailed information about three common chicken diseases: Coccidiosis, Salmonellosis, and Newcastle Disease. Each disease has its own submenu with more details.'**
  String get infoPageSection2content2;

  /// No description provided for @infoPageSection2content3.
  ///
  /// In en, this message translates to:
  /// **'The Medicines menu contains information about various medications used to treat chicken diseases. Each medication has its own submenu with detailed usage instructions.'**
  String get infoPageSection2content3;

  /// No description provided for @infoPageSection2content4.
  ///
  /// In en, this message translates to:
  /// **'The red circular button in the middle of the screen reveals two pop-up buttons. One allows you to browse your device’s gallery, and the other opens the camera to take pictures. This feature is useful for uploading images for diagnosis.'**
  String get infoPageSection2content4;

  /// No description provided for @infoPageSection2content5.
  ///
  /// In en, this message translates to:
  /// **'You can upload pictures of chicken faeces to the app’s neural network for disease diagnosis. Simply select a photo from your gallery or take a new one using the camera.'**
  String get infoPageSection2content5;

  /// No description provided for @infoPageSection2content6.
  ///
  /// In en, this message translates to:
  /// **'Take a picture of the faeces from 6-7 inches away and in good focus, covering the frame at least 70% or higher with your phone camera. In addition, when selecting an image from the device\'s gallery, please make sure the image covers at least 70% of the frame. Blurry and small subject sizes will lead to wrong diagnoses.'**
  String get infoPageSection2content6;

  /// No description provided for @infoPageSection2content7.
  ///
  /// In en, this message translates to:
  /// **'The i button located in the bottom right corner stands for information. It provides access to the Privacy Policy and this User Manual.'**
  String get infoPageSection2content7;

  /// No description provided for @coccidiosis_name.
  ///
  /// In en, this message translates to:
  /// **'Coccidiosis'**
  String get coccidiosis_name;

  /// No description provided for @coccidiosis_sections_overview_title.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get coccidiosis_sections_overview_title;

  /// No description provided for @coccidiosis_sections_overview_definition_heading.
  ///
  /// In en, this message translates to:
  /// **'Definition'**
  String get coccidiosis_sections_overview_definition_heading;

  /// No description provided for @coccidiosis_sections_overview_definition_text.
  ///
  /// In en, this message translates to:
  /// **'Enteric disease caused by Eimeria parasites, prevalent in poultry with significant economic impact.'**
  String get coccidiosis_sections_overview_definition_text;

  /// No description provided for @coccidiosis_sections_overview_causal_agents_heading.
  ///
  /// In en, this message translates to:
  /// **'Causal Agents'**
  String get coccidiosis_sections_overview_causal_agents_heading;

  /// No description provided for @coccidiosis_sections_overview_causal_agents_text.
  ///
  /// In en, this message translates to:
  /// **'Seven species of Eimeria parasites infect chickens\' intestinal tract.'**
  String get coccidiosis_sections_overview_causal_agents_text;

  /// No description provided for @coccidiosis_sections_overview_transmission_heading.
  ///
  /// In en, this message translates to:
  /// **'Transmission/Epidemiology'**
  String get coccidiosis_sections_overview_transmission_heading;

  /// No description provided for @coccidiosis_sections_overview_transmission_points_1.
  ///
  /// In en, this message translates to:
  /// **'Sporulated oocysts are primary infective agents.'**
  String get coccidiosis_sections_overview_transmission_points_1;

  /// No description provided for @coccidiosis_sections_overview_transmission_points_2.
  ///
  /// In en, this message translates to:
  /// **'Spread through various vectors like animals, insects, contaminated equipment, feed, and water.'**
  String get coccidiosis_sections_overview_transmission_points_2;

  /// No description provided for @coccidiosis_sections_overview_transmission_points_3.
  ///
  /// In en, this message translates to:
  /// **'Outbreaks common in rainy seasons with high temperatures and humidity.'**
  String get coccidiosis_sections_overview_transmission_points_3;

  /// No description provided for @coccidiosis_sections_overview_transmission_points_4.
  ///
  /// In en, this message translates to:
  /// **'Environmental factors like moisture and stress increase risk.'**
  String get coccidiosis_sections_overview_transmission_points_4;

  /// No description provided for @coccidiosis_sections_clinical_signs_severe_heading.
  ///
  /// In en, this message translates to:
  /// **'Severe Coccidiosis'**
  String get coccidiosis_sections_clinical_signs_severe_heading;

  /// No description provided for @coccidiosis_sections_clinical_signs_severe_sub_heading.
  ///
  /// In en, this message translates to:
  /// **'(E. brunetti, E. necatrix, E. tenella)'**
  String get coccidiosis_sections_clinical_signs_severe_sub_heading;

  /// No description provided for @coccidiosis_sections_clinical_signs_severe_points_1.
  ///
  /// In en, this message translates to:
  /// **'Depressed chickens, emaciation, drooping wings, weight reduction.'**
  String get coccidiosis_sections_clinical_signs_severe_points_1;

  /// No description provided for @coccidiosis_sections_clinical_signs_severe_points_2.
  ///
  /// In en, this message translates to:
  /// **'Bloody diarrhea, loss of appetite, high mortality.'**
  String get coccidiosis_sections_clinical_signs_severe_points_2;

  /// No description provided for @coccidiosis_sections_clinical_signs_moderate_heading.
  ///
  /// In en, this message translates to:
  /// **'Moderate Coccidiosis'**
  String get coccidiosis_sections_clinical_signs_moderate_heading;

  /// No description provided for @coccidiosis_sections_clinical_signs_moderate_sub_heading.
  ///
  /// In en, this message translates to:
  /// **'(E. acervulina, E. maxima)'**
  String get coccidiosis_sections_clinical_signs_moderate_sub_heading;

  /// No description provided for @coccidiosis_sections_clinical_signs_moderate_points_1.
  ///
  /// In en, this message translates to:
  /// **'Emaciation, poor growth, pale mucous membrane, blood in droppings.'**
  String get coccidiosis_sections_clinical_signs_moderate_points_1;

  /// No description provided for @coccidiosis_sections_clinical_signs_moderate_points_2.
  ///
  /// In en, this message translates to:
  /// **'Associated with weight loss, moderate mortality.'**
  String get coccidiosis_sections_clinical_signs_moderate_points_2;

  /// No description provided for @coccidiosis_sections_clinical_signs_mild_heading.
  ///
  /// In en, this message translates to:
  /// **'Mild Coccidiosis'**
  String get coccidiosis_sections_clinical_signs_mild_heading;

  /// No description provided for @coccidiosis_sections_clinical_signs_mild_sub_heading.
  ///
  /// In en, this message translates to:
  /// **'(E. mitis, E. praecox)'**
  String get coccidiosis_sections_clinical_signs_mild_sub_heading;

  /// No description provided for @coccidiosis_sections_clinical_signs_mild_points_1.
  ///
  /// In en, this message translates to:
  /// **'Generally milder symptoms like poor growth and paleness of shanks.'**
  String get coccidiosis_sections_clinical_signs_mild_points_1;

  /// No description provided for @coccidiosis_sections_clinical_signs_mild_points_2.
  ///
  /// In en, this message translates to:
  /// **'Lower mortality compared to severe and moderate forms.'**
  String get coccidiosis_sections_clinical_signs_mild_points_2;

  /// No description provided for @coccidiosis_sections_diagnosis_title.
  ///
  /// In en, this message translates to:
  /// **'Diagnosis'**
  String get coccidiosis_sections_diagnosis_title;

  /// No description provided for @coccidiosis_sections_diagnosis_faecal_examinations_heading.
  ///
  /// In en, this message translates to:
  /// **'Faecal Examinations'**
  String get coccidiosis_sections_diagnosis_faecal_examinations_heading;

  /// No description provided for @coccidiosis_sections_diagnosis_faecal_examinations_text.
  ///
  /// In en, this message translates to:
  /// **'Microscopy or RT-PCR for oocysts identification.'**
  String get coccidiosis_sections_diagnosis_faecal_examinations_text;

  /// No description provided for @coccidiosis_sections_diagnosis_postmortem_findings_heading.
  ///
  /// In en, this message translates to:
  /// **'Postmortem Findings'**
  String get coccidiosis_sections_diagnosis_postmortem_findings_heading;

  /// No description provided for @coccidiosis_sections_diagnosis_postmortem_findings_text.
  ///
  /// In en, this message translates to:
  /// **'Lesions in the intestinal tract, species differentiation based on observations.'**
  String get coccidiosis_sections_diagnosis_postmortem_findings_text;

  /// No description provided for @coccidiosis_sections_zoonotic_risk_title.
  ///
  /// In en, this message translates to:
  /// **'Zoonotic Risk'**
  String get coccidiosis_sections_zoonotic_risk_title;

  /// No description provided for @coccidiosis_sections_zoonotic_risk_content.
  ///
  /// In en, this message translates to:
  /// **'Negligible risk for humans.'**
  String get coccidiosis_sections_zoonotic_risk_content;

  /// No description provided for @coccidiosis_sections_treatments_title.
  ///
  /// In en, this message translates to:
  /// **'Treatments'**
  String get coccidiosis_sections_treatments_title;

  /// No description provided for @coccidiosis_sections_treatments_content_1.
  ///
  /// In en, this message translates to:
  /// **'Toltrazuril, Amprolium, Amoxicillin, Vitamins K, C, B-Complex, prescribed by a Registered Veterinary Physician.'**
  String get coccidiosis_sections_treatments_content_1;

  /// No description provided for @coccidiosis_sections_treatments_content_2.
  ///
  /// In en, this message translates to:
  /// **'Choice based on parasite species, infection severity, and animal characteristics.'**
  String get coccidiosis_sections_treatments_content_2;

  /// No description provided for @coccidiosis_sections_prevention_title.
  ///
  /// In en, this message translates to:
  /// **'Prevention'**
  String get coccidiosis_sections_prevention_title;

  /// No description provided for @coccidiosis_sections_prevention_live_vaccines_heading.
  ///
  /// In en, this message translates to:
  /// **'Live Vaccines'**
  String get coccidiosis_sections_prevention_live_vaccines_heading;

  /// No description provided for @coccidiosis_sections_prevention_live_vaccines_text.
  ///
  /// In en, this message translates to:
  /// **'Expensive but effective prevention method.'**
  String get coccidiosis_sections_prevention_live_vaccines_text;

  /// No description provided for @coccidiosis_sections_prevention_hygiene_heading.
  ///
  /// In en, this message translates to:
  /// **'Hygiene'**
  String get coccidiosis_sections_prevention_hygiene_heading;

  /// No description provided for @coccidiosis_sections_prevention_hygiene_text.
  ///
  /// In en, this message translates to:
  /// **'Essential for reducing oocyst contamination, ensuring dry litter conditions.'**
  String get coccidiosis_sections_prevention_hygiene_text;

  /// No description provided for @coccidiosis_sections_prevention_housing_and_feeding_heading.
  ///
  /// In en, this message translates to:
  /// **'Housing and Feeding'**
  String get coccidiosis_sections_prevention_housing_and_feeding_heading;

  /// No description provided for @coccidiosis_sections_prevention_housing_and_feeding_text.
  ///
  /// In en, this message translates to:
  /// **'Proper spacing, clean feeding areas, and quarantining new birds to prevent disease spread.'**
  String get coccidiosis_sections_prevention_housing_and_feeding_text;

  /// No description provided for @coccidiosis_sections_prevention_environmental_management_heading.
  ///
  /// In en, this message translates to:
  /// **'Environmental Management'**
  String get coccidiosis_sections_prevention_environmental_management_heading;

  /// No description provided for @coccidiosis_sections_prevention_environmental_management_text.
  ///
  /// In en, this message translates to:
  /// **'Using stone lime on wet litter, frequent litter changes, and disinfection with hydrogen peroxide.'**
  String get coccidiosis_sections_prevention_environmental_management_text;

  /// No description provided for @salmonellosis_name.
  ///
  /// In en, this message translates to:
  /// **'Salmonellosis'**
  String get salmonellosis_name;

  /// No description provided for @salmonellosis_sections_overview_title.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get salmonellosis_sections_overview_title;

  /// No description provided for @salmonellosis_sections_overview_definition_heading.
  ///
  /// In en, this message translates to:
  /// **'Definition'**
  String get salmonellosis_sections_overview_definition_heading;

  /// No description provided for @salmonellosis_sections_overview_definition_text.
  ///
  /// In en, this message translates to:
  /// **'Acute or chronic infection caused by Salmonella bacteria, affecting primarily very young poultry.'**
  String get salmonellosis_sections_overview_definition_text;

  /// No description provided for @salmonellosis_sections_overview_age_susceptibility_heading.
  ///
  /// In en, this message translates to:
  /// **'Age Susceptibility'**
  String get salmonellosis_sections_overview_age_susceptibility_heading;

  /// No description provided for @salmonellosis_sections_overview_age_susceptibility_text.
  ///
  /// In en, this message translates to:
  /// **'Most common in chickens aged 4 days to 2 weeks, rarely seen after 1 month.'**
  String get salmonellosis_sections_overview_age_susceptibility_text;

  /// No description provided for @salmonellosis_sections_overview_mortality_heading.
  ///
  /// In en, this message translates to:
  /// **'Mortality'**
  String get salmonellosis_sections_overview_mortality_heading;

  /// No description provided for @salmonellosis_sections_overview_mortality_text.
  ///
  /// In en, this message translates to:
  /// **'Varied, ranging from 15% to 80%, influenced by strain virulence, bird age, and stress.'**
  String get salmonellosis_sections_overview_mortality_text;

  /// No description provided for @salmonellosis_sections_overview_transmission_heading.
  ///
  /// In en, this message translates to:
  /// **'Transmission'**
  String get salmonellosis_sections_overview_transmission_heading;

  /// No description provided for @salmonellosis_sections_overview_transmission_text.
  ///
  /// In en, this message translates to:
  /// **'Horizontal and vertical transmission occurs through various vectors and contaminated environments.'**
  String get salmonellosis_sections_overview_transmission_text;

  /// No description provided for @salmonellosis_sections_clinical_signs_title.
  ///
  /// In en, this message translates to:
  /// **'Clinical Signs'**
  String get salmonellosis_sections_clinical_signs_title;

  /// No description provided for @salmonellosis_sections_clinical_signs_points_1.
  ///
  /// In en, this message translates to:
  /// **'Huddling near heat source.'**
  String get salmonellosis_sections_clinical_signs_points_1;

  /// No description provided for @salmonellosis_sections_clinical_signs_points_2.
  ///
  /// In en, this message translates to:
  /// **'Depression, weakness, ruffled feathers, closed eyes.'**
  String get salmonellosis_sections_clinical_signs_points_2;

  /// No description provided for @salmonellosis_sections_clinical_signs_points_3.
  ///
  /// In en, this message translates to:
  /// **'Diarrhea, pasty feces around the vent.'**
  String get salmonellosis_sections_clinical_signs_points_3;

  /// No description provided for @salmonellosis_sections_clinical_signs_points_4.
  ///
  /// In en, this message translates to:
  /// **'Mortality highest in first few weeks of age.'**
  String get salmonellosis_sections_clinical_signs_points_4;

  /// No description provided for @salmonellosis_sections_clinical_signs_points_5.
  ///
  /// In en, this message translates to:
  /// **'Rarely, blindness and lameness may occur.'**
  String get salmonellosis_sections_clinical_signs_points_5;

  /// No description provided for @salmonellosis_sections_diagnosis_title.
  ///
  /// In en, this message translates to:
  /// **'Diagnosis'**
  String get salmonellosis_sections_diagnosis_title;

  /// No description provided for @salmonellosis_sections_diagnosis_content_1.
  ///
  /// In en, this message translates to:
  /// **'Requires clinical examination, laboratory testing, epidemiological investigation, and post-mortem examination.'**
  String get salmonellosis_sections_diagnosis_content_1;

  /// No description provided for @salmonellosis_sections_zoonotic_risk_title.
  ///
  /// In en, this message translates to:
  /// **'Zoonotic Risk'**
  String get salmonellosis_sections_zoonotic_risk_title;

  /// No description provided for @salmonellosis_sections_zoonotic_risk_content_1.
  ///
  /// In en, this message translates to:
  /// **'Low risk for humans.'**
  String get salmonellosis_sections_zoonotic_risk_content_1;

  /// No description provided for @newcastle_disease_name.
  ///
  /// In en, this message translates to:
  /// **'Newcastle Disease'**
  String get newcastle_disease_name;

  /// No description provided for @newcastle_disease_sections_overview_title.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get newcastle_disease_sections_overview_title;

  /// No description provided for @newcastle_disease_sections_overview_definition_heading.
  ///
  /// In en, this message translates to:
  /// **'Definition'**
  String get newcastle_disease_sections_overview_definition_heading;

  /// No description provided for @newcastle_disease_sections_overview_definition_text.
  ///
  /// In en, this message translates to:
  /// **'Highly contagious viral disease affecting poultry worldwide.'**
  String get newcastle_disease_sections_overview_definition_text;

  /// No description provided for @newcastle_disease_sections_overview_affected_species_heading.
  ///
  /// In en, this message translates to:
  /// **'Affected Species'**
  String get newcastle_disease_sections_overview_affected_species_heading;

  /// No description provided for @newcastle_disease_sections_overview_affected_species_text.
  ///
  /// In en, this message translates to:
  /// **'Chickens, turkeys, pigeons, geese, and ducks.'**
  String get newcastle_disease_sections_overview_affected_species_text;

  /// No description provided for @newcastle_disease_sections_overview_pathotypes_heading.
  ///
  /// In en, this message translates to:
  /// **'Pathotypes'**
  String get newcastle_disease_sections_overview_pathotypes_heading;

  /// No description provided for @newcastle_disease_sections_overview_pathotypes_text.
  ///
  /// In en, this message translates to:
  /// **'Lentogenic, mesogenic, and velogenic strains.'**
  String get newcastle_disease_sections_overview_pathotypes_text;

  /// No description provided for @newcastle_disease_sections_overview_transmission_heading.
  ///
  /// In en, this message translates to:
  /// **'Transmission'**
  String get newcastle_disease_sections_overview_transmission_heading;

  /// No description provided for @newcastle_disease_sections_overview_transmission_text.
  ///
  /// In en, this message translates to:
  /// **'Inhalation or ingestion of virus; excretion by sick birds, healthy carriers, and humans; wind dispersal.'**
  String get newcastle_disease_sections_overview_transmission_text;

  /// No description provided for @newcastle_disease_sections_overview_virulence_heading.
  ///
  /// In en, this message translates to:
  /// **'Virulence'**
  String get newcastle_disease_sections_overview_virulence_heading;

  /// No description provided for @newcastle_disease_sections_overview_virulence_text.
  ///
  /// In en, this message translates to:
  /// **'Velogenic strains cause severe disease; endemic in Asia, Africa, and some parts of the Americas.'**
  String get newcastle_disease_sections_overview_virulence_text;

  /// No description provided for @newcastle_disease_sections_overview_seasonality_heading.
  ///
  /// In en, this message translates to:
  /// **'Seasonality'**
  String get newcastle_disease_sections_overview_seasonality_heading;

  /// No description provided for @newcastle_disease_sections_overview_seasonality_text.
  ///
  /// In en, this message translates to:
  /// **'Most common in summer.'**
  String get newcastle_disease_sections_overview_seasonality_text;

  /// No description provided for @newcastle_disease_sections_clinical_signs_title.
  ///
  /// In en, this message translates to:
  /// **'Clinical Signs'**
  String get newcastle_disease_sections_clinical_signs_title;

  /// No description provided for @newcastle_disease_sections_clinical_signs_vesogenic_strain_heading.
  ///
  /// In en, this message translates to:
  /// **'Vesogenic strain'**
  String get newcastle_disease_sections_clinical_signs_vesogenic_strain_heading;

  /// No description provided for @newcastle_disease_sections_clinical_signs_vesogenic_strain_text.
  ///
  /// In en, this message translates to:
  /// **'Sudden death, depression, diarrhea, edema, high mortality.'**
  String get newcastle_disease_sections_clinical_signs_vesogenic_strain_text;

  /// No description provided for @newcastle_disease_sections_clinical_signs_mesogenic_strain_heading.
  ///
  /// In en, this message translates to:
  /// **'Mesogenic strain'**
  String get newcastle_disease_sections_clinical_signs_mesogenic_strain_heading;

  /// No description provided for @newcastle_disease_sections_clinical_signs_mesogenic_strain_text.
  ///
  /// In en, this message translates to:
  /// **'Severe respiratory disease, nervous signs, egg production decrease.'**
  String get newcastle_disease_sections_clinical_signs_mesogenic_strain_text;

  /// No description provided for @newcastle_disease_sections_clinical_signs_lentogenic_strain_heading.
  ///
  /// In en, this message translates to:
  /// **'Lentogenic strain'**
  String
      get newcastle_disease_sections_clinical_signs_lentogenic_strain_heading;

  /// No description provided for @newcastle_disease_sections_clinical_signs_lentogenic_strain_text.
  ///
  /// In en, this message translates to:
  /// **'Mild respiratory distress or no disease.'**
  String get newcastle_disease_sections_clinical_signs_lentogenic_strain_text;

  /// No description provided for @newcastle_disease_sections_diagnosis_title.
  ///
  /// In en, this message translates to:
  /// **'Diagnosis'**
  String get newcastle_disease_sections_diagnosis_title;

  /// No description provided for @newcastle_disease_sections_diagnosis_content_1.
  ///
  /// In en, this message translates to:
  /// **'Clinical signs, laboratory tests, and postmortem examination.'**
  String get newcastle_disease_sections_diagnosis_content_1;

  /// No description provided for @newcastle_disease_sections_diagnosis_content_2.
  ///
  /// In en, this message translates to:
  /// **'Serology (HAI test), virus growth from tissue samples, molecular detection (sequencing, RT-PCR).'**
  String get newcastle_disease_sections_diagnosis_content_2;

  /// No description provided for @newcastle_disease_sections_diagnosis_content_3.
  ///
  /// In en, this message translates to:
  /// **'Ulcers in intestines, hemorrhagic ulcers, petechial hemorrhages in various organs, organ proliferation.'**
  String get newcastle_disease_sections_diagnosis_content_3;

  /// No description provided for @newcastle_disease_sections_diagnosis_content_4.
  ///
  /// In en, this message translates to:
  /// **'Necrosis, congestion, inflammation in liver, lungs, ovaries, and spleen.'**
  String get newcastle_disease_sections_diagnosis_content_4;

  /// No description provided for @newcastle_disease_sections_treatment_and_vaccination_title.
  ///
  /// In en, this message translates to:
  /// **'Treatment and Vaccination'**
  String get newcastle_disease_sections_treatment_and_vaccination_title;

  /// No description provided for @newcastle_disease_sections_treatment_and_vaccination_content_1.
  ///
  /// In en, this message translates to:
  /// **'No specific treatment; vaccination crucial for control.'**
  String get newcastle_disease_sections_treatment_and_vaccination_content_1;

  /// No description provided for @newcastle_disease_sections_treatment_and_vaccination_content_2.
  ///
  /// In en, this message translates to:
  /// **'Live vaccines (e.g., LaSota, B1 lentogenic) reduce losses; killed vaccines for certain situations.'**
  String get newcastle_disease_sections_treatment_and_vaccination_content_2;

  /// No description provided for @newcastle_disease_sections_treatment_and_vaccination_content_3.
  ///
  /// In en, this message translates to:
  /// **'Vaccination schedules vary by region and strain virulence.'**
  String get newcastle_disease_sections_treatment_and_vaccination_content_3;

  /// No description provided for @newcastle_disease_sections_prevention_title.
  ///
  /// In en, this message translates to:
  /// **'Prevention'**
  String get newcastle_disease_sections_prevention_title;

  /// No description provided for @newcastle_disease_sections_prevention_content_1.
  ///
  /// In en, this message translates to:
  /// **'Quarantine, biosecurity, vaccination crucial.'**
  String get newcastle_disease_sections_prevention_content_1;

  /// No description provided for @newcastle_disease_sections_prevention_content_2.
  ///
  /// In en, this message translates to:
  /// **'\'All in-all out\' farming, pest control, human traffic management, shed fumigation.'**
  String get newcastle_disease_sections_prevention_content_2;

  /// No description provided for @newcastle_disease_sections_prevention_content_3.
  ///
  /// In en, this message translates to:
  /// **'Disinfection with potassium permanganate, cresol, and formalin.'**
  String get newcastle_disease_sections_prevention_content_3;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @accuracy.
  ///
  /// In en, this message translates to:
  /// **'Accuracy'**
  String get accuracy;

  /// No description provided for @invalidImage.
  ///
  /// In en, this message translates to:
  /// **'Please input a valid image of chicken faeces'**
  String get invalidImage;

  /// No description provided for @diagnosisReportTitle.
  ///
  /// In en, this message translates to:
  /// **'Diagnosis Report'**
  String get diagnosisReportTitle;

  /// No description provided for @diagnosisReportTitle1.
  ///
  /// In en, this message translates to:
  /// **'Disease Detected'**
  String get diagnosisReportTitle1;

  /// No description provided for @diagnosisReportTitle2.
  ///
  /// In en, this message translates to:
  /// **'Generic Medicine'**
  String get diagnosisReportTitle2;

  /// No description provided for @diagnosisReportTitle3.
  ///
  /// In en, this message translates to:
  /// **'Severity Level'**
  String get diagnosisReportTitle3;

  /// No description provided for @diagnosisReportTitle4.
  ///
  /// In en, this message translates to:
  /// **'Death Rate'**
  String get diagnosisReportTitle4;

  /// No description provided for @diagnosisReportTitle5.
  ///
  /// In en, this message translates to:
  /// **'Prevention'**
  String get diagnosisReportTitle5;

  /// No description provided for @prevention_cocci.
  ///
  /// In en, this message translates to:
  /// **'Avoid overcrowding and use coccidiostats in feed'**
  String get prevention_cocci;

  /// No description provided for @prevention_healthy.
  ///
  /// In en, this message translates to:
  /// **'Clean water, balanced nutrition, and appropriate housing.'**
  String get prevention_healthy;

  /// No description provided for @prevention_ncd.
  ///
  /// In en, this message translates to:
  /// **'Administer recommended vaccines'**
  String get prevention_ncd;

  /// No description provided for @prevention_salmo.
  ///
  /// In en, this message translates to:
  /// **'Administer antibiotic treatment '**
  String get prevention_salmo;

  /// No description provided for @diseaseMap_cocci.
  ///
  /// In en, this message translates to:
  /// **'Coccidiosis'**
  String get diseaseMap_cocci;

  /// No description provided for @diseaseMap_healthy.
  ///
  /// In en, this message translates to:
  /// **'Healthy'**
  String get diseaseMap_healthy;

  /// No description provided for @diseaseMap_ncd.
  ///
  /// In en, this message translates to:
  /// **'Newcastle Disease'**
  String get diseaseMap_ncd;

  /// No description provided for @diseaseMap_salmo.
  ///
  /// In en, this message translates to:
  /// **'Salmonella infection'**
  String get diseaseMap_salmo;

  /// No description provided for @deathRate_cocci.
  ///
  /// In en, this message translates to:
  /// **'5% to 30%, in young or immunocompromised birds.'**
  String get deathRate_cocci;

  /// No description provided for @deathRate_healthy.
  ///
  /// In en, this message translates to:
  /// **'Not applicable'**
  String get deathRate_healthy;

  /// No description provided for @deathRate_ncd.
  ///
  /// In en, this message translates to:
  /// **'90% in unvaccinated flocks'**
  String get deathRate_ncd;

  /// No description provided for @deathRate_salmo.
  ///
  /// In en, this message translates to:
  /// **'5% to 30% in untreated cases'**
  String get deathRate_salmo;

  /// No description provided for @severity_cocci.
  ///
  /// In en, this message translates to:
  /// **'Decreased growth rates and egg production'**
  String get severity_cocci;

  /// No description provided for @severity_healthy.
  ///
  /// In en, this message translates to:
  /// **'Not Applicable'**
  String get severity_healthy;

  /// No description provided for @severity_ncd.
  ///
  /// In en, this message translates to:
  /// **'Highly contagious and can cause severe illness'**
  String get severity_ncd;

  /// No description provided for @severity_salmo.
  ///
  /// In en, this message translates to:
  /// **'Pose a risk of transmission to humans'**
  String get severity_salmo;

  /// No description provided for @medicine_cocci.
  ///
  /// In en, this message translates to:
  /// **'Sulfonamides or Ionophores like Amprolium.'**
  String get medicine_cocci;

  /// No description provided for @medicine_healthy.
  ///
  /// In en, this message translates to:
  /// **'Not Applicable'**
  String get medicine_healthy;

  /// No description provided for @medicine_ncd.
  ///
  /// In en, this message translates to:
  /// **'antiviral medications and antibiotics'**
  String get medicine_ncd;

  /// No description provided for @medicine_salmo.
  ///
  /// In en, this message translates to:
  /// **'Antibiotic Treatment'**
  String get medicine_salmo;

  /// No description provided for @slogan.
  ///
  /// In en, this message translates to:
  /// **'Snap a Shot to Secure the Flock'**
  String get slogan;

  /// No description provided for @contentdiseaseDetectedCocci.
  ///
  /// In en, this message translates to:
  /// **'Caused by Eimeria parasites, is a common enteric disease in poultry, impacting the global industry economically. It primarily affects young chickens, with varying severity from acute to subclinical.'**
  String get contentdiseaseDetectedCocci;

  /// No description provided for @contentdiseaseDetectedHealthy.
  ///
  /// In en, this message translates to:
  /// **''**
  String get contentdiseaseDetectedHealthy;

  /// No description provided for @contentdiseaseDetectedncd.
  ///
  /// In en, this message translates to:
  /// **'Newcastle Disease (ND), also known as Pseudo Plague, Asian Plague, or Ranikhet Disease, is a highly contagious viral infection affecting poultry worldwide. It is caused by Paramyxovirus-1 and manifests with respiratory, alimentary, and nervous symptoms in chickens, turkeys, pigeons, geese, and ducks.'**
  String get contentdiseaseDetectedncd;

  /// No description provided for @contentdiseaseDetectedSalmo.
  ///
  /// In en, this message translates to:
  /// **'Salmonellosis and Fowl Typhoid/Pullorum Disease are bacterial infections affecting poultry.'**
  String get contentdiseaseDetectedSalmo;

  /// No description provided for @contentgenericMedicineCocci.
  ///
  /// In en, this message translates to:
  /// **'Treatment options include drugs like Toltrazuril, Amprolium, and antibiotics, administered under veterinary supervision based on diagnosis and severity.'**
  String get contentgenericMedicineCocci;

  /// No description provided for @contentgenericMedicineHealthy.
  ///
  /// In en, this message translates to:
  /// **''**
  String get contentgenericMedicineHealthy;

  /// No description provided for @contentgenericMedicinencd.
  ///
  /// In en, this message translates to:
  /// **'There is no specific treatment for Newcastle Disease, but vaccination is crucial for prevention. Secondary bacterial infections may be managed with appropriate antibiotics.'**
  String get contentgenericMedicinencd;

  /// No description provided for @contentgenericMedicineSalmo.
  ///
  /// In en, this message translates to:
  /// **'Treatment options are limited, and focus mainly on supportive care. Prevention and biosecurity measures are crucial in controlling these diseases.'**
  String get contentgenericMedicineSalmo;

  /// No description provided for @contentseverityLevelCocci.
  ///
  /// In en, this message translates to:
  /// **'Coccidiosis severity ranges from mild to severe, with symptoms varying based on the Eimeria species and infection intensity. Caecal and intestinal coccidiosis can manifest with depression, diarrhea, weight loss, and mortality. Severe cases, caused by species like E. necatrix and E. tenella, can result in high morbidity and mortality rates.'**
  String get contentseverityLevelCocci;

  /// No description provided for @contentseverityLevelHealthy.
  ///
  /// In en, this message translates to:
  /// **''**
  String get contentseverityLevelHealthy;

  /// No description provided for @contentseverityLevelncd.
  ///
  /// In en, this message translates to:
  /// **'The severity of Newcastle Disease depends on the virulence of the infecting virus. Velogenic strains can lead to high morbidity and mortality rates, particularly in unvaccinated poultry.'**
  String get contentseverityLevelncd;

  /// No description provided for @contentseverityLevelSalmo.
  ///
  /// In en, this message translates to:
  /// **'Salmonellosis and Fowl Typhoid/Pullorum Disease can vary in severity depending on factors such as the virulence of the strain, age of the birds, and environmental stressor'**
  String get contentseverityLevelSalmo;

  /// No description provided for @contentdeathRateCocci.
  ///
  /// In en, this message translates to:
  /// **'Mortality rates in coccidiosis can be significant, reaching as high as 50% in severe cases. The mortality rate varies depending on the Eimeria species involved, the age and health status of the chickens, and the intensity of the infection.'**
  String get contentdeathRateCocci;

  /// No description provided for @contentdeathRateHealthy.
  ///
  /// In en, this message translates to:
  /// **''**
  String get contentdeathRateHealthy;

  /// No description provided for @contentdeathRatencd.
  ///
  /// In en, this message translates to:
  /// **'Mortality rates can reach 100% in unvaccinated chickens infected with velogenic strains.'**
  String get contentdeathRatencd;

  /// No description provided for @contentdeathRateSalmo.
  ///
  /// In en, this message translates to:
  /// **'Mortality rates can range from 15% to 80% in Salmonellosis, with the highest morbidity and death rates usually observed during the first 2 weeks after hatching. Mortality rates for Fowl Typhoid/Pullorum Disease can also be significant, particularly in young birds.'**
  String get contentdeathRateSalmo;

  /// No description provided for @contentprevensionCocci.
  ///
  /// In en, this message translates to:
  /// **'Good hygiene, maintaining dry litter, adequate spacing, quarantine for new birds, and disinfection using hydrogen peroxide. Live vaccines are also available but can be expensive and have limited efficacy.'**
  String get contentprevensionCocci;

  /// No description provided for @contentprevensionHealthy.
  ///
  /// In en, this message translates to:
  /// **''**
  String get contentprevensionHealthy;

  /// No description provided for @contentprevensionncd.
  ///
  /// In en, this message translates to:
  /// **'Quarantine, biosecurity measures, and vaccination. \'All in-all out\' farming practices, control of pests and human traffic, and isolation of infected flocks are recommended. Disinfection of humans entering farms and destruction of the virus by potassium permanganate, cresol, and formalin are essential. Fumigation of sheds with formalin and potassium permanganate mixture aids in preventing transmission.'**
  String get contentprevensionncd;

  /// No description provided for @contentprevensionSalmo.
  ///
  /// In en, this message translates to:
  /// **'Preventive measures include strict hygiene practices, rodent and bird control, disinfection of breeding eggs and incubators. Isolation of infected birds, exclusion of rodents, wild birds, and pets from poultry houses, and proper disposal of dead birds. Additionally, farms should implement isolation of symptomatic birds and disinfection of the entire farm with strong disinfectants. Maintaining clean and dry poultry feed, sourced from trusted suppliers, is essential for preventing disease spread.'**
  String get contentprevensionSalmo;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['bn', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
