require 'pry'

class Pokemon

  attr_accessor :name, :type, :db, :id, :hp

  def initialize(attributes)
    # binding.pry
    @name = attributes[:name]
    @type = attributes[:type]
    @db = attributes[:db]
    @id = attributes[:id]
    @hp = attributes[:hp]
  end

  def self.save(name, type, db)
    # get the id of the pokemon using arguments

    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}','#{type}');")


  end

  def self.find(id, db)
    new_poke = db.execute("SELECT * FROM pokemon WHERE id = #{id};").flatten
    Pokemon.new({:name => new_poke[1], :type => new_poke[2] ,:db => db, :id => new_poke[0], :hp => new_poke[3]})
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = #{new_hp} WHERE id = #{self.id};")
    # binding.pry
  end

  # def hp= (hp)
  #   if hp == nil
  #     @hp = 0
  #   else
  #     @hp = 60
  #   end
  # end



end
