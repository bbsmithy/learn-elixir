defmodule Math do
  def add(a, b) do
    receive do
      senders_pid ->
        send(senders_pid, a + b)
    end
  end

  def say_animal() do
    animal = %{
      name: "Rex",
      type: "dog",
      legs: 4
    }

    animal = Map.put(animal, :name, "DORTY BOI")

    %{animal | name: "Max"}

  end

  def double(n) do
    IO.inspect("Running double")
    # Output of spawn n=2 is (2+2) 4, and PID
    spawn(Math, :add, [n,n])
    |> send(self())

    # Spawn the process starts with param (a, b) but doesnt do anything other than return PID
    # Send is called with PID of add (destination) and PID of double (message)
    # Add process then receives the message (PID of double) and sends back result of a+b to double process

    receive do
      doubled ->
        doubled
    end
  end

end
