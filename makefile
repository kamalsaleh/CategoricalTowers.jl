install:
	julia -e 'using Pkg; \
		Pkg.develop(path = "ToolsForCategoricalTowers"); \
	'

gen:
	$(MAKE) -C ToolsForCategoricalTowers gen

clean-gen:
	$(MAKE) -C ToolsForCategoricalTowers clean-gen

test:
	$(MAKE) -C ToolsForCategoricalTowers test

update-subsplits:
	./dev/manually_update_subsplits.sh

