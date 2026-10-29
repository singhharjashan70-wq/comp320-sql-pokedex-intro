select count(*) from pokemon join pokemon_abilities on pokemon_abilities.pokemon_id = pokemon.id join pokemon_species on pokemon_species.id = pokemon.species_id where pokemon_species.is_legendary = 1 and pokemon_abilities.is_hidden = 1;


