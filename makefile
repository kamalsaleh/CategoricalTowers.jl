install:
	julia -e 'using Pkg; \
		Pkg.develop(path = "ToolsForCategoricalTowers"); \
		Pkg.develop(path = "QuotientCategories"); \
	'

gen:
	$(MAKE) -C ToolsForCategoricalTowers gen
	$(MAKE) -C QuotientCategories gen

gen-full:
	$(MAKE) -C ToolsForCategoricalTowers gen-full
	$(MAKE) -C QuotientCategories gen-full

test:
	$(MAKE) -C ToolsForCategoricalTowers test
	$(MAKE) -C QuotientCategories test

git-commit:
	$(MAKE) -C ToolsForCategoricalTowers git-commit
	$(MAKE) -C QuotientCategories git-commit

update-subsplits:
	./dev/manually_update_subsplits.sh
