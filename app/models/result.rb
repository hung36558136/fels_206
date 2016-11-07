class Result < ApplicationRecord
  belongs_to :lesson
  belongs_to :answer
  belongs_to :word

  scope :filter_word_learned, -> user_id do
    joins("inner join lessons on results.lesson_id = lessons.id \n
       and lessons.user_id = #{user_id} inner join words on \n
        results.word_id = words.id inner join answers on \n
          results.answer_id = answers.id and answers.is_correct = 't'")
          .select("results.id, words.content as w_content, \n
            answers.content as a_content, words.id")
  end

  scope :filter_word_learned_with_category, -> user_id, category_id do
    joins("inner join lessons on results.lesson_id = lessons.id \n
       and lessons.user_id = #{user_id} inner join words on \n
        results.word_id = words.id and words.category_id = #{category_id} \n
          inner join answers on results.answer_id = answers.id \n
            and answers.is_correct = 't'")
              .select("results.id, words.content as w_content, \n
                answers.content as a_content")
  end

end
