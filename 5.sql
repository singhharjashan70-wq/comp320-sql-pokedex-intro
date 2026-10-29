select distinct pokemon.identifier, abilities.identifier from pokemon join pokemon_abilities on pokemon_abilities.pokemon_id = pokemon.id join abilities on pokemon_abilities.ability_id = abilities.id where pokemon_abilities.is_hidden = 1 order by pokemon.identifier limit 10;



