module ApplicationHelper
  # Capitalize each word of a sentence
  def capitalize_each_word(phrase)
    return phrase.split.map(&:capitalize).join(' ')
  end
end
