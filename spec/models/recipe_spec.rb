require 'spec_helper'
require 'rails_helper'

RSpec.describe Recipe do
  let(:name) { 'Roast Chicken' }
  let(:prep_time_in_minutes) { 60 }
  let(:servings) { 4 }

  subject(:recipe) do 
    Recipe.create!(
      :name                 => name,
      :prep_time_in_minutes => prep_time_in_minutes,
      :servings             => servings,
    )
  end

  its(:name) { is_expected.to eq name }
  its(:prep_time_in_minutes) { is_expected.to eq prep_time_in_minutes }
  its(:servings) { is_expected.to eq servings }
end