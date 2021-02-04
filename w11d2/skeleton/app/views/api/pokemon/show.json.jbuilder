json.pokemon do
  json.set! @pokemon.id do 
    json.extract! @pokemon, :id, :name, :attack, :defense, :poke_type
    json.image_url asset_path("pokemon_snaps/#{@pokemon.image_url}")
  end
end

json.moves do 
  @pokemon.moves.each_with_index do |move, idx|
    json.set! (idx+1) do 
      json.extract! move, :id, :name
    end
  end
end

json.items do 
  @pokemon.items.each_with_index do |item, idx|
    json.set! (idx+1) do 
      json.extract! item, :id, :pokemon_id, :name, :price, :happiness
      json.image_url asset_path("#{item.image_url}")
    end
  end
end