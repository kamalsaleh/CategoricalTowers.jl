install:
	julia -e 'using Pkg; \
		Pkg.develop(path = "ToolsForCategoricalTowers"); \
		Pkg.develop(path = "QuotientCategories"); \
		Pkg.develop(path = "FpCategories"); \
		Pkg.develop(path = "FpLinearCategories"); \
		Pkg.develop(path = "Locales"); \
		Pkg.develop(path = "SubcategoriesForCAP"); \
		Pkg.develop(path = "PresheafCategories"); \
		Pkg.develop(path = "FiniteCocompletions"); \
		Pkg.develop(path = "FunctorCategories"); \
	'

gen:
	$(MAKE) -C ToolsForCategoricalTowers gen
	$(MAKE) -C QuotientCategories gen
	$(MAKE) -C FpCategories gen
	$(MAKE) -C FpLinearCategories gen
	$(MAKE) -C Locales gen
	$(MAKE) -C SubcategoriesForCAP gen
	$(MAKE) -C PresheafCategories gen
	$(MAKE) -C FiniteCocompletions gen
	$(MAKE) -C FunctorCategories gen


gen-full:
	$(MAKE) -C ToolsForCategoricalTowers gen-full
	$(MAKE) -C QuotientCategories gen-full
	$(MAKE) -C FpCategories gen-full
	$(MAKE) -C FpLinearCategories gen-full
	$(MAKE) -C Locales gen-full
	$(MAKE) -C SubcategoriesForCAP gen-full
	$(MAKE) -C PresheafCategories gen-full
	$(MAKE) -C FiniteCocompletions gen-full
	$(MAKE) -C FunctorCategories gen-full

test:
	$(MAKE) -C ToolsForCategoricalTowers test
	$(MAKE) -C QuotientCategories test
	$(MAKE) -C FpCategories test
	$(MAKE) -C FpLinearCategories test
	$(MAKE) -C Locales test
	$(MAKE) -C SubcategoriesForCAP test
	$(MAKE) -C PresheafCategories test
	$(MAKE) -C FiniteCocompletions test
	$(MAKE) -C FunctorCategories test

git-commit:
	$(MAKE) -C ToolsForCategoricalTowers git-commit
	$(MAKE) -C QuotientCategories git-commit
	$(MAKE) -C FpCategories git-commit
	$(MAKE) -C FpLinearCategories git-commit
	$(MAKE) -C Locales git-commit
	$(MAKE) -C SubcategoriesForCAP git-commit
	$(MAKE) -C PresheafCategories git-commit
	$(MAKE) -C FiniteCocompletions git-commit
	$(MAKE) -C FunctorCategories git-commit

update-subsplits:
	./dev/manually_update_subsplits.sh
