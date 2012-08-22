require 'spec_helper'
require 'twitter_challenge'

describe TwitterChallenge do
  it "returns empty array for invalid username" do
    printer = TwitterChallenge::Square.new
    printer.should_receive(:get_user_time_line).and_return([])
    printer.get_words_by_frequency("").should eq([])
  end

  it "returns something for jack" do

    post1 = mock("post").stub!(:text)
    post1.should_receive(:text).and_return("hello world")

    post2 = mock("post").stub!(:text)
    post2.should_receive(:text).and_return("hello everyone, and world")

    post3 = mock("post").stub!(:text)
    post3.should_receive(:text).and_return("hi world")
    
    printer = TwitterChallenge::Square.new
    printer.should_receive(:get_user_time_line).and_return([post1, post2, post3])
    printer.get_words_by_frequency("jack").should eq([{:word => "world", :freq => 3},
        {:word => "hello", :freq => 2},
        {:word => "everyone,", :freq => 1},
        {:word => "and", :freq => 1},
        {:word => "hi", :freq => 1}])
  end
end