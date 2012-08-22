require "twitter_challenge/version"
require "twitter"

module TwitterChallenge
  # Your code goes here...
  class Square
    # sorts and prints the words in a given twitter user’s last 1000 tweets sorted by frequency of use.
    # For example, if jack had tweeted: “hello world” “hello everyone, and world” “hi world”
    # The result could be: world hello and hi everyone
    #
    # Example:
    #     printer = TwitterChallenge::Square.new
    #     words = printer.get_words_by_frequency(jack)
    #     words.each do |word|
    #       puts "#{word[:word]}, #{word[:freq]}"
    #     end
    #
    # => world, 3
    #    hello, 2
    #    everyone, 1
    #    and, 1
    #    hi, 1
    def get_words_by_frequency(twitter_user_name)
      home_timeline = get_user_time_line(twitter_user_name)
      index = 0
      word_counter = {}


      home_timeline.each do |item|
        # puts item.text
        words = item.text.split(' ')
        words.each do |word|
          downcase_word = word.downcase

          if !word_counter.has_key?(downcase_word)
            word_counter[downcase_word] = 1
          else
            word_counter[downcase_word] += 1
          end
        end

        index += 1
        if index == 999
          break
        end
      end

      word_freqs = []

      word_counter.each do |word, count|
        word_freqs << {:word => word, :freq => count}
      end

      word_freqs = word_freqs.sort {|a, b| b[:freq] <=> a[:freq]}

      word_freqs.each do |word_freq|
        # puts "#{word_freq[:word]}" # puts "#{word_freq[:word]}, #{word_freq[:freq]}"
      end

      return word_freqs
    end


    private
    def get_user_time_line(user_name)
      if user_name == nil
        return []
      end

      begin
        return Twitter.user_timeline(user_name)
      rescue
        puts $!
      end

      return []

    end
  end
end


