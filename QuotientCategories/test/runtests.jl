using Test, Documenter, ModulePresentationsForCAP, QuotientCategories

# test upto whitespaces
doctest(QuotientCategories; doctestfilters=[r"\s+" => ""])
