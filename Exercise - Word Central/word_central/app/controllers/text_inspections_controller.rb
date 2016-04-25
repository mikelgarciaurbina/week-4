class TextInspectionsController < ApplicationController
  def new
  end

  def create
    @text = params[:text_inspection][:user_text]
    words = @text.split(" ")
    @word_count = words.length

    words_count = {}
    words.each do |word|
      if words_count.has_key?(word.to_sym)
        words_count[word.to_sym] += 1
      else
        words_count[word.to_sym] = 1
      end
    end

    @order_words = words_count.sort_by{ |key, value| -value }

    @reading_time = (@word_count / 275.0) * 60

    render "results"
  end
end
