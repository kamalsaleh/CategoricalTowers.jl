install:
	julia -e 'using Pkg; \
		Pkg.develop(path = "ToolsForCategoricalTowers"); \
		Pkg.develop(path = "QuotientCategories"); \
		Pkg.develop(path = "FpCategories"); \
	'

test:
	$(MAKE) -C ToolsForCategoricalTowers test
	$(MAKE) -C QuotientCategories test
	$(MAKE) -C FpCategories test

update-subsplits:
	./dev/manually_update_subsplits.sh

