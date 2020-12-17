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

class Question
  attr_accessor :question_id, :body, :title, :author_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

  def self.find_by_id(id)
    question = PlayDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        question_id = ?
    SQL
    return nil unless question.length > 0
    Question.new(question.first)
  end

  def initialize(options)
    @question_id = options['question_id']
    @body = options['body']
    @title = options['title']
    @author_id = options['author_id']
  end
end

class QuestionFollows
  attr_accessor :id, :q_id, :u_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM question_follows")
    data.map { |datum| QuestionFollows.new(datum) }
  end

  def self.find_by_id(id)
    question_follow = PlayDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL
    return nil unless question_follow.length > 0
    QuestionFollows.new(question_follow.first)
  end

  def initialize(options)
    @id = options['id']
    @q_id = options['q_id']
    @u_id = options['u_id']
  end
end

class Replies