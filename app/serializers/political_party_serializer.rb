class PoliticalPartySerializer < ActiveModel::Serializer
  attributes :id,
             :general_secretary,
             :name,
             :slogan,
             :chairman,
             :colors,
             :logo_url
end
