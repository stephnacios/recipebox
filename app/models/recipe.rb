class Recipe < ActiveRecord::Base
    validates :name, :servings, :prep_time_in_minutes, :presence => true
end
