class Customer < ActiveRecord::Base
  enum_attr :status, %w(new contacted sold)
  attr_accessible :description, :email, :name, :phone, :status
end
