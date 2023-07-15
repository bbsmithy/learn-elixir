defmodule Cars do
  @moduledoc """
  Documentation for `Cars`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cars.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  `create_garage/0` returns a list of garage cars

  ## Examples

      iex> cars.create_garage
      ["lion", "tiger", "gorilla", "elephant", "monkey", "giraffe"]
  """

  def create_garage do
    ["BMW", "Mercedes", "Audi", "VW", "Porsche", "Opel"]
  end

  @doc """
  randomise takes a list of garage cars and returns a new randomised list with
  the same elements as the first.

  ## Examples

    iex> garage = cars.create_garage
    iex> cars.randomise(garage)
    ["monkey", "tiger", "elephant", "gorilla", "giraffe", "lion"]

  """
  def randomise(garage) do
    Enum.shuffle(garage)
  end

  @doc """
  contains? takes a list of garage cars and a single car and returns a boolean
  as to whether or not the list contains the given car.

  ## Examples

      iex> garage = cars.create_garage
      iex> cars.contains?(garage, "gorilla")
      true
  """
  def contains?(garage, car) do
    Enum.member?(garage, car)
  end

  @doc """
  see_cars takes a list of garage cars and the number of cars that
  you want to see and then returns a list

  ## Examples

      iex> garage = cars.create_garage
      iex> cars.see_cars(garage, 2)
      ["monkey", "giraffe"]
  """
  def see_cars(garage, count) do
    # Enum.split returns a tuple so we have to pattern match on the result
    # to get the value we want out
    {_seen, to_see} = Enum.split(garage, -count)
    to_see
  end

  @doc """
  save takes a list of garage cars and a filename and saves the list to that file

  ## Examples

      iex> garage = cars.create_garage
      iex> cars.save(garage, "my_cars")
      :ok
  """
  def save(garage, filename) do
    # erlang is converting the garage list to something that can be written to the
    # file system
    binary = :erlang.term_to_binary(garage)
    File.write(filename, binary)
  end

  @doc """
  load takes filename and returns a list of cars if the file exists

  ## Examples

      iex> cars.load("my_cars")
      ["lion", "tiger", "gorilla", "elephant", "monkey", "giraffe"]
      iex> cars.load("aglkjhdfg")
      "File does not exist"

  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File does not exist"
    end
  end

  @doc """
  selection takes a number, creates a garage, randomises it and then returns a list
  of cars of length selected

  """
  def selection(number_of_cars) do
    Cars.create_garage
    |> Cars.randomise
    |> Cars.see_cars(number_of_cars)
  end

end
