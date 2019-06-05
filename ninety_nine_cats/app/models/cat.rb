class Cat < ApplicationRecord

  include ActionView::Helpers::DateHelper

  validates :color, inclusion: { in: ["black","slightly darker black", "calico", "grey & white"],
        message: "%{value} is not a valid color" }

  validates :sex, inclusion: { in: %w(M F X), message: "Apparently we're super old fashioned about genders"}

  validate :name_length

  def age 
    time_ago_in_words(self.birth_date)
  end

  def name_length
    
    unless name.length > 0
      errors.add(:name, "caint be blank")
    end

  end
end