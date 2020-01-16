require_relative 'questions_db'
require_relative 'questions'
require_relative 'replies'
require_relative 'question_follows'
require_relative 'question_likes'

class User 

  attr_accessor :id, :fname, :lname

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map {|el| User.new(el)}
  end

  def initialize(options)
      @id = options['id']
      @fname = options['fname']
      @lname = options['lname']
  end


  def self.find_by_id(target_id) 
    # result will be an array
    result = QuestionsDatabase.instance.execute(<<-SQL, target_id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    # get the only element from the array
    return !result.empty? ? User.new(result.first) : nil
  end 

  def self.find_by_name(fname, lname)
    result = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT 
        *
      FROM 
        users
      WHERE
        fname = ? AND lname = ?
        -- don't put a space after the bottom SQL
    SQL
  end

  def authored_questions(id)
      Question.find_by_author_id(id)
  end

  def authored_replies(id)
    Reply.find_by_user_id(id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(self.id)
  end 

  def liked_questions
    QuestionLike.liked_questions_for_user_id(self.id)
  end
  # CAST (COUNT(question_likes.user_id) / COUNT(DISTINCT question_likes.question_id) AS FLOAT)
  def average_karma
    result = QuestionsDatabase.instance.execute(<<-SQL, self.id)
      SELECT
        COUNT(question_likes.user_id) / CAST (COUNT(DISTINCT question_likes.question_id) AS FLOAT)
      FROM
        question_likes
      LEFT OUTER JOIN
        questions ON question_likes.question_id = questions.id
      JOIN
        users ON users.id = questions.author_id
      WHERE
        users.id = 0
    SQL
  end

end

    JOIN
      users ON questions.author_id = users.id