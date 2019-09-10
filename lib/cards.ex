defmodule Cards do
  def hello do
    "hi there!"
  end
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings repersenting a deck of playing cards

  ## Examples

      iex> deck = Cards.create_deck
      ["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades",
       "Five of Spades", "Ace of Clubs", "Two of Clubs", "Three of Clubs",
       "Four of Clubs", "Five of Clubs", "Ace of Hearts", "Two of Hearts",
       "Three of Hearts", "Four of Hearts", "Five of Hearts", "Ace of Diamonds",
       "Two of Diamonds", "Three of Diamonds", "Four of Diamonds", "Five of Diamonds"]
  """

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Shuffles the playing cards, given a deck as a argument

  ## Examples

      iex> deck = Cards.create_deck
      iex> deck = Cards.shuffle(deck)
  """

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  # [ color1, color2 ] = [ "red", "blue" ]

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `handsize` argument indicates how many cards should be in the hand.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, rest_of_deck} = Cards.deal(deck, 5)
      iex> hand
      ["Two of Hearts", "Three of Diamonds", "Five of Spades", "Five of Diamonds", "Ace of Diamonds"]
  """

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

  # pattern matching in case statements

  # def load(filename) do
  #   {status, binary} = File.read(filename)
  #   case status do
  #     :ok -> :erlang.binary_to_term binary
  #     :error -> "That file does not exist"
  #   end
  # end

  # better

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"
    end
  end

  # iex(4)> ["red", color] = ["red", "blue"]
  # ["red", "blue"]
  # iex(5)> color
  # "blue"
  # iex(6)> red
  # ** (CompileError) iex:6: undefined function red/0

  # iex(6)> ["red", color] = ["green", "blue"]
  # ** (MatchError) no match of right hand side value: ["green", "blue"]

  # pipe operator

  def create_hand(hand_size) do
    # deck = Cards.create_deck
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck, hand_size)

    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
