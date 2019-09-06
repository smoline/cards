defmodule Cards do

  def hello do
    "hi there!"
  end
  @moduledoc """
  Cards keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  # iex -S mix
  # Pattern Matching
  # { hand, rest_of_deck } = Cards.deal(deck, 5)
  # now when you type in hand, you will only see your hand

  # [ color1, color2 ] = [ "red", "blue" ]

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  # using a built in erlang method to turn our list of strings into a binary object
  # that can be safely stored in a non erlang environment

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  # deck = Cards.create_deck
  # Cards.save(deck, 'my_deck')
  # {status, binary} = File.read("my_deck")
  # :erlang.binary_to_term(binary)

  def load(filename) do
    {status, binary} = File.read(filename)
    :erlang.binary_to_term binary
  end
end

