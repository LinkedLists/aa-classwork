require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Users
    attr_accessor :user_id, :fname, :lname
  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM users")
    data.map { |datum| Users.new(datum) }
  end

  def self.find_by_id(id)
    user = PlayDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        user_id = ?
    SQL
    return nil unless user.length > 0
    Users.new(user.first)
  end

  def initialize(options)
    @user_id = options['user_id']
    @fname = options['fname']
    @lname = options['lname']
  end
end