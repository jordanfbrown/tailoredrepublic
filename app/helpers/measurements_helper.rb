module MeasurementsHelper
  include ActiveSupport::Inflector

  def measurement_metadata
    {
      neck: {
        url: 'SborRZpbXs0',
        steps: [
          'This measurement will determine how your collar will fit.',
          'Measure around the neck',
          'Leave two fingers between the measuring tape and your neck',
          'Finish the measurement right below the Adam\'s apple'
        ]
      },
      chest: {
        url: 't88GRfoRMdw',
        steps: [
          'Stand straight with your arms comfortably at your side.',
          'Raise your arms out wide to allow measurer to wrap the tape measure around the widest part of the chest',
          'Make sure to go high up under the armpits while keeping the measuring tape horizontal (no tilt)',
          'End the measurement on the sternum making sure the tape doesn\'t feel too tight and there are two fingers of space between tape and chest'
        ]
      },
      front: {
        url: 'NE3XAplw24A',
        steps: [
          'Stand straight with your arms comfortably at your side.',
          'Place tape measurer on the front of the right armpit where the bicep and torso meet',
          'Measure across the chest running measuring tape across the nipples',
          'End measurement on the front of the left armpit where the bicep and torso meet',
        ]
      },
      stomach: {
        url: 'IdB7iRAIyc0',
        steps: [
          'Wrap the tape measure around the widest part of the stomach, usually at the belly button',
          'Make sure to keep the tape measure level (no tilt)',
          'Place two fingers between measuring tape and stomach, ensuring it is not too tight and cutting into the stomach. Breathing should not be constricted by the tape'
        ]
      },
      waist: {
        url: 'hFV-edpqyno',
        steps: [
          'This will be the circumference of your waistband. Make sure the waistline of your pants is just below the level where you would wear your dress pants (this may differ from where you wear shorts/sweats)',
          'Measure just above the waistline of your pants; the measuring tape should be exactly where you would like to wear your dress pants',
          'Make sure to keep the tape level (no tilt)',
          'Leave two fingers between the measuring tape and your waist'
        ]
      },
      hips: {
        url: 'CE3_EoB0Q78',
        steps: [
          'This measurement wraps around the butt and hips.',
          'Wrap around the widest part of the hips and butt making sure to keep the tape measure level',
          'Leave at least two fingers between the measuring tape and the body, most people don\'t want this particular measurement too tight',
        ]
      },
      full_shoulders: {
        url: 'AWrNsaNSYqU',
        steps: [
          'Start at the where the joint flesh of your left upper arm meets the outside of your acromion (yeah, feel free to Google that, but it is the pointy shoulder bone directly above the shoulder/arm joint)',
          'Run the tape across and over the shoulders close to the neck as demonstrated in the video',
          'End the measurement where the flesh of the upper arm meets the outside of the acromion of the right shoulder',
        ]
      },
      back: {
        url: '1Bti6HYZtR8',
        steps: [
          'Stand straight with your arms comfortably at your side',
          'Begin measurement at the back of the left armpit where the tricep meets the back',
          'Measure straight across the back',
          'Finish the measurement on the left armpit where the tricep meets the back'
        ]
      },
      arm_length: {
        url: 'xjbNuM8Gw3w',
        steps: [
          'Stand straight with your arms hanging naturally at your side',
          'Start this measurement where the top of the shoulder meets the joint of your arm (the acromion)',
          'Measure directly to the elbow and pin the tape on the joint',
          'Follow the natural bend of the arm and finish the measurement 1 inch after the crease in your wrist'
        ]
      },
      bicep: {
        url: '1pitgMS3vM0',
        steps: [
          'Measure around the widest part of the bicep on the dominant hand',
          'Leave at least two fingers between the measuring tape and the arm to allow better arm mobility (Recommended)',
        ]
      },
      wrist: {
        url: 'iKDf0OpvO_w',
        steps: [
          'Measure around the wrist on the dominant hand',
          'Leave one finger between measuring tape and arm to ensure wrist is not too snug'
        ]
      },
      jacket_length: {
        url: 'IYdA7kHGqFQ',
        steps: [
          'Stand straight with your arms comfortably at your side and remain looking straight forward',
          'Start at the intersection where the rise of your Neck meets the surface of your shoulder and measure directly down your body',
          'End the measurement at the level in between your thumb knuckles',
          'Important note: It is the tendency of the person being measured to lean forward and look down at the measuring tape as the measurer brings it down to their thumb. Do not do this or it will result in the measurement being too short; remain standing straight and looking straight forward.'
        ]
      },
      crotch: {
        url: '8F1gGzlGu0U',
        steps: [
          'This measurement will determine the length of the seam running from your fly to the top of your butt.  The goal here is to make it tight enough to look like proper tailored pants, but not so tight as to cause a ball wedgie (seriously).',
          'Make sure the waistline of your pants is at the level where you would wear your dress pants',
          'Start this measurement at the back of the waistline as seen in the video',
          'Run the tape down the middle seam passing under the crotch',
          'Bring it to the front side of the pants and end the measurement at the top of the waistline on the front'
        ]
      },
      thigh: {
        url: '_-H2_XyGOdk',
        steps: [
          'Measure around the widest part of the thigh',
          'Make sure to measure high up on the thigh to get the widest part',
          'Make sure that the tape measure is level',
          'Leave at least two fingers between the measuring tape and the thigh'
        ]
      },
      pant_length: {
        url: 'dY_4INxrSgM',
        steps: [
          'Make sure the waistline of your pants is at the level where you would wear your dress pants (this may differ from where you wear shorts/sweats)',
          'Start at the top of the waistband and move directly down the leg towards the floor',
          'End the measurement on the fleshy part of the foot just below the ankle. (Note: some people prefer longer pants with more of a break. For this style, add 3/4)'
        ]
      }
    }
  end

  def progress_todo_or_completed(measurement)
    image_tag measurement.new_record? ? 'icons/star-no-stroke.png' : 'icons/star-stroke.png'
  end

  def progress_current
    image_tag 'icons/star-filled.png'
  end
end
