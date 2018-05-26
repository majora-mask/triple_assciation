class MoviesController < ApplicationController

  def index
    result_array = []
    names = AttributeType.group(:name)
    names.each do |n|
      sv = n.settings.pluck(:setting_value)
      ac_id = Setting.where(setting_value: sv).pluck(:actor_id)
      result_array << MovieActor.where(actor_id: ac_id)
    end

    binding.pry
  end
end
