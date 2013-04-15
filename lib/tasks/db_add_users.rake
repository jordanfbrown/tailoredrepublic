namespace :db do
    desc 'Import users from a .csv file'
    task :add_users => :environment do
      File.read('customers.csv').split(/\n/).each_with_index do |row, i|
        values = row.split(',')
        if i > 0
          user = {
            name: values[4],
            email: values[5],
            password: values[5],
            sign_up_method: User::SIGN_UP_METHOD_SCRIPT
          }
          shipping_address = {
            name: values[8],
            line1: values[9],
            line2: values[10],
            city: values[11],
            state: values[12],
            zip: values[13]
          }
          billing_address = {
            name: values[14],
            line1: values[15],
            line2: values[16],
            city: values[17],
            state: values[18],
            zip: values[19]
          }

          if values[36]
            split_height = values[36].split("'").map { |v| v.gsub(/\"/, '').to_i }
            puts values[36], split_height.inspect
            height = split_height[0] * 12 + split_height[1]
          else
            height = 72
          end

          measurements = {
            neck: values[21],
            chest: values[22],
            stomach: values[24],
            waist: values[25],
            hips: values[26],
            full_shoulders: values[27],
            back: values[28],
            arm_length: values[29],
            bicep: values[30],
            wrist: values[31],
            jacket_length: values[32],
            crotch: values[33],
            thigh: values[34],
            pant_length: values[35],
            height: height,
            weight: values[37] ? values[37] : 160,
            age: values[38] ? values[38] : 25
          }

          if !user[:name].nil? && !user[:email].nil?
            u = User.create(user)
            unless u.errors.any?
              u.create_shipping_address(shipping_address)
              u.create_billing_address(billing_address)
              u.create_measurement(measurements)
            end
          end
        end
      end
    end
end