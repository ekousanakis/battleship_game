defmodule BattleshipGameWeb.EventView do
  use BattleshipGameWeb, :view

  def format_date(date) do
    # date |> IO.inspect
    "#{date.year}/#{date.month}/#{date.day}"
  end
end

