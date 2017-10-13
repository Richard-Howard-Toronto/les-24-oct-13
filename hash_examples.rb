class Person

  def self.create(params)
    @name = params[:name]
    @age  = params[:age]
  end

end



p a = Hash["a", 100, "b", 200]

h = {"colors"  => ["red", "blue", "green"],
     "letters" => ["a", "b", "c" ]}

p h.assoc("letters")  #=> ["letters", ["a", "b", "c"]]
p h.assoc("foo")      #=> nil
