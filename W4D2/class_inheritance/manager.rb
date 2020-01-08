require_relative "employee"

class Manager < Employee

  attr_accessor :employees, :salary

  def initialize(name, title, salary, boss = nil)
    @employees = []
    super
  end

  def bonus(multi)
    sub_total = self.get_sub_employee_salary
    # if you don't have employees, your bonus is just your salary * multi
    @salary = sub_total if sub_total > 0 
    super(multi)
  end

  def get_sub_employee_salary
    # this is a dfs implementation
    # will get total salary of sub-employees
    # 0 because no employees
    return 0 if @employees.empty?
    # initialize total_salary
    total_salary = 0
    # look at each employee, determine if they have sub employees
    #      if they have sub-employees, recurse
    #      else, emp.get_sub_employee = 0
    #      add employee subtotal (emp.get_sub_employee_salary) with employee salary to total salary
    @employees.each { |emp| total_salary += emp.get_sub_employee_salary + emp.salary}
    total_salary 
  end

  # visualization of get_sub_employee_salary
  # ned
  # darren
  # shawna   david

  # start with ned ==> ned.employees = [darren] ==> darren.get_sub + darren.salary
  # ned.employees.each ==> total += darren.get_sub_employee_salary (shawn + david's salary) + darren.salary
  #           darren.employees.each ==> total += shawna.get_sub (0) + shawna.salary + david.get_sub (0) + david.salary
  # shawna.employees.empty? ==> return 0
  # david.employees.empty? ==> return 0



  # call bonus
end

ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
ned.employees << darren
shawna = Manager.new("Shawna", "TA", 12000, darren)
david = Manager.new("David", "TA", 10000, darren)
darren.employees << shawna
darren.employees << david



p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)