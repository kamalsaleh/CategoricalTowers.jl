install:
	julia -e 'using Pkg; \
		Pkg.develop(path = "ToolsForCategoricalTowers"); \
	'

test:
	$(MAKE) -C ToolsForCategoricalTowers test

update-subsplits:
	./dev/manually_update_subsplits.sh

