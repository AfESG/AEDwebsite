drop view estimates;

create or replace view estimates as

select 'AS'||survey_aerial_sample_count_strata.id input_zone_id, population_submission_id, site_name, stratum_name, completion_year, population_estimate, population_variance, population_confidence_interval from survey_aerial_sample_count_strata join survey_aerial_sample_counts on survey_aerial_sample_counts.id=survey_aerial_sample_count_id join population_submissions on population_submissions.id=population_submission_id

union

select 'AT'||survey_aerial_total_count_strata.id input_zone_id, population_submission_id, site_name, stratum_name, completion_year, population_estimate, population_variance, population_confidence_interval from survey_aerial_total_count_strata join survey_aerial_total_counts on survey_aerial_total_counts.id=survey_aerial_total_count_id join population_submissions on population_submissions.id=population_submission_id

union

select 'GS'||survey_ground_sample_count_strata.id input_zone_id, population_submission_id, site_name, stratum_name, completion_year, population_estimate, population_variance, population_confidence_interval from survey_ground_sample_count_strata join survey_ground_sample_counts on survey_ground_sample_counts.id=survey_ground_sample_count_id join population_submissions on population_submissions.id=population_submission_id

union

select 'GT'||survey_ground_total_count_strata.id input_zone_id, population_submission_id, site_name, stratum_name, completion_year, population_estimate, population_variance, population_confidence_interval from survey_ground_total_count_strata join survey_ground_total_counts on survey_ground_total_counts.id=survey_ground_total_count_id join population_submissions on population_submissions.id=population_submission_id

union

select 'DC'||survey_dung_count_line_transect_strata.id input_zone_id, population_submission_id, site_name, stratum_name, completion_year, population_estimate, population_variance, population_confidence_interval from survey_dung_count_line_transect_strata join survey_dung_count_line_transects on survey_dung_count_line_transects.id=survey_dung_count_line_transect_id join population_submissions on population_submissions.id=population_submission_id

union

select 'GD'||survey_faecal_dna_strata.id input_zone_id, population_submission_id, site_name, stratum_name, completion_year, population_estimate, population_variance, population_confidence_interval from survey_faecal_dna_strata join survey_faecal_dnas on survey_faecal_dnas.id=survey_faecal_dna_id join population_submissions on population_submissions.id=population_submission_id

union

select 'IR'||survey_individual_registrations.id input_zone_id, population_submission_id, site_name, '', completion_year, population_estimate, null, null from survey_individual_registrations join population_submissions on population_submissions.id=population_submission_id

union

select 'O'||survey_others.id input_zone_id, population_submission_id, site_name, '', completion_year, population_estimate_min, null, null from survey_others join population_submissions on population_submissions.id=population_submission_id

;
