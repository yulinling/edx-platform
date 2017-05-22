-- MySQL dump 10.13  Distrib 5.6.32, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: edxtest
-- ------------------------------------------------------
-- Server version	5.6.32-1+deb.sury.org~xenial+0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-05-22 21:00:52.966929'),(2,'auth','0001_initial','2017-05-22 21:00:53.197033'),(3,'admin','0001_initial','2017-05-22 21:00:53.277034'),(4,'sites','0001_initial','2017-05-22 21:00:53.299914'),(5,'contenttypes','0002_remove_content_type_name','2017-05-22 21:00:53.480029'),(6,'api_admin','0001_initial','2017-05-22 21:00:53.634266'),(7,'api_admin','0002_auto_20160325_1604','2017-05-22 21:00:53.649728'),(8,'api_admin','0003_auto_20160404_1618','2017-05-22 21:00:54.133135'),(9,'api_admin','0004_auto_20160412_1506','2017-05-22 21:00:54.459838'),(10,'api_admin','0005_auto_20160414_1232','2017-05-22 21:00:54.502427'),(11,'api_admin','0006_catalog','2017-05-22 21:00:54.510325'),(12,'assessment','0001_initial','2017-05-22 21:00:56.900728'),(13,'assessment','0002_staffworkflow','2017-05-22 21:00:56.954531'),(14,'auth','0002_alter_permission_name_max_length','2017-05-22 21:00:57.065277'),(15,'auth','0003_alter_user_email_max_length','2017-05-22 21:00:57.168959'),(16,'auth','0004_alter_user_username_opts','2017-05-22 21:00:57.259526'),(17,'auth','0005_alter_user_last_login_null','2017-05-22 21:00:57.354931'),(18,'auth','0006_require_contenttypes_0002','2017-05-22 21:00:57.356849'),(19,'instructor_task','0001_initial','2017-05-22 21:00:57.486583'),(20,'certificates','0001_initial','2017-05-22 21:00:58.644227'),(21,'certificates','0002_data__certificatehtmlviewconfiguration_data','2017-05-22 21:00:58.661692'),(22,'certificates','0003_data__default_modes','2017-05-22 21:00:58.817861'),(23,'certificates','0004_certificategenerationhistory','2017-05-22 21:00:58.907890'),(24,'certificates','0005_auto_20151208_0801','2017-05-22 21:00:59.053405'),(25,'certificates','0006_certificatetemplateasset_asset_slug','2017-05-22 21:00:59.085480'),(26,'certificates','0007_certificateinvalidation','2017-05-22 21:00:59.253726'),(27,'badges','0001_initial','2017-05-22 21:00:59.608444'),(28,'badges','0002_data__migrate_assertions','2017-05-22 21:00:59.648273'),(29,'badges','0003_schema__add_event_configuration','2017-05-22 21:00:59.989983'),(30,'block_structure','0001_config','2017-05-22 21:01:00.183084'),(31,'block_structure','0002_blockstructuremodel','2017-05-22 21:01:00.211972'),(32,'block_structure','0003_blockstructuremodel_storage','2017-05-22 21:01:00.234699'),(33,'block_structure','0004_blockstructuremodel_usagekeywithrun','2017-05-22 21:01:00.258916'),(34,'bookmarks','0001_initial','2017-05-22 21:01:00.895763'),(35,'branding','0001_initial','2017-05-22 21:01:01.354118'),(36,'course_modes','0001_initial','2017-05-22 21:01:01.515117'),(37,'course_modes','0002_coursemode_expiration_datetime_is_explicit','2017-05-22 21:01:01.562308'),(38,'course_modes','0003_auto_20151113_1443','2017-05-22 21:01:01.593218'),(39,'course_modes','0004_auto_20151113_1457','2017-05-22 21:01:01.881129'),(40,'course_modes','0005_auto_20151217_0958','2017-05-22 21:01:01.913824'),(41,'course_modes','0006_auto_20160208_1407','2017-05-22 21:01:02.120903'),(42,'course_modes','0007_coursemode_bulk_sku','2017-05-22 21:01:02.156804'),(43,'course_groups','0001_initial','2017-05-22 21:01:06.904300'),(44,'bulk_email','0001_initial','2017-05-22 21:01:07.269462'),(45,'bulk_email','0002_data__load_course_email_template','2017-05-22 21:01:07.402290'),(46,'bulk_email','0003_config_model_feature_flag','2017-05-22 21:01:07.518500'),(47,'bulk_email','0004_add_email_targets','2017-05-22 21:01:07.900700'),(48,'bulk_email','0005_move_target_data','2017-05-22 21:01:07.921555'),(49,'bulk_email','0006_course_mode_targets','2017-05-22 21:01:08.167362'),(50,'catalog','0001_initial','2017-05-22 21:01:08.295372'),(51,'catalog','0002_catalogintegration_username','2017-05-22 21:01:08.428244'),(52,'catalog','0003_catalogintegration_page_size','2017-05-22 21:01:08.557962'),(53,'django_comment_common','0001_initial','2017-05-22 21:01:08.900199'),(54,'django_comment_common','0002_forumsconfig','2017-05-22 21:01:09.050847'),(55,'verified_track_content','0001_initial','2017-05-22 21:01:09.080048'),(56,'course_overviews','0001_initial','2017-05-22 21:01:09.145843'),(57,'course_overviews','0002_add_course_catalog_fields','2017-05-22 21:01:09.307024'),(58,'course_overviews','0003_courseoverviewgeneratedhistory','2017-05-22 21:01:09.333223'),(59,'course_overviews','0004_courseoverview_org','2017-05-22 21:01:09.372697'),(60,'course_overviews','0005_delete_courseoverviewgeneratedhistory','2017-05-22 21:01:09.393047'),(61,'course_overviews','0006_courseoverviewimageset','2017-05-22 21:01:09.439250'),(62,'course_overviews','0007_courseoverviewimageconfig','2017-05-22 21:01:09.596507'),(63,'course_overviews','0008_remove_courseoverview_facebook_url','2017-05-22 21:01:09.600712'),(64,'course_overviews','0009_readd_facebook_url','2017-05-22 21:01:09.604975'),(65,'course_overviews','0010_auto_20160329_2317','2017-05-22 21:01:09.679827'),(66,'ccx','0001_initial','2017-05-22 21:01:10.185392'),(67,'ccx','0002_customcourseforedx_structure_json','2017-05-22 21:01:10.339468'),(68,'ccx','0003_add_master_course_staff_in_ccx','2017-05-22 21:01:10.357854'),(69,'ccx','0004_seed_forum_roles_in_ccx_courses','2017-05-22 21:01:10.376096'),(70,'ccx','0005_change_ccx_coach_to_staff','2017-05-22 21:01:10.394775'),(71,'ccxcon','0001_initial_ccxcon_model','2017-05-22 21:01:10.424787'),(72,'ccxcon','0002_auto_20160325_0407','2017-05-22 21:01:10.448060'),(73,'djcelery','0001_initial','2017-05-22 21:01:10.769032'),(74,'celery_utils','0001_initial','2017-05-22 21:01:10.830174'),(75,'celery_utils','0002_chordable_django_backend','2017-05-22 21:01:10.908555'),(76,'certificates','0008_schema__remove_badges','2017-05-22 21:01:11.261016'),(77,'commerce','0001_data__add_ecommerce_service_user','2017-05-22 21:01:11.287087'),(78,'commerce','0002_commerceconfiguration','2017-05-22 21:01:11.450748'),(79,'commerce','0003_auto_20160329_0709','2017-05-22 21:01:11.604357'),(80,'commerce','0004_auto_20160531_0950','2017-05-22 21:01:11.945946'),(81,'commerce','0005_commerceconfiguration_enable_automatic_refund_approval','2017-05-22 21:01:12.125185'),(82,'commerce','0006_auto_20170424_1734','2017-05-22 21:01:12.290811'),(83,'contentserver','0001_initial','2017-05-22 21:01:12.474780'),(84,'contentserver','0002_cdnuseragentsconfig','2017-05-22 21:01:12.672680'),(85,'cors_csrf','0001_initial','2017-05-22 21:01:12.861951'),(86,'course_action_state','0001_initial','2017-05-22 21:01:13.272324'),(87,'course_groups','0002_change_inline_default_cohort_value','2017-05-22 21:01:13.298920'),(88,'course_overviews','0011_courseoverview_marketing_url','2017-05-22 21:01:13.341868'),(89,'course_overviews','0012_courseoverview_eligible_for_financial_aid','2017-05-22 21:01:13.380433'),(90,'course_structures','0001_initial','2017-05-22 21:01:13.410469'),(91,'coursetalk','0001_initial','2017-05-22 21:01:13.606529'),(92,'coursetalk','0002_auto_20160325_0631','2017-05-22 21:01:13.795131'),(93,'courseware','0001_initial','2017-05-22 21:01:16.490873'),(94,'coursewarehistoryextended','0001_initial','2017-05-22 21:01:16.706363'),(95,'coursewarehistoryextended','0002_force_studentmodule_index','2017-05-22 21:01:16.902337'),(96,'crawlers','0001_initial','2017-05-22 21:01:17.112712'),(97,'crawlers','0002_auto_20170419_0018','2017-05-22 21:01:17.310789'),(98,'credentials','0001_initial','2017-05-22 21:01:17.531728'),(99,'credentials','0002_auto_20160325_0631','2017-05-22 21:01:17.745543'),(100,'credit','0001_initial','2017-05-22 21:01:19.523620'),(101,'credit','0002_creditconfig','2017-05-22 21:01:19.784219'),(102,'credit','0003_auto_20160511_2227','2017-05-22 21:01:20.052917'),(103,'dark_lang','0001_initial','2017-05-22 21:01:20.340977'),(104,'dark_lang','0002_data__enable_on_install','2017-05-22 21:01:20.368849'),(105,'database_fixups','0001_initial','2017-05-22 21:01:20.402191'),(106,'django_comment_common','0003_enable_forums','2017-05-22 21:01:20.429209'),(107,'django_comment_common','0004_auto_20161117_1209','2017-05-22 21:01:20.700748'),(108,'django_notify','0001_initial','2017-05-22 21:01:22.063156'),(109,'django_openid_auth','0001_initial','2017-05-22 21:01:22.483899'),(110,'oauth2','0001_initial','2017-05-22 21:01:24.754219'),(111,'edx_oauth2_provider','0001_initial','2017-05-22 21:01:25.234803'),(112,'edx_proctoring','0001_initial','2017-05-22 21:01:33.698336'),(113,'edx_proctoring','0002_proctoredexamstudentattempt_is_status_acknowledged','2017-05-22 21:01:38.146078'),(114,'edx_proctoring','0003_auto_20160101_0525','2017-05-22 21:01:38.656142'),(115,'edx_proctoring','0004_auto_20160201_0523','2017-05-22 21:01:38.927489'),(116,'edx_proctoring','0005_proctoredexam_hide_after_due','2017-05-22 21:01:39.209897'),(117,'edxval','0001_initial','2017-05-22 21:01:39.709375'),(118,'edxval','0002_data__default_profiles','2017-05-22 21:01:39.747380'),(119,'edxval','0003_coursevideo_is_hidden','2017-05-22 21:01:39.802755'),(120,'edxval','0004_data__add_hls_profile','2017-05-22 21:01:39.839882'),(121,'email_marketing','0001_initial','2017-05-22 21:01:40.139757'),(122,'email_marketing','0002_auto_20160623_1656','2017-05-22 21:01:43.057231'),(123,'email_marketing','0003_auto_20160715_1145','2017-05-22 21:01:45.113911'),(124,'email_marketing','0004_emailmarketingconfiguration_welcome_email_send_delay','2017-05-22 21:01:45.481185'),(125,'embargo','0001_initial','2017-05-22 21:01:46.619565'),(126,'embargo','0002_data__add_countries','2017-05-22 21:01:46.960373'),(127,'enterprise','0001_initial','2017-05-22 21:01:47.505483'),(128,'enterprise','0002_enterprisecustomerbrandingconfiguration','2017-05-22 21:01:47.575579'),(129,'enterprise','0003_auto_20161104_0937','2017-05-22 21:01:49.057342'),(130,'enterprise','0004_auto_20161114_0434','2017-05-22 21:01:50.001555'),(131,'enterprise','0005_pendingenterprisecustomeruser','2017-05-22 21:01:50.579966'),(132,'enterprise','0006_auto_20161121_0241','2017-05-22 21:01:51.258117'),(133,'enterprise','0007_auto_20161109_1511','2017-05-22 21:01:52.795866'),(134,'enterprise','0008_auto_20161124_2355','2017-05-22 21:01:54.998240'),(135,'enterprise','0009_auto_20161130_1651','2017-05-22 21:01:58.938991'),(136,'enterprise','0010_auto_20161222_1212','2017-05-22 21:02:00.261879'),(137,'enterprise','0011_enterprisecustomerentitlement_historicalenterprisecustomerentitlement','2017-05-22 21:02:01.820734'),(138,'enterprise','0012_auto_20170125_1033','2017-05-22 21:02:03.260364'),(139,'enterprise','0013_auto_20170125_1157','2017-05-22 21:02:05.587206'),(140,'enterprise','0014_enrollmentnotificationemailtemplate_historicalenrollmentnotificationemailtemplate','2017-05-22 21:02:07.046624'),(141,'enterprise','0015_auto_20170130_0003','2017-05-22 21:02:08.490877'),(142,'enterprise','0016_auto_20170405_0647','2017-05-22 21:02:18.610051'),(143,'enterprise','0017_auto_20170508_1341','2017-05-22 21:02:21.347766'),(144,'external_auth','0001_initial','2017-05-22 21:02:23.108593'),(145,'grades','0001_initial','2017-05-22 21:02:23.320223'),(146,'grades','0002_rename_last_edited_field','2017-05-22 21:02:23.375329'),(147,'grades','0003_coursepersistentgradesflag_persistentgradesenabledflag','2017-05-22 21:02:24.971938'),(148,'grades','0004_visibleblocks_course_id','2017-05-22 21:02:25.037149'),(149,'grades','0005_multiple_course_flags','2017-05-22 21:02:25.831049'),(150,'grades','0006_persistent_course_grades','2017-05-22 21:02:25.930653'),(151,'grades','0007_add_passed_timestamp_column','2017-05-22 21:02:26.030234'),(152,'grades','0008_persistentsubsectiongrade_first_attempted','2017-05-22 21:02:26.092348'),(153,'grades','0009_auto_20170111_1507','2017-05-22 21:02:26.201289'),(154,'grades','0010_auto_20170112_1156','2017-05-22 21:02:26.257120'),(155,'grades','0011_null_edited_time','2017-05-22 21:02:26.433761'),(156,'grades','0012_computegradessetting','2017-05-22 21:02:27.278004'),(157,'integrated_channel','0001_initial','2017-05-22 21:02:27.382803'),(158,'lms_xblock','0001_initial','2017-05-22 21:02:28.279335'),(159,'microsite_configuration','0001_initial','2017-05-22 21:02:36.215350'),(160,'microsite_configuration','0002_auto_20160202_0228','2017-05-22 21:02:38.231893'),(161,'milestones','0001_initial','2017-05-22 21:02:39.198989'),(162,'milestones','0002_data__seed_relationship_types','2017-05-22 21:02:39.251677'),(163,'milestones','0003_coursecontentmilestone_requirements','2017-05-22 21:02:39.456898'),(164,'milestones','0004_auto_20151221_1445','2017-05-22 21:02:39.831251'),(165,'mobile_api','0001_initial','2017-05-22 21:02:40.899708'),(166,'mobile_api','0002_auto_20160406_0904','2017-05-22 21:02:41.008377'),(167,'mobile_api','0003_ignore_mobile_available_flag','2017-05-22 21:02:43.130691'),(168,'notes','0001_initial','2017-05-22 21:02:44.109098'),(169,'oauth2','0002_auto_20160404_0813','2017-05-22 21:02:49.164759'),(170,'oauth2','0003_client_logout_uri','2017-05-22 21:02:49.626461'),(171,'oauth2','0004_add_index_on_grant_expires','2017-05-22 21:02:50.125582'),(172,'oauth2_provider','0001_initial','2017-05-22 21:02:52.278437'),(173,'oauth2_provider','0002_08_updates','2017-05-22 21:02:54.143518'),(174,'oauth_dispatch','0001_initial','2017-05-22 21:02:54.736443'),(175,'oauth_provider','0001_initial','2017-05-22 21:02:56.218740'),(176,'organizations','0001_initial','2017-05-22 21:02:56.438341'),(177,'organizations','0002_auto_20170117_1434','2017-05-22 21:02:56.507523'),(178,'organizations','0003_auto_20170221_1138','2017-05-22 21:02:56.640079'),(179,'organizations','0004_auto_20170413_2315','2017-05-22 21:02:56.764783'),(180,'programs','0001_initial','2017-05-22 21:02:57.668080'),(181,'programs','0002_programsapiconfig_cache_ttl','2017-05-22 21:02:58.562632'),(182,'programs','0003_auto_20151120_1613','2017-05-22 21:03:02.875118'),(183,'programs','0004_programsapiconfig_enable_certification','2017-05-22 21:03:03.819946'),(184,'programs','0005_programsapiconfig_max_retries','2017-05-22 21:03:04.856444'),(185,'programs','0006_programsapiconfig_xseries_ad_enabled','2017-05-22 21:03:05.971590'),(186,'programs','0007_programsapiconfig_program_listing_enabled','2017-05-22 21:03:06.984230'),(187,'programs','0008_programsapiconfig_program_details_enabled','2017-05-22 21:03:08.111328'),(188,'programs','0009_programsapiconfig_marketing_path','2017-05-22 21:03:09.160092'),(189,'programs','0010_auto_20170204_2332','2017-05-22 21:03:11.331151'),(190,'programs','0011_auto_20170301_1844','2017-05-22 21:03:25.787981'),(191,'programs','0012_auto_20170419_0018','2017-05-22 21:03:26.703469'),(192,'redirects','0001_initial','2017-05-22 21:03:27.678835'),(193,'rss_proxy','0001_initial','2017-05-22 21:03:27.737918'),(194,'sap_success_factors','0001_initial','2017-05-22 21:03:33.694304'),(195,'sap_success_factors','0002_auto_20170224_1545','2017-05-22 21:03:36.585301'),(196,'sap_success_factors','0003_auto_20170317_1402','2017-05-22 21:03:38.028984'),(197,'sap_success_factors','0004_catalogtransmissionaudit_audit_summary','2017-05-22 21:03:38.090356'),(198,'self_paced','0001_initial','2017-05-22 21:03:38.728005'),(199,'sessions','0001_initial','2017-05-22 21:03:38.788596'),(200,'student','0001_initial','2017-05-22 21:04:05.332145'),(201,'shoppingcart','0001_initial','2017-05-22 21:04:30.191143'),(202,'shoppingcart','0002_auto_20151208_1034','2017-05-22 21:04:32.702837'),(203,'shoppingcart','0003_auto_20151217_0958','2017-05-22 21:04:35.457947'),(204,'site_configuration','0001_initial','2017-05-22 21:04:38.150986'),(205,'site_configuration','0002_auto_20160720_0231','2017-05-22 21:04:41.256070'),(206,'default','0001_initial','2017-05-22 21:04:44.229637'),(207,'default','0002_add_related_name','2017-05-22 21:04:45.765300'),(208,'default','0003_alter_email_max_length','2017-05-22 21:04:45.853400'),(209,'default','0004_auto_20160423_0400','2017-05-22 21:04:47.312553'),(210,'social_auth','0005_auto_20160727_2333','2017-05-22 21:04:47.378859'),(211,'splash','0001_initial','2017-05-22 21:04:48.872471'),(212,'static_replace','0001_initial','2017-05-22 21:04:50.689091'),(213,'static_replace','0002_assetexcludedextensionsconfig','2017-05-22 21:04:52.322905'),(214,'status','0001_initial','2017-05-22 21:04:55.694689'),(215,'student','0002_auto_20151208_1034','2017-05-22 21:05:02.521190'),(216,'student','0003_auto_20160516_0938','2017-05-22 21:05:03.776011'),(217,'student','0004_auto_20160531_1422','2017-05-22 21:05:04.462516'),(218,'student','0005_auto_20160531_1653','2017-05-22 21:05:05.326296'),(219,'student','0006_logoutviewconfiguration','2017-05-22 21:05:06.121624'),(220,'student','0007_registrationcookieconfiguration','2017-05-22 21:05:06.932485'),(221,'student','0008_auto_20161117_1209','2017-05-22 21:05:07.804130'),(222,'student','0009_auto_20170111_0422','2017-05-22 21:05:08.801737'),(223,'student','0010_auto_20170207_0458','2017-05-22 21:05:08.812268'),(224,'submissions','0001_initial','2017-05-22 21:05:09.516966'),(225,'submissions','0002_auto_20151119_0913','2017-05-22 21:05:09.711460'),(226,'submissions','0003_submission_status','2017-05-22 21:05:09.817137'),(227,'survey','0001_initial','2017-05-22 21:05:11.188788'),(228,'teams','0001_initial','2017-05-22 21:05:15.310558'),(229,'theming','0001_initial','2017-05-22 21:05:16.710433'),(230,'third_party_auth','0001_initial','2017-05-22 21:05:23.767973'),(231,'third_party_auth','0002_schema__provider_icon_image','2017-05-22 21:05:32.293645'),(232,'third_party_auth','0003_samlproviderconfig_debug_mode','2017-05-22 21:05:33.832030'),(233,'third_party_auth','0004_add_visible_field','2017-05-22 21:05:46.195695'),(234,'third_party_auth','0005_add_site_field','2017-05-22 21:05:51.962544'),(235,'third_party_auth','0006_samlproviderconfig_automatic_refresh_enabled','2017-05-22 21:05:53.645723'),(236,'third_party_auth','0007_auto_20170406_0912','2017-05-22 21:05:56.545136'),(237,'third_party_auth','0008_auto_20170413_1455','2017-05-22 21:06:00.740391'),(238,'third_party_auth','0009_auto_20170415_1144','2017-05-22 21:06:05.735728'),(239,'third_party_auth','0010_add_skip_hinted_login_dialog_field','2017-05-22 21:06:10.098290'),(240,'track','0001_initial','2017-05-22 21:06:10.176802'),(241,'user_api','0001_initial','2017-05-22 21:06:19.607335'),(242,'util','0001_initial','2017-05-22 21:06:21.074636'),(243,'util','0002_data__default_rate_limit_config','2017-05-22 21:06:21.132366'),(244,'verified_track_content','0002_verifiedtrackcohortedcourse_verified_cohort_name','2017-05-22 21:06:21.208652'),(245,'verify_student','0001_initial','2017-05-22 21:06:40.359306'),(246,'verify_student','0002_auto_20151124_1024','2017-05-22 21:06:41.291573'),(247,'verify_student','0003_auto_20151113_1443','2017-05-22 21:06:42.290268'),(248,'video_config','0001_initial','2017-05-22 21:06:44.574313'),(249,'waffle','0001_initial','2017-05-22 21:06:46.164038'),(250,'wiki','0001_initial','2017-05-22 21:07:29.031020'),(251,'wiki','0002_remove_article_subscription','2017-05-22 21:07:29.101828'),(252,'wiki','0003_ip_address_conv','2017-05-22 21:07:33.823133'),(253,'wiki','0004_increase_slug_size','2017-05-22 21:07:35.451048'),(254,'workflow','0001_initial','2017-05-22 21:07:35.729906'),(255,'xblock_django','0001_initial','2017-05-22 21:07:37.322722'),(256,'xblock_django','0002_auto_20160204_0809','2017-05-22 21:07:38.967309'),(257,'xblock_django','0003_add_new_config_models','2017-05-22 21:07:44.032685'),(258,'xblock_django','0004_delete_xblock_disable_config','2017-05-22 21:07:45.892416'),(259,'social_auth','0001_initial','2017-05-22 21:07:45.910625'),(260,'social_auth','0003_alter_email_max_length','2017-05-22 21:07:45.919974'),(261,'social_auth','0002_add_related_name','2017-05-22 21:07:45.938823'),(262,'social_auth','0004_auto_20160423_0400','2017-05-22 21:07:45.947600'),(263,'contentstore','0001_initial','2017-05-22 21:08:38.907935'),(264,'course_creators','0001_initial','2017-05-22 21:08:38.986722'),(265,'tagging','0001_initial','2017-05-22 21:08:39.122311'),(266,'tagging','0002_auto_20170116_1541','2017-05-22 21:08:39.460580'),(267,'user_tasks','0001_initial','2017-05-22 21:08:40.126605'),(268,'user_tasks','0002_artifact_file_storage','2017-05-22 21:08:40.451806'),(269,'xblock_config','0001_initial','2017-05-22 21:08:40.886605'),(270,'xblock_config','0002_courseeditltifieldsenabledflag','2017-05-22 21:08:41.373181');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-22 21:08:50
