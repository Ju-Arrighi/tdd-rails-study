class Customer < ApplicationRecord
  def full_name
    "Sra. #{name}"
  end
end
