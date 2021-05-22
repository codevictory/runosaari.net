import Config

database_name =
  System.get_env("DATABASE_NAME") ||
    raise """
    environment variable DATABASE_NAME is missing.
    For example: runosaari
    """

database_socket_dir =
  System.get_env("DATABASE_SOCKET_DIR") ||
    raise """
    environment variable DATABASE_SOCKET_DIR is missing.
    For example: /var/run/postgresql
    """

config :runosaari, Runosaari.Repo,
  # ssl: true,
  database: database_name,
  socket_dir: database_socket_dir,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :runosaari, RunosaariWeb.Endpoint,
  http: [
    port: String.to_integer(System.get_env("PORT") || "4000"),
    transport_options: [socket_opts: [:inet6]]
  ],
  secret_key_base: secret_key_base

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
config :runosaari, RunosaariWeb.Endpoint, server: true
