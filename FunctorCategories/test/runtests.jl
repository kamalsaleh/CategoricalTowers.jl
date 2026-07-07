using Test, Documenter, FunctorCategories

# test upto whitespaces
doctest(FunctorCategories; doctestfilters=[r"\s+" => ""])
