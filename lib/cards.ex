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
    values = ["Ace", "Two", "Three"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for value <- values do
      for suit <- suits do
        "#{value} of #{suit}"
      end
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end


end
