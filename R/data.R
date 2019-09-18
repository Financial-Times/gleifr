
#' GLEIF Entities
#'
#' A dataset of legal entities in the GLEIF register. GLEIF data documentation
#' is provided here:
#' \url{https://www.gleif.org/en/about-lei/common-data-file-format/lei-cdf-format}
#'
#' @format A data frame with 11 variables: \describe{ \item{lei}{20 character
#'   unique identifier} \item{entity_legal_name}{The legal name of the entity.
#'   Maps to Entity.EntityLegalName in the raw file.}
#'   \item{entity_legal_country}{The 2 letter country code of the country used
#'   in the legal address during registration. Maps to
#'   Entity.LegalAddress.Country in the raw file} \item{entity_hq_country}{The 2
#'   letter country code of the head quarters address. Maps to
#'   Entity.HeadquartersAddress.Country}
#'   \item{entity_registration_authority_id}{The reference code of the
#'   registration authority, taken from the Registration Authorities Code List
#'   maintained by GLEIF} \item{entity_category}{One of the following
#'   \describe{\item{BRANCH}{ The legal entity is a branch of another entity}
#'   \item{FUND}{The legal entity is a fund managed by another entity}
#'   \item{SOLE_PROPRIETOR}{The legal entity is an individual acting in a
#'   business capacity}}} \item{entity_status}{One of \describe{
#'   \item{ACTIVE}{As of the last report or update, the Legal Entity reported
#'   that it was legally registered and operating} \item{INACTIVE}{It has been
#'   determined that the Entity that was assigned the LEI is no longer legally
#'   registered and/or operating, whether as a result of business closure,
#'   acquisition by or merger with another (or new) Entity, or determination of
#'   illegitimacy}}} \item{initial_registration_date}{The date the information
#'   on the legal entity was first collected} \item{last_updated_date}{The date
#'   the information on the legal entity was last updated}
#'   \item{registration_status}{One of: \describe{ \item{PENDING_VALIDATION}{An
#'   application for an LEI that has been submitted and which is being processed
#'   and validated.} \item{ISSUED}{An LEI Registration that has been validated
#'   and issued, and which identifies an Entity that was an operating Legal
#'   Entity as of the last update.} \item{DUPLICATE}{An LEI Registration that
#'   has been determined to be a duplicate registration of the same Legal Entity
#'   as another LEI Registration; the DUPLICATE status is assigned to the
#'   non-surviving registration (i.e. the LEI that should no longer be used).}
#'   \item{LAPSED}{An LEI registration that has not been renewed by the
#'   NextRenewalDate and is not known by public sources to have ceased
#'   operation.} \item{MERGED}{An LEI registration for an Entity that has been
#'   merged into another Legal Entity, such that this Legal Entity no longer
#'   exists as an operating Entity.} \item{RETIRED}{An LEI registration for an
#'   Entity that has ceased operation, without having been merged into another
#'   Entity.} \item{ANNULLED}{An LEI registration that was marked as erroneous
#'   or invalid after it was issued.} \item{CANCELLED}{An LEI registration that
#'   was abandoned prior to issuance of an LEI.} \item{TRANSFERRED}{An LEI
#'   registration that has been transferred to a different LOU as the managing
#'   LOU.} \item{PENDING_TRANSFER}{An LEI registration that has been requested
#'   to be transferred to another LOU. The request is being processed at the
#'   sending LOU.} \item{PENDING_ARCHIVAL}{An LEI registration is about to be
#'   transferred to a different LOU, after which its registration status will
#'   revert to a non-pending status}}} \item{validation_authority_id}{The
#'   reference code of the registration authority, taken from the Registration
#'   Authorities Code List maintained by GLEIF} }
#'
#' @source
#' \url{https://www.gleif.org/en/lei-data/gleif-golden-copy/download-the-golden-copy#/}
#'
"gleif_entities"


#' GLEIF Relationships
#'
#' The "Level 2 Relationshp Record CDF Golden Copy File". GLEIF data documentation
#' is provided here:
#' \url{https://www.gleif.org/en/about-lei/common-data-file-format/relationship-record-cdf-format}
#'
#' @format A data frame with 6 variables: \describe{
#' \item{start_node_id}{An LEI for the entity at the start of the relationship}
#' \item{end_node_id}{An LEI for the entity at the end of the relationship}
#' \item{relationship_type}{A unique code designating the specific category of a directional relationship between two legal entities.}
#' \item{relationship_status}{The status of the legal entities relationship itself (ACTIVE or INACTIVE).}
#' \item{relationship_start_date}{The start date for the RELATIONSHIP_PERIOD if provided}
#' \item{relationship_end_date}{The end date for the RELATIONSHIP_PERIOD if provided}
#' }
#'
#' @source
#' \url{https://www.gleif.org/en/lei-data/gleif-golden-copy/download-the-golden-copy#/}
"gleif_relationships"

