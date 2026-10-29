select pokemon_species_names.name, pokemon_shapes.identifier, pokemon_habitats.identifier, pokemon_species_flavor_text.flavor_text from pokemon_species
join pokemon_habitats on pokemon_habitats.id = pokemon_species.habitat_id
join pokemon_shapes on pokemon_shapes.id = pokemon_species.shape_id
join pokemon_species_names on pokemon_species_names.pokemon_species_id = pokemon_species.id
join languages on languages.id = pokemon_species_names.local_language_id
join pokemon_species_flavor_text on pokemon_species_flavor_text.species_id = pokemon_species.id and pokemon_species_flavor_text.language_id = languages.id
where pokemon_shapes.identifier = 'humanoid' and languages.identifier = 'fr'
order by pokemon_species_names.name;