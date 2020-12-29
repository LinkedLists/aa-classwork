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

  def self.finalize!

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
