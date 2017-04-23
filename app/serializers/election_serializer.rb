class ElectionSerializer < ActiveModel::Serializer
  attributes :id,
             :year,
             :started_at,
             :ended_at
end
