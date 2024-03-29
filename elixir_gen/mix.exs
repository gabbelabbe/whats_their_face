defmodule WhatstheirfaceUserGenerator.MixProject do
  use Mix.Project

  def project do
    [
      app: :whatstheirface_user_generator,
      version: "0.1.0",
      elixir: "~> 1.9.0",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      # Added escript
      escript: [main_module: WhatsTheirFaceUserGenerator.CLI],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [{:httpoison, "~> 1.5"}, {:poison, "~> 3.1"}]
  end
end
