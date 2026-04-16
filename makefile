install:
	julia -e 'using Pkg; \
		Pkg.develop(path = "ToolsForCategoricalTowers"); \
		Pkg.develop(path = "QuotientCategories"); \
		Pkg.develop(path = "FpCategories"); \
		Pkg.develop(path = "FpLinearCategories"); \
		Pkg.develop(path = "Locales"); \
	'

gen:
	$(MAKE) -C ToolsForCategoricalTowers gen
	$(MAKE) -C QuotientCategories gen
	$(MAKE) -C FpCategories gen
	$(MAKE) -C FpLinearCategories gen
	$(MAKE) -C Locales gen

gen-full:
	$(MAKE) -C ToolsForCategoricalTowers gen-full
	$(MAKE) -C QuotientCategories gen-full
	$(MAKE) -C FpCategories gen-full
	$(MAKE) -C FpLinearCategories gen-full
	$(MAKE) -C Locales gen-full

test:
	$(MAKE) -C ToolsForCategoricalTowers test
	$(MAKE) -C QuotientCategories test
	$(MAKE) -C FpCategories test
	$(MAKE) -C FpLinearCategories test
	$(MAKE) -C Locales test

git-commit:
	$(MAKE) -C ToolsForCategoricalTowers git-commit
	$(MAKE) -C QuotientCategories git-commit
	$(MAKE) -C FpCategories git-commit
	$(MAKE) -C FpLinearCategories git-commit
	$(MAKE) -C Locales git-commit

update-subsplits:
	./dev/manually_update_subsplits.sh
