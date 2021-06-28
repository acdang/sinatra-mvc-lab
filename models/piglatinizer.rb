class PigLatinizer
    def piglatinize_word(word)
        letters = word.split("")
        # check first letter if vowel
        if ["a", "e", "i", "o", "u"].include?(letters.first.downcase)
            "#{word}way"
        else
            moved = []
            remaining = letters
            letters.each do |letter|
                break if ["a", "e", "i", "o", "u"].include?(letter)
                moved << letter
            end
            moved.length.times do
                remaining.shift
            end
            "#{remaining.join}#{moved.join}ay"
        end
    end

    def piglatinize(sentence)
        sentence = sentence.split
        if sentence.length > 1
            sentence.map! do |word|
                word = piglatinize_word(word)
            end
            sentence = sentence.join(" ")
        else
            sentence = piglatinize_word(sentence.first)
        end
        sentence
    end
end
