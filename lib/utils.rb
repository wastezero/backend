module Utils
  RAD = 1
  R = 6371

  def square(lng, lat)
    maxLat = lat.to_f + ((RAD / R) * Math::PI / 180)
    minLat = lat.to_f - ((RAD / R) * Math::PI / 180)
    maxLng = lng.to_f + (Math.asin(RAD / R) / Math.cos(lat.to_f / 180 * Math::PI)) * Math::PI / 180
    minLng = lng.to_f - (Math.asin(RAD / R) / Math.cos(lat.to_f / 180 * Math::PI)) * Math::PI / 180
    return [minLat, maxLat, maxLng, minLng]
  end

end