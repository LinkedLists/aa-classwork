
json.array! @guests do |guest|
    json.extract! guest, :name
end

# @guests.each do |guest|
#   json.set! guest.id do 
#     json.extract! guest, :name
#   end
# end
