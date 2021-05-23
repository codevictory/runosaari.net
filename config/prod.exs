import Config

config :runosaari, RunosaariWeb.Endpoint,
  url: [host: "runosaari.net", port: 3000],
  cache_static_manifest: "priv/static/cache_manifest.json"

# Do not print debug messages in production
config :logger, level: :info
