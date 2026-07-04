using Test, Documenter, FiniteCocompletions

# test upto whitespaces
doctest(FiniteCocompletions; doctestfilters=[r"\s+" => ""])
