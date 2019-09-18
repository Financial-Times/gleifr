
gleif_graph <- function(entities, relationships){

	igraph::graph_from_data_frame(d = relationships,
																directed = TRUE,
																vertices = entities)
}

ultimate_parent <- function(entities, relationships){

	gg <- gleif_graph(entities, relationships)

	gg_clusters <- igraph::components(gg, mode = "weak")
	gg_degree_out <- igraph::degree(gg, mode = "out")

	cluster_ids <- gg_clusters$membership
	attr(cluster_ids, "names") <- NULL

	entities$cluster_id <- cluster_ids

	cluster_names <- entities %>%
		dplyr::filter(gg_degree_out == 0) %>%
		dplyr::group_by(cluster_id) %>%
		dplyr::arrange(initial_registration_date) %>%
		dplyr::mutate(rid = dplyr::row_number()) %>%
		dplyr::filter(rid == 1) %>%
		dplyr::select(cluster_id,
									ultimate_parent_lei = lei,
									ultimate_parent_legal_name = entity_legal_name) %>%
		dplyr::ungroup()

	entities %>%
		dplyr::mutate(cluster_id = cluster_ids) %>%
		dplyr::left_join(cluster_names, by = "cluster_id") %>%
		dplyr::select(-cluster_id)

}
