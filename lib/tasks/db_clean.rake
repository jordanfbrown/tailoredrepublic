namespace :db do
  namespace :clean do
    task :all => [:carts, :measurements]

    task :carts => :environment do
      count = 0
      Cart.includes(:line_items).each do |c|
        if c.line_items.empty? && c.updated_at < 1.week.ago
          count += 1
          c.destroy
        end
      end
      puts "Deleted #{count} carts"
    end

    task :measurements => :environment do
      measurements = Measurement.where("updated_at < '#{1.week.ago}' and user_id is null and order_id is null")
      count = measurements.count
      measurements.delete_all
      puts "Deleted #{count} measurements"
    end
  end
end