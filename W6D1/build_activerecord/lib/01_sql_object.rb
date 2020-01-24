require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  # include Singleton
  def self.columns
    return @columns unless @columns.nil?
    result = DBConnection.execute2(<<-SQL)
    SELECT
      *
    FROM
      #{self.table_name}
    SQL
    @columns = result[0].map!(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |col|
      # each time the col= function is called, it stores the name into the hash
      define_method("#{col}=") do |val|
        self.attributes[col] = val
      end 
      define_method(col) do 
        # this just returns the value at the key of col
        self.attributes[col]
      end 
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.name.underscore.pluralize
  end

  def self.all
    result = DBConnection.execute(<<-SQL)
    SELECT
      #{table_name}.*
    FROM
      #{table_name}
    SQL
    parse_all(result)
    # ...
  end

  def self.parse_all(results)
    results.map { |result| self.new(result) }
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      # if left by itself, the key would be an array
      sym_attr = attr_name.to_sym
      if self.class.columns.include?(sym_attr) 
        self.send("#{sym_attr}=", value)
      else
        raise "unknown attribute '#{sym_attr}'"
      end
    end
    # ...
  end

  def attributes
    @attributes ||= {}
    # ...
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
