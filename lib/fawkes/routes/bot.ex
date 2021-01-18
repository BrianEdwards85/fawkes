
defmodule Fawkes.Routes.Bot do
  use Fawkes.Routes.Base

  get "/" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(message()))
  end

  defp message do
    %{
      response_type: "in_channel",
      text: "Hello from BOTTER :)"
    }
  end
end
