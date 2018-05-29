class MoviesController < ApplicationController

  def index
    @result = Benchmark.realtime do
      @result_array = []
      AttributeType.group(:name).each do |attr_typ|
        Setting.where(setting_value: attr_typ.settings.pluck(:setting_value)).includes(:actor).each do |set_val|
          set_val.actor.movie_actors.includes(:movie).each do |sa_ma|
            @result_array << hash_maker(attr_typ, set_val, set_val.actor, sa_ma, sa_ma.movie)
          end
        end
      end
    end
  end

  private

  def hash_maker(attr_typ, set_val, st_ac, st_ma, st_mo)
    { movie_table_id: st_mo.id, movie_table_name: st_mo.name,
      movie_actor_table_id:  st_ma.id, movie_actor_table_movie_id: st_ma.movie_id, movie_actor_table_actor_id: st_ma.actor_id,
      actor_table_id: st_ac.id, actor_table_name: st_ac.name, actor_table_age: st_ac.age, actor_table_weight: st_ac.weight, actor_table_height: st_ac.height,
      setting_table_id: set_val.id, setting_table_setting_value: set_val.setting_value, setting_table_attribute_type_id: set_val.attribute_type_id, setting_table_actor_id: set_val.actor_id,
      attribute_type_table_id: attr_typ.id, attribute_type_table_name: attr_typ.name
     }
  end
end
