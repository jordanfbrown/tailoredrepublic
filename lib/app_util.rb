module MyActiveRecordExtensions
  extend ActiveSupport::Concern

  def created_at_friendly(options = {})
    date = options[:pacific] ? created_at_pacific : created_at
    date.to_date.to_formatted_s(:long_ordinal)
  end

  def created_at_pacific
    created_at.in_time_zone('Pacific Time (US & Canada)')
  end
end

ActiveRecord::Base.send(:include, MyActiveRecordExtensions)