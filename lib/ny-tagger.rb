class NYTagger

PREMISES_TYPES = {
  'foursquare' => {
    off: ["wine shop", "liquor store", "grocery store", "convenience store", "supermarket", "brewery", "big box store", "distillery", "gas station", "beer store", "gourmet shop", "bakery", "deli / bodega", "miscellaneous shop", "winery", "food & drink shop", "supercenter", "furniture / home store", "warehouse store", "cheese shop", "department store", "gift shop", "market", "art museum", "smoke shop", "food", "clothing store", "shop & service", "jewelry store", "building", "bike shop", "sporting goods shop", "vineyard", "other great outdoors", "office", "factory", "farm", "organic grocery", "hardware store", "arts & crafts store", "supermarket", "co-op", "greengrocer", "grocery store", "warehouse", "health food store", "pharmacy", "drugstore", "farmers market", "discount store", "liquor stre", "museum", "antique shop", "motorsports shop", "fishing store", "candy store", "business center", "storage facility", "flea market", "kitchen supply store", "mobile phone shop", "supplement shop", "cidery", "shopping plaza", "accessories store", "art gallery", "pop-up shop", "thrift / vintage store", "vape store", "hobby shop", "lighthouse", "used bookstore", "inn", "brasserie", "eastern european restaurant", "grocerty store", "poke place", "men's store", "meze restaurant", "fondue restaurant", "empanada restaurant", "piano bar", "soup place", "recycling facility", "himalayan restaurant", "floating market", "outdoor supply store", "military base", "frame store", "liquor strore", "liquor store ", "airport", "science museum", "paper / office supplies store", "grocery store", "liquor store"],
    both: ["brewery ", "cidery", "distillery", "shopping mall", "spa", "farm", "premise", "premise", "subpremise", "shopping mall", "brewpub", "distillery", "winery", "beer garden", "vineyard", "farm", "museum", "cidery", "airport"]},
  'google' => {
    off: ["liquor store", "grocery store", "grocery or supermarket", "convenience store", "liquor store", "liquor store", "store", "point of interest", "clothing store", "gym", "cidery", "market", "supermarket", "supermarket", "distillery", "gas station", "doctor", "beauty salon", "health", "point of interest", "grocery or supermarket", "pharmacy", "florist", "food", "pharmacy", "food", "deli", "tobacco", "meat market", "food mart", "department store", "department store", "bakery", "gas station", "health", "jewelry store", "furniture store", "store", "convenience store", "shoe store", "gas station", "convenience store", "shopping mall", "hardware store", "bakery", "farm", "coffee shop", "book store", "book store", "brewery", "chocolate shop", "grocery", "liquor store", "convenience store", "gift shop", "museum", "premise", "premise", "hardware store", "jewelry store", "chocolate store", "home goods store", "liquor store", "wine shop", "political", "shop", "florist", "home goods store", "subpremise", "furniture store", "shopping mall", "coworking space", "park", "movie rental", "storage", "laundry", "electronics store", "grocery or supermarket", "jewelry store"],
    both: ["brewery", "cidery", "distillery", "shopping mall", "spa", "farm", "premise", "subpremise", "shopping mall", "museum", "brewpub", "distillery", "winery", "beer garden", "vineyard", "farm", "museum", "cidery", "airport"],
    },
  'scrape_hero' => {
    off: ["grocery store", "retailer", "warehouse store"],
    both: ["farmers market"]
  },
  'manual' => {
    off: ["liquor store", "retailer", "warehouse store", "grocery_store"],
    both: ["farmers market"]
  }
}

def self.determine_premises_type(loc) # loc = {:loction_type, (:location_type_source), (:default)}
  loc = {default: :on, location_type_source: 'google'}.merge(loc)
  type = loc[:location_type].to_s.gsub('_', ' ').downcase
  if source_types = PREMISES_TYPES[loc[:location_type_source]]
    return :off if source_types[:off].include?(type)
      #dep = loc.depictions.find_or_initialize_by(tag_id: offprem_id)
      #dep.save if dep.new_record?
      #loc.depictions.find_by_tag_id(onprem_id)&.delete
    return :both if source_types[:both].include?(type)
      #depoff = loc.depictions.find_or_initialize_by(tag_id: offprem_id)
      #depoff.save if depoff.new_record?
      #depon = loc.depictions.find_or_initialize_by(tag_id: onprem_id)
      #depon.save if depon.new_record?
    return :on
      #dep = loc.depictions.find_or_initialize_by(tag_id: onprem_id)
      #dep.save if dep.new_record?
      #loc.depictions.find_by_tag_id(offprem_id)&.delete
  else
    return loc[:default]
    #dep = loc.depictions.find_or_initialize_by(tag_id: onprem_id)
    #dep.save if dep.new_record?
    #loc.depictions.find_by_tag_id(offprem_id)&.delete
  end
end
end
