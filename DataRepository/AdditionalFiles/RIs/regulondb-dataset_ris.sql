--- 
--- ## Query name:
--- regulondb-dataset_ris.txt
--- 
--- ## Scheme Version:
--- RegulonDB v10.10
--- 
--- ## Description:
--- Regulatory interaction dataset including interactions for tf-promoter, tf-transcription units and rf-gene
--- 
--- ## Author:
---     LuisJose 
---     Reviewed by : Hely Salgado
---
--- ## Requested by:
---     Paloma
--- 
--- ## Query Details
---    LibraryUtilities is a PLSQL API for Oracle DBMS

-- ri:tf-promoter
SELECT DISTINCT  
    'ri-tf-promoter'             AS RIType,
    ri.regulatory_interaction_id AS RIID,
    tf.transcription_factor_name AS TFName,
    cf.final_state               AS ConformationName,
    p.promoter_id                AS TargetID, 
    p.promoter_name              AS TargetName,
    'promoter'                   AS TargetType,
    ri.ri_function               AS Function, 
    LibraryUtilities.get_all_data_evidence_list(ri.regulatory_interaction_id) AS RIEvidences, 
    ri.site_id                   AS SiteID,
    LibraryUtilities.get_ecocyc_id(ri.site_id)  AS EcocycSiteID,
    ri.center_position           AS RelativeDistanceSiteToPm,    -- distancia relativa del sitio al promotor
    s.site_absolute_center_position AS SiteAbsCenterPosition,
    LibraryUtilities.get_all_data_evidence_list(ri.site_id) AS SiteEvidences,
    ri.ri_dist_first_gene        AS DistanceRItoFirstGene,  -- hay que ser mas especifico, posicion central del sitio
    p.pos_1                      AS TSS, 
    p.promoter_strand            AS Strand,
    g.gene_posleft               AS GenePosLeft,
    g.gene_posright              AS GenePosRight,
    null                         AS DistanceSiteToPm,  --- relative_dist_to_promoter, porque son NULL ? el center position es la distancia al TSS
    null                         AS DistSiteToGene,    --- relative_dist_to_gene,
    LibraryUtilities.get_first_gene_name_tu(tu.transcription_unit_id)     AS TUFirstGeneName,
    LibraryUtilities.Get_Syns_In_One_Row(LibraryUtilities.get_first_gene_tu(tu.transcription_unit_id), ', ')  AS TUFirstGeneSynonyms,
    LibraryUtilities.Get_Syns_In_One_Row(tf.transcription_factor_id, ', ')   AS  TFSynonyms,
    LibraryUtilities.Get_Syns_In_One_Row(cf.conformation_id, ' | ')          AS  TFConformationSynonyms,
    LibraryUtilities.get_all_data_evidence_list(tf.transcription_factor_id)  AS  TFEvidences,
    LibraryUtilities.get_all_data_evidence_list(cf.conformation_id)          AS  TFConformationEvidences
FROM  transcription_factor tf, 
      conformation cf, 
      regulatory_interaction ri, 
      site s,
      promoter p, 
      transcription_unit tu, 
      gene g
WHERE ri.conformation_id = cf.conformation_id
      AND cf.transcription_factor_id = tf.transcription_factor_id
      AND ri.promoter_id = p.promoter_id
      AND p.promoter_id = tu.promoter_id
      AND ri.ri_first_gene_id = g.GENE_ID (+)
      AND ri.site_id = s.site_id

UNION
-- ri:tf-gene
SELECT DISTINCT 
    'ri-tf-gene'                 AS RIType,
    tg.regulatory_interaction_id AS RIID,
    tf.transcription_factor_name AS TFName,
    cf.final_state               AS ConformationName,
    g.gene_id                    AS TargetID, 
    g.gene_name                  AS TargetName,
    'gene'                       AS TargetType,
    tg.ri_function               AS Function, 
    LibraryUtilities.get_all_data_evidence_list(tg.regulatory_interaction_id) AS RIEvidences, 
    tg.site_id                   AS SiteID,
    LibraryUtilities.get_ecocyc_id(tg.site_id)  AS EcocycSiteID,
    tg.center_position           AS RelativeDistanceSiteToPm,    -- distancia relativa del sitio al promotor
    s.site_absolute_center_position AS SiteAbsCenterPosition,
    LibraryUtilities.get_all_data_evidence_list(tg.site_id) AS SiteEvidences,
    tg.ri_dist_first_gene        AS DistanceRItoFirstGene,  -- hay que ser mas especifico, posicion central del sitio
    null                         AS TSS, 
    g.gene_strand                AS Strand,
    g.gene_posleft               AS GenePosLeft,
    g.gene_posright              AS GenePosRight,
    null                         AS DistanceSiteToPm,  --- relative_dist_to_promoter, porque son NULL ? el center position es la distancia al TSS
    null                         AS DistSiteToGene,    --- relative_dist_to_gene,
    -- LibraryUtilities.get_first_gene_name_tu(tu.transcription_unit_id)     AS TUFirstGeneName,
    null                         AS TUFirstGeneName,
    LibraryUtilities.Get_Syns_In_One_Row(g.gene_id, ', ')  AS TUFirstGeneSynonyms,
    LibraryUtilities.Get_Syns_In_One_Row(tf.transcription_factor_id, ', ')   AS  TFSynonyms,
    LibraryUtilities.Get_Syns_In_One_Row(cf.conformation_id, ' | ')          AS  TFConformationSynonyms,
    LibraryUtilities.get_all_data_evidence_list(tf.transcription_factor_id)  AS  TFEvidences,
    LibraryUtilities.get_all_data_evidence_list(cf.conformation_id)          AS  TFConformationEvidences
FROM   tf_gene_interaction tg,
       gene g,
       conformation cf,
       transcription_factor tf, 
       site s
WHERE tg.conformation_id = cf.conformation_id
      AND cf.transcription_factor_id = tf.transcription_factor_id
      AND tg.object_id = g.gene_id
      AND tg.site_id = s.site_id(+)

UNION
-- ri:tf-tu
SELECT DISTINCT 
    'ri-tf-tu'                 AS RIType,
    tg.regulatory_interaction_id AS RIID,
    tf.transcription_factor_name AS TFName,
    cf.final_state               AS ConformationName,
    tu.transcription_unit_id     AS TargetID, 
    tu.transcription_unit_name   AS TargetName,
    'tu'                         AS TargetType,
    tg.ri_function               AS Function, 
    LibraryUtilities.get_all_data_evidence_list(tg.regulatory_interaction_id) AS RIEvidences, 
    tg.site_id                   AS SiteID,
    LibraryUtilities.get_ecocyc_id(tg.site_id)  AS EcocycSiteID,
    tg.center_position           AS RelativeDistanceSiteToPm,    -- distancia relativa del sitio al promotor
    s.site_absolute_center_position AS SiteAbsCenterPosition,
    LibraryUtilities.get_all_data_evidence_list(tg.site_id) AS SiteEvidences,
    tg.ri_dist_first_gene        AS DistanceRItoFirstGene,  -- hay que ser mas especifico, posicion central del sitio
    null                         AS TSS, 
    null                         AS Strand,
    null                         AS GenePosLeft,
    null                         AS GenePosRight,
    null                         AS DistanceSiteToPm,  --- relative_dist_to_promoter, porque son NULL ? el center position es la distancia al TSS
    null                         AS DistSiteToGene,    --- relative_dist_to_gene,
    LibraryUtilities.get_first_gene_name_tu(tu.transcription_unit_id)     AS TUFirstGeneName,
    LibraryUtilities.Get_Syns_In_One_Row(LibraryUtilities.get_first_gene_tu(tu.transcription_unit_id), ', ')  AS TUFirstGeneSynonyms,
    LibraryUtilities.Get_Syns_In_One_Row(tf.transcription_factor_id, ', ')   AS  TFSynonyms,
    LibraryUtilities.Get_Syns_In_One_Row(cf.conformation_id, ' | ')          AS  TFConformationSynonyms,
    LibraryUtilities.get_all_data_evidence_list(tf.transcription_factor_id)  AS  TFEvidences,
    LibraryUtilities.get_all_data_evidence_list(cf.conformation_id)          AS  TFConformationEvidences
FROM tf_gene_interaction tg, 
    transcription_unit tu, 
    conformation cf, 
    transcription_factor tf, 
    site s
WHERE tg.conformation_id = cf.conformation_id
    AND cf.transcription_factor_id = tf.transcription_factor_id
    AND tg.object_id = tu.transcription_unit_id
    AND tg.site_id = s.site_id(+)

ORDER BY RIType, TFName, ConformationName, TargetName