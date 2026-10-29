select pokemon.identifier, count(pokemon_types.pokemon_id) from pokemon join pokemon_types on pokemon_types.pokemon_id = pokemon.id group by pokemon_types.pokemon_id order by pokemon.identifier;
