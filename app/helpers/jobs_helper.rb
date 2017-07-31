module JobsHelper
  def googleMapBuilderIndex(latitude, longitude)
    "https://maps.googleapis.com/maps/api/staticmap?center=#{latitude}, #{longitude}&zoom=13&size=200x100&maptype=roadmap
            &markers=color:blue%7C#{latitude}, #{longitude}
            &key=AIzaSyBT1C6Em-Pe2PoDA4cZla0jUt35fDCFjsg"
  end

  def googleMapBuilderShow(latitude, longitude)
    "https://maps.googleapis.com/maps/api/staticmap?center=#{latitude}, #{longitude}&zoom=13&size=280x200&maptype=roadmap
            &markers=color:blue%7C#{latitude}, #{longitude}
            &key=AIzaSyBT1C6Em-Pe2PoDA4cZla0jUt35fDCFjsg"
  end
end
