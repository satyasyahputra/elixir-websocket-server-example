defmodule WebSocket do
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      {Riverside, [handler: WebSocketHandler]}
    ]

    opts = [strategy: :one_for_one, name: WebSocket.Supervisor]
    Logger.info("application started")
    Supervisor.start_link(children, opts)
  end
end
