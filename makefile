install:
	@for dir in $(shell find . -mindepth 1 -maxdepth 1 -type d ! -name dev ! -name '.*'); do \
		$(MAKE) -C $$dir install; \
	done

gen:
	@for dir in $(shell find . -mindepth 1 -maxdepth 1 -type d ! -name dev ! -name '.*'); do \
		$(MAKE) -C $$dir gen; \
	done

clean-gen:
	@for dir in $(shell find . -mindepth 1 -maxdepth 1 -type d ! -name dev ! -name '.*'); do \
		$(MAKE) -C $$dir clean-gen; \
	done

test:
	@for dir in $(shell find . -mindepth 1 -maxdepth 1 -type d ! -name dev ! -name '.*'); do \
		$(MAKE) -C $$dir test; \
	done

update-subsplits:
	./dev/manually_update_subsplits.sh

