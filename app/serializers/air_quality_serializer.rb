class AirQualitySerializer
  include JSONAPI::Serializer
  set_id { nil }
  attributes :aqi, :datetime, :readable_aqi
end