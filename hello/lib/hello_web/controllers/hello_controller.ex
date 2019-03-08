defmodule HelloWeb.HelloController do
    use HelloWeb, :controller

    def message(conn, %{"data" => data}) do
        render conn, "hello.html", data: data
    end
end