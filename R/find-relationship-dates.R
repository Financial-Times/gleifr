

clean_lei_relationship_dates <- function(raw_lei_relationships){

	base_lei_rel <- raw_lei_relationships %>%
		dplyr::mutate(row_id = dplyr::row_number())

	p1 <- base_lei_rel %>%
		dplyr::select(row_id,
									start_date = Relationship.Period.1.startDate,
									end_date = Relationship.Period.1.endDate,
									period_type = Relationship.Period.1.periodType)

	p2 <- base_lei_rel %>%
		dplyr::select(row_id,
									start_date = Relationship.Period.2.startDate,
									end_date = Relationship.Period.2.endDate,
									period_type = Relationship.Period.2.periodType)

	p3 <- base_lei_rel %>%
		dplyr::select(row_id,
									start_date = Relationship.Period.3.startDate,
									end_date = Relationship.Period.3.endDate,
									period_type = Relationship.Period.3.periodType)

	p4 <- base_lei_rel %>%
		dplyr::select(row_id,
									start_date = Relationship.Period.4.startDate,
									end_date = Relationship.Period.4.endDate,
									Relationship.Period.4.periodType)

	p5 <- base_lei_rel %>%
		dplyr::select(row_id,
									start_date = Relationship.Period.5.startDate,
									end_date = Relationship.Period.5.endDate,
									period_type = Relationship.Period.5.periodType)

	rel_dates <- dplyr::bind_rows(p1,p2,p3,p4,p5) %>%
		dplyr::filter(period_type == "RELATIONSHIP_PERIOD") %>%
		dplyr::select(row_id,
									start_date,
									end_date)

	if(nrow(rel_dates) > dplyr::n_distinct(rel_dates$row_id)){
		rel_dates <- rel_dates %>%
			dplyr::group_by(row_id) %>%
			dplyr::summarise(start_date = min(start_date),
											 end_date = max(end_date))
	}

	clean_rel_dates <- rel_dates %>%
		dplyr::mutate(
			start_date = parse_lei_ts(start_date),
			end_date = parse_lei_ts(end_date)
		)

	base_lei_rel %>%
		dplyr::left_join(clean_rel_dates, by = "row_id") %>%
		dplyr::select(
			start_node_id,
			end_node_id,
			start_node_type,
			end_node_type,
			relationship_type,
			relationship_status,
			relationship_start_date = start_date,
			relationship_end_date = end_date
		)

}
