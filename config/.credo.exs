%{
  configs: [
    %{
      name: "default",
      files: %{
        included: ["lib/", "test/"],
        excluded: ["deps/"]
      },
      requires: [],
      strict: true,
      color: true,
      checks: [
        {Credo.Check.Readability.AliasAs, []},
        {Credo.Check.Readability.SinglePipe, []},
        {Credo.Check.Readability.Specs, []},

        # disabled checks
        {Credo.Check.Readability.ModuleDoc, false},
        {Credo.Check.Refactor.MapInto, false},
        {Credo.Check.Warning.LazyLogging, false}
      ]
    }
  ]
}
