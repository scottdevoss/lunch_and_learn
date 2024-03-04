class AirQualitySerializer
  include JSONAPI::Serializer
  set_id { nil }

  attributes :aqi do |object|
    object[:aqi].aqi
  end

  attributes :datetime do |object|
    object[:datetime].datetime
  end

  attributes :readable_aqi do |object|
    if object[:aqi].aqi == 5
      "Very Poor"
    elsif object[:aqi].aqi == 4
      "Poor"
    elsif object[:aqi].aqi == 3
      "Moderate"
    elsif object[:aqi].aqi == 2
      "Fair"
    else
      "Good"
    end
  end
end