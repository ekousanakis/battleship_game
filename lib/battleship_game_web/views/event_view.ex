defmodule BattleshipGameWeb.EventView do
  use BattleshipGameWeb, :view

  def format_date(nil) do
       "-"
  end
  def format_date(date) do
    "#{date.year}/#{date.month}/#{date.day}"
  end
end

