class Actor < ActiveRecord::Base
  has_and_belongs_to_many :movies

  def self.list_all_actor_names
    self.all.map { |a| a.name}.sort!
  end

  def self.print_list_of_all_actor_names
    # self.list_all_actor_names.each { |a| puts a}
    puts self.list_all_actor_names
  end


end
