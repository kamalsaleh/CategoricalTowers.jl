using Test, Documenter, FinSetsForCAP, PresheafCategories

# test upto whitespaces
doctest(PresheafCategories; doctestfilters=[r"\s+" => ""])
