select types.identifier , count(*) from types join pokemon_types on pokemon_types.type_id = types.id group by types.identifier order by types.identifier;
