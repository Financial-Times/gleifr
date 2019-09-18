

read_gleif_entities_csv <- function(file){
	#' Read GLEIF entities csv file
	#'
	#' Read the "Level 1 LEI-CDF Golden Copy File" downloaded from
	#' \url{https://www.gleif.org/en/lei-data/gleif-golden-copy/download-the-golden-copy#/}.
	#' This function will read the useful columns, clean the names and convert
	#' timestamps into dates.
	#' @param file Path to a csv file
	#' @export

	readr::read_csv(file = file,
									col_types = readr::cols_only(
										LEI = "c",
										Entity.LegalName = "c",
										Entity.LegalAddress.Country = "c",
										Entity.HeadquartersAddress.Country = "c",
										Entity.RegistrationAuthority.RegistrationAuthorityID = "c",
										Entity.EntityCategory = "c",
										Entity.EntityStatus = "c",
										Registration.InitialRegistrationDate = "c",
										Registration.LastUpdateDate = "c",
										Registration.RegistrationStatus = "c",
										Registration.ValidationAuthority.ValidationAuthorityID = "c"
									)) %>%
		dplyr::rename(
			lei = LEI,
			entity_legal_name = Entity.LegalName,
			entity_legal_country = Entity.LegalAddress.Country,
			entity_hq_country = Entity.HeadquartersAddress.Country,
			entity_registration_authority_id = Entity.RegistrationAuthority.RegistrationAuthorityID,
			entity_category = Entity.EntityCategory,
			entity_status = Entity.EntityStatus,
			initial_registration_date = Registration.InitialRegistrationDate,
			last_updated_date = Registration.LastUpdateDate,
			registration_status = Registration.RegistrationStatus,
			validation_authority_id = Registration.ValidationAuthority.ValidationAuthorityID
		) %>%
		dplyr::mutate(
			initial_registration_date = parse_lei_ts(initial_registration_date),
			last_updated_date = parse_lei_ts(last_updated_date)
		)
}


read_gleif_relationships_csv <- function(file){
	#' Read GLEIF relationships csv file
	#'
	#' Read the "Level 1 LEI-CDF Golden Copy File" downloaded from
	#' \url{https://www.gleif.org/en/lei-data/gleif-golden-copy/download-the-golden-copy#/}.
	#' This function will read the useful columns, clean the names and convert
	#' timestamps into dates.
	#' @param file Path to a csv file
	#' @export

	readr::read_csv(file = file,
									col_types = readr::cols_only(
										Relationship.StartNode.NodeID = "c",
										Relationship.StartNode.NodeIDType = "c",
										Relationship.EndNode.NodeID = "c",
										Relationship.EndNode.NodeIDType = "c",
										Relationship.RelationshipType = "c",
										Relationship.RelationshipStatus = "c",
										Relationship.Period.1.startDate = "c",
										Relationship.Period.1.endDate = "c",
										Relationship.Period.1.periodType = "c",
										Relationship.Period.2.startDate = "c",
										Relationship.Period.2.endDate = "c",
										Relationship.Period.2.periodType = "c",
										Relationship.Period.3.startDate = "c",
										Relationship.Period.3.endDate = "c",
										Relationship.Period.3.periodType = "c",
										Relationship.Period.4.startDate = "c",
										Relationship.Period.4.endDate = "c",
										Relationship.Period.4.periodType = "c",
										Relationship.Period.5.startDate = "c",
										Relationship.Period.5.endDate = "c",
										Relationship.Period.5.periodType = "c"
									)) %>%
		dplyr::rename(
			start_node_id = Relationship.StartNode.NodeID,
			start_node_type = Relationship.StartNode.NodeIDType,
			end_node_id = Relationship.EndNode.NodeID,
			end_node_type = Relationship.EndNode.NodeIDType,
			relationship_type = Relationship.RelationshipType,
			relationship_status = Relationship.RelationshipStatus
		) %>%
		clean_lei_relationship_dates()

}
