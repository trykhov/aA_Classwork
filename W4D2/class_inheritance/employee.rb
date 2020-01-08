class Employee

  attr_reader :salary
  attr_accessor :boss

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary 
    @boss = boss
  end

  def bonus(multi)
    salary * multi
  end

end


