def dictionary
  look_it_up = {
    "hello" => "hi",
    "to" => "2",
    "two" => "2",
    "too" => "2",
    "for" => "4",
    "four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"
  }
end

def word_substituter(tweet)
  tweet_arr = tweet.split
  
  tweet_arr.collect! do |word|
    if dictionary.keys.include?(word.downcase)
      word = dictionary[word.downcase]
    else
      word
    end
  end
  tweet_arr.join(" ")
end


def bulk_tweet_shortener(tweets)
  tweets.each do |tweet|
    puts word_substituter(tweet)
  end
end


def selective_tweet_shortener(tweet)
  tweet.length > 140 ? word_substituter(tweet) : tweet
end

def shortened_tweet_truncator(tweet)
  if word_substituter(tweet).length > 140
    # With additional ... the program needs to subtract 4 since it starts at 0 index from 140
    word_substituter(tweet)[0..136] + '...'
  else
    tweet
  end
end



test_string = "GUISEEEEE this is so fun! I'm tweeting for you guys and this tweet is SOOOO long it's gonna be way more than you would think twitter can handle, so shorten it up you know what I mean? I just can never tell how long to keep typing!"
puts shortened_tweet_truncator(test_string).length

=begin
def test(tweet)
  tweet.split.collect do |word|
    puts word
  end
  
  dictionary.keys
end

#puts test(test_string)
=end