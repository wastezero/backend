module Utils
  @rad = 1
  @R = 6371

  def getNearestLocations(lng, lat)
    maxLat = lat + ((@rad / @R) * Math::PI / 180)
    minLat = lat - ((@rad / @R) * Math::PI / 180)
    maxLng = lng + (Math.asin(@rad / @R) / Math.cos(lat / 180 * Math::PI)) * Math::PI / 180
    minLng = lng - (Math.asin(@rad / @R) / Math.cos(lat / 180 * Math::PI)) * Math::PI / 180
    return minLat, maxLat
  end

end