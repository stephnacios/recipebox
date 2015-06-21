class IngredientsController < ApplicationController
  autocomplete :ingredient, :name
end
