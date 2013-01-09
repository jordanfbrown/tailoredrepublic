module MeasurementsHelper
  def measurement_metadata
    {
      neck: { url: 'SborRZpbXs0' },
      chest: { url: 't88GRfoRMdw' },
      front: { url: 'NE3XAplw24A' },
      stomach: { url: 'IdB7iRAIyc0' },
      waist: { url: 'hFV-edpqyno' },
      hips: { url: 'CE3_EoB0Q78' },
      full_shoulders: { url: 'AWrNsaNSYqU' },
      back: { url: '1Bti6HYZtR8' },
      arm_length: { url: 'xjbNuM8Gw3w' },
      bicep: { url: '1pitgMS3vM0' },
      wrist: { url: 'iKDf0OpvO_w' },
      jacket_length: { url: 'IYdA7kHGqFQ' },
      crotch: { url: '8F1gGzlGu0U' },
      thigh: { url: '_-H2_XyGOdk' },
      pant_length: { url: 'dY_4INxrSgM' }
    }
  end

  def progress_todo
    image_tag 'icons/star-no-stroke.png'
  end

  def progress_current
    image_tag 'icons/star-filled.png'
  end

  def progress_completed
    image_tag 'icons/star-stroke.png'
  end
end
