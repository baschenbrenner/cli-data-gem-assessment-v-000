class NFL::Team
attr_accessor :city, :mascot,

  def initialize(full_team_name)
    ary=full_team_name.split(" ")
    @mascot=ary.pop
    @city=ary.join(" ")
    
  end


end
