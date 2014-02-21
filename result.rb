require "active_record"
require "sqlite3"

config = YAML.load_file("db/config.yml")[ENV['ENV']]
ActiveRecord::Base.establish_connection(config)

class Result < ActiveRecord::Base
  def self.update(results)
    match = results.join(",").match(/#{Result.last(4).collect(&:number).join(",")}(.*)/)
    if match
      new_results = match.captures[0].split(",").reject {|x| x == ""}
      if !new_results.empty?
        new_results.each do |x|
          Result.create!(:number => x)
          p "Added #{x}"
        end
      else
        p "Same"
      end
    else
      results.each do |x|
        Result.create!(:number => x)
        p "Added #{x}"
      end
    end
  end
end
