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

  def authored_questions
    Question.find_by_author_id(user_id)
  end

  def self.find_by_name(first, last)
    user = PlayDBConnection.instance.execute(<<-SQL, first, last)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
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

  def self.find_by_author_id(author_id)
    question = PlayDBConnection.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
    return nil unless question.length > 0
    Question.new(question.last)
  end

  def replies
    Replies.find_by_question_id(question_id)
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

  def self.followers_for_question_id(question_id)
    question_follow = PlayDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        users
      JOIN
        question_follows ON users.user_id = questions_follows.u_id 
      WHERE
        questions_follows.q_id = ?
    SQL
    return nil unless question_follow.length > 0
  QuestionFollows.new(question_follow.first)

SELECT
  users.name, posts.title
FROM
  posts
JOIN
  users ON posts.user_id = users.id

  end

  def initialize(options)
    @id = options['id']
    @q_id = options['q_id']
    @u_id = options['u_id']
  end
end

class Replies
  attr_accessor :reply_id, :question_id, :parent_id, :user_id, :body_text

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM replies")
    data.map { |datum| Replies.new(datum) }
  end

  def self.find_by_id(id)
    reply = PlayDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        reply_id = ?
    SQL
    return nil unless reply.length > 0
    Replies.new(reply.first)
  end

  def self.find_by_question_id(id)
    reply = PlayDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    return nil unless reply.length > 0
    Replies.new(reply.first)
  end

  def author
    Users.find_by_id(user_id)
  end

  def question
    Questions.find_by_id(question_id)
  end

  def parent_reply
    Replies.find_by_id(parent_id)
  end

  def child_replies
    replies = PlayDBConnection.instance.execute(<<-SQL, reply_id)
    SELECT
      *
    FROM
      replies
    WHERE
      parent_id = ?
    SQL
    return nil unless replies.length > 0
    Replies.new(replies.first)
  end

  def initialize(options)
    @reply_id = options['reply_id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @user_id = options['user_id']
    @body_text = options['body_text']
  end
end