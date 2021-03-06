require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    #define_method(columns) do
    #end
    # query = DBConnection.execute2(<<-SQL)
    #   SELECT
    #     *
    #   FROM
    #     #{self.table_name}
    #   LIMIT
    #     1
    # SQL
    # @columns = query.first.map! { |ele| ele.to_sym}
    
    #if columns already exists then there will be more than 1 hit to the db
    @columns ||= DBConnection.execute2(<<-SQL).first.map! { |ele| ele.to_sym} 
    SELECT
      *
    FROM
      #{self.table_name}
    LIMIT
      1
    SQL

    # @columns = DBConnection.execute2(<<-SQL).first.map! { |ele| ele.to_sym}
    # SELECT
    #   *
    # FROM
    #   #{self.table_name}
    # LIMIT
    #   1
    # SQL

  end


  # cat = Cat.new
  # cat.name = "Gizmo"
  # cat.name #=> "Gizmo"
  def self.finalize!
    self.columns.each do |name|
      define_method(name) do
        self.attributes[name]
      end
      define_method("#{name}=") { |arg| self.attributes[name] = arg} #cat.name = "Gizmo" => cat.name=("Gizmo"), "Gizmo" is the arg
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name

  end

  def self.table_name
    # ...
    @table_name || self.name.tableize
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
    params.each do |k,v|
      attr_name = k.to_sym
      if !self.class.columns.include?(attr_name)
        raise "unknown attribute '#{attr_name}'"

      else 
        self.send("#{attr_name}=", v)
      end
    end
  end

  def attributes
    # ...
    @attributes ||= {}
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
