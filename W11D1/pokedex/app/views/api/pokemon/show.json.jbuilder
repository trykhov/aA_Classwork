# json.set! :pokemon, @pokemon
json.pokemon do
  json.extract! @pokemon, :id, :name, :attack, :defense, :poke_type, :moves, :item_ids
  json.image_url asset_path("pokemon_snaps/#{@pokemon.image_url}")
end
json.set! :items do 
  @pokemon.items.each do |item|
    json.set! item.id, item
  end
end
