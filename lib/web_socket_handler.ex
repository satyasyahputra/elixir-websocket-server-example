defmodule WebSocketHandler do
  use Riverside, otp_app: :websocket

  @impl Riverside
  def authenticate(request) do
    user = request.queries["from"]
    channel = request.queries["ch"]
    {:ok, user, %{"channel" => channel}}
  end

  @impl Riverside
  def init(session, state) do
    channel = state["channel"]
    Riverside.LocalDelivery.join_channel(channel)
    {:ok, session, state}
  end

  @impl Riverside
  def handle_message(msg, session, state) do

    payload = %{
      "from" => session.user_id,
      "to" => state["channel"],
      "body" => msg
    }

    Riverside.LocalDelivery.deliver(
      {:channel, state["channel"]},
      {:text, Poison.encode!(payload)}
    )

    {:ok, session, state}

  end

  @impl Riverside
  def terminate(reason, session, state) do
    Logger.info("terminate reason: #{reason}")
    :ok
  end

end